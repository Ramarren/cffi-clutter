(in-package :cffi-clutter)

;; wrap callbacks in dispatcher function to enable use of lisp functions
;; signals are disconnected when objects are freed
;; note that signals connected to stage just pile up if not disconnected, since the default stage
;; is created once on init-clutter

(defvar *callbacks* (make-hash-table))
(defvar *callback-counter* 0)

(defcallback clutter-event-callback gboolean
    ((actor :pointer) (event :pointer) (user-data :pointer))
  (let ((lisp-callback (car (gethash (mem-ref user-data :uint64) *callbacks*))))
    (if (null lisp-callback)
        +false+
        (let ((result (funcall lisp-callback actor event)))
          (if result +true+ +false+)))))

(defparameter *lisp-signal-wrappers*
  (list (callback clutter-event-callback)))

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
                          (cenum-collect-values flags 'g-connect-flags)))

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

(defun disconnect-lisp-signals (instance)
  (dolist (c-dispatch *lisp-signal-wrappers*)
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
     (cenum-collect-values '(:func :data) 'g-signal-match-type)
     0
     0
     (null-pointer)
     (third lisp-callback)
     (second lisp-callback))))
