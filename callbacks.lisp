(in-package :cffi-clutter)

(defvar *callbacks* (make-hash-table))
(defvar *callback-counter* 0)

(defcallback clutter-event-callback gboolean
    ((actor :pointer) (event :pointer) (user-data :pointer))
  (let ((lisp-callback (gethash (mem-ref user-data :uint64) *callbacks*)))
    (if (null lisp-callback)
        +false+
        (let ((result (funcall lisp-callback actor event)))
          (if result +true+ +false+)))))

(defcallback unregister-callback :void
    ((data :pointer) (closure :pointer))
  (declare (ignore closure))
  (remhash (mem-ref data :uint64) *callbacks*)
  (foreign-free data))

(defun connect-signal (instance detailed-signal lisp-handler &key (flags nil))
  (setf (gethash *callback-counter* *callbacks*) lisp-handler)
  (let ((foreign-counter (foreign-alloc :uint64 :initial-element *callback-counter*)))
    (g-signal-connect instance
                      detailed-signal
                      (callback clutter-event-callback)
                      :data foreign-counter
                      :destroy-data (callback unregister-callback)
                      :flags flags)))