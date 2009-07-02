(in-package :cffi-clutter)

;; wrap callbacks in dispatcher function to enable use of lisp functions
;; signals are disconnected when objects are freed
;; note that signals connected to stage just pile up if not disconnected, since the default stage
;; is created once on init-clutter

(defvar *callbacks* (make-hash-table))
(defvar *callback-counter* 0)

(declaim (inline call-lisp-callback))
(defun call-lisp-callback (user-data &rest arguments)
  (let ((lisp-callback (car (gethash (mem-ref user-data :uint64) *callbacks*))))
    (if (null lisp-callback)
        (warn "Tried to call inexistent callback nr. ~a" (mem-ref user-data :uint64))
        (apply lisp-callback arguments))))

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

(defcallback unregister-callback :void
    ((data :pointer) (closure :pointer))
  (declare (ignore closure))
  (remhash (mem-ref data :uint64) *callbacks*)
  (foreign-free data))

(defun g-signal-connect (instance detailed-signal c-handler &key (data nil) (destroy-data nil) (flags nil))
  (%g-signal-connect-data instance
                          detailed-signal
                          c-handler
                          (if data data (null-pointer))
                          (if destroy-data destroy-data (null-pointer))
                          flags))

(defun connect-lisp-handler (instance detailed-signal lisp-handler c-dispatch &key (flags nil))
  (let ((foreign-counter (foreign-alloc :uint64 :initial-element *callback-counter*)))
    (setf (gethash *callback-counter* *callbacks*)
          (list lisp-handler foreign-counter c-dispatch))
    (g-signal-connect instance
                      detailed-signal
                      c-dispatch
                      :data foreign-counter
                      :destroy-data (callback unregister-callback)
                      :flags flags))
  (1- (incf *callback-counter*)))

(defun connect-event-handler (instance detailed-signal lisp-handler &key (flags nil))
  (connect-lisp-handler instance detailed-signal lisp-handler (callback clutter-event-callback) :flags flags))

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
  "Disconnect signal using Lisp side callback number (returned by connect-signal)"
  (let ((lisp-callback (gethash callback-number *callbacks*)))
    (assert lisp-callback)
    (assert (eql (mem-ref (second lisp-callback) :uint64) callback-number))
    (%g-signal-handlers-disconnect-matched
     instance
     '(:func :data)
     0
     0
     (null-pointer)
     (third lisp-callback)
     (second lisp-callback))))
