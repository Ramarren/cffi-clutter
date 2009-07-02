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

(defcallback unregister-callback :void
    ((data :pointer) (closure :pointer))
  (declare (ignore closure))
  (remhash (mem-ref data :uint64) *callbacks*)
  (foreign-free data))

(defun connect-lisp-handler (instance detailed-signal lisp-handler c-dispatch &key (flags nil))
  (let ((foreign-counter (foreign-alloc :uint64 :initial-element *callback-counter*)))
    (setf (gethash *callback-counter* *callbacks*)
          (cons lisp-handler foreign-counter))
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
  (%g-signal-handlers-disconnect-matched
   instance
   :func
   0
   0
   (null-pointer)
   (callback clutter-event-callback)
   (null-pointer)))

(defun disconnect-lisp-signal (instance callback-number)
  "Disconnect signal using Lisp side callback number (returned by connect-signal)"
  (let ((lisp-callback-cons (gethash callback-number *callbacks*)))
    (assert lisp-callback-cons)
    (assert (eql (mem-ref (cdr lisp-callback-cons) :uint64) callback-number))
    (%g-signal-handlers-disconnect-matched
     instance
     (cenum-collect-values '(:func :data) 'g-signal-match-type)
     0
     0
     (null-pointer)
     (callback clutter-event-callback)
     (cdr lisp-callback-cons))))
