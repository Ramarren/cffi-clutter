(in-package :cffi-clutter)

;; wrap callbacks in dispatcher function to enable use of lisp functions
;; signals are disconnected when objects are freed
;; note that signals connected to stage just pile up if not disconnected, since the default stage
;; is created once on init-clutter

(declaim (inline call-lisp-callback))
(defun call-lisp-callback (user-data &rest arguments)
  (let ((lisp-callback (car (resource user-data))))
    (apply lisp-callback arguments)))

;;; Now add callback wrappers for all Clutter signal signatures

(defcallback clutter-event-callback gboolean
    ((actor :pointer) (event :pointer) (user-data :pointer))
  (if (call-lisp-callback user-data actor event)
      +true+
      +false+))

(defcallback allocation-changed-callback :void
    ((actor :pointer) (box :pointer) (flags allocation-flags-composite-enum) (user-data :pointer))
  (call-lisp-callback user-data actor box flags))

(defcallback one-pointer-callback :void
    ((instance :pointer) (user-data :pointer))
  (call-lisp-callback user-data instance))

(defcallback two-pointer-callback :void
    ((instance1 :pointer) (instance2 :pointer) (user-data :pointer))
  (call-lisp-callback user-data instance1 instance2))

(defcallback spatial-change-callback :void
    ((instance :pointer) (width gint) (height gint) (user-data :pointer))
  (call-lisp-callback user-data instance width height))

(defcallback marker-reached-callback :void
    ((timeline :pointer) (marker-name :string) (msecs gint) (user-data :pointer))
  (call-lisp-callback user-data timeline marker-name msecs))

(defcallback new-frame-callback :void
    ((timeline :pointer) (msecs gint) (user-data :pointer))
  (call-lisp-callback user-data timeline msecs))

(defcallback knot-reached-callback :void
    ((path-b :pointer) (knot-num guint) (user-data :pointer))
  (call-lisp-callback user-data path-b knot-num))

;; list all callbacks for automatic disconnection of all lisp handlers

(defparameter *lisp-signal-wrappers*
  (list (callback clutter-event-callback)
        (callback allocation-changed-callback)
        (callback one-pointer-callback)
        (callback two-pointer-callback)
        (callback spatial-change-callback)
        (callback marker-reached-callback)
        (callback new-frame-callback)
        (callback knot-reached-callback)))

(defun register-lisp-callback (lisp-callback c-dispatch)
  (let ((foreign-counter (foreign-alloc :uint64)))
    (register-resource (cons lisp-callback c-dispatch) foreign-counter)
    foreign-counter))

(defun unregister-lisp-callback (foreign-counter)
  (unregister-resource foreign-counter)
  (foreign-free foreign-counter)
  (values))

(defcallback unregister-callback :void
    ((data :pointer) (closure :pointer))
  (declare (ignore closure))
  (unregister-lisp-callback data))

(defun g-signal-connect (instance detailed-signal c-handler &key (data nil) (destroy-data nil) (flags nil))
  (%g-signal-connect-data instance
                          detailed-signal
                          c-handler
                          (if data data (null-pointer))
                          (if destroy-data destroy-data (null-pointer))
                          flags))

(defun connect-lisp-handler (instance detailed-signal lisp-handler c-dispatch &key (flags nil))
  (let ((foreign-counter (register-lisp-callback lisp-handler c-dispatch)))
    (g-signal-connect instance
                      detailed-signal
                      c-dispatch
                      :data foreign-counter
                      :destroy-data (callback unregister-callback)
                      :flags flags)
    (mem-ref foreign-counter :uint64)))

(defun connect-event-handler (instance detailed-signal lisp-handler &key (flags nil))
  (connect-lisp-handler instance detailed-signal lisp-handler (callback clutter-event-callback) :flags flags))

(defun connect-new-frame-handler (timeline handler)
  (connect-lisp-handler timeline "new-frame"
                        handler
                        (callback new-frame-callback)))

(defun connect-marker-reached-handler (timeline handler)
  (connect-lisp-handler timeline "marker-reached"
                        handler
                        (callback marker-reached-callback)))

(defun connect-one-pointer-signal (instance detailed-signal handler &key (flags nil))
  (connect-lisp-handler instance detailed-signal handler (callback one-pointer-callback) :flags flags))

(defun connect-two-pointer-signal (instance detailed-signal handler &key (flags nil))
  (connect-lisp-handler instance detailed-signal handler (callback two-pointer-callback) :flags flags))

(defun disconnect-lisp-signals (instance &optional (callbacks *lisp-signal-wrappers*))
  (dolist (c-dispatch (ensure-list callbacks))
    (%g-signal-handlers-disconnect-matched
     instance
     :func
     0
     0
     (null-pointer)
     c-dispatch
     (null-pointer))))

(defun disconnect-lisp-signal (instance callback-number)
  "Disconnect signal using Lisp side callback number (returned by connect function)"
  (destructuring-bind ((lisp-handler . c-dispatch) n counter) (resource-meta-by-number callback-number)
    (declare (ignore lisp-handler n))
    (%g-signal-handlers-disconnect-matched
     instance
     '(:func :data)
     0
     0
     (null-pointer)
     c-dispatch
     counter)))

;; callbacks for idle/timeouts

(defcallback source-callback gboolean
    ((data :pointer))
  (if (call-lisp-callback data)
      +true+
      +false+))

(defcallback destroy-notify-callback :void
    ((data :pointer))
  (unregister-lisp-callback data))

(defun add-idle (idle-function &key (priority +priority-default-idle+))
  (let ((foreign-counter (register-lisp-callback idle-function (callback source-callback))))
    (%threads-add-idle-full priority
                            (callback source-callback)
                            foreign-counter
                            (callback destroy-notify-callback))))

(defun add-timeout (timeout-function interval &key (priority +priority-default+))
    (let ((foreign-counter (register-lisp-callback timeout-function (callback source-callback))))
      (%threads-add-timeout-full priority
                                 interval
                                 (callback source-callback)
                                 foreign-counter
                                 (callback destroy-notify-callback))))

(defun add-frame-source (frame-source-function fps &key (priority +priority-default+))
  (let ((foreign-counter (register-lisp-callback frame-source-function (callback source-callback))))
    (%threads-add-frame-source-full priority
                                    fps
                                    (callback source-callback)
                                    foreign-counter
                                    (callback destroy-notify-callback))))


(defun add-repaint-function (repaint-function)
  (let ((foreign-counter (register-lisp-callback repaint-function (callback source-callback))))
    (%threads-add-repaint-func (callback source-callback)
                               foreign-counter
                               (callback destroy-notify-callback))))

(defun remove-repaint-function (function-id)
  (%threads-remove-repaint-func function-id))

;; alpha functions

(defcallback alpha-callback :double
    ((alpha :pointer) (data :pointer))
  (call-lisp-callback data alpha))

(defun alpha-new-with-function (timeline function)
  (let ((foreign-counter (register-lisp-callback function (callback alpha-callback))))
    (%alpha-new-with-func timeline
                          (callback alpha-callback)
                          foreign-counter
                          (callback destroy-notify-callback))))

(defun alpha-set-function (alpha function)
  (let ((foreign-counter (register-lisp-callback function (callback alpha-callback))))
    (%alpha-set-func alpha
                     (callback alpha-callback)
                     foreign-counter
                     (callback destroy-notify-callback))))

(defun alpha-register-function (function)
  (let ((foreign-counter (register-lisp-callback function (callback alpha-callback))))
    (%alpha-register-func (callback alpha-callback) foreign-counter)))
