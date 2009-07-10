(in-package :cffi-clutter)

;;; Simple garbage pools to generalize memory management, since in many cases (behaviours) precise
;;; control over dynamic extent of objects may be necessary. This pools assume that they contain
;;; only GObjects, which will be g-object-unref'ed when the pool lifetime ends.

(defclass gobject-garbage-pool ()
  ((gobjects :accessor gobjects-of :initform (make-hash-table))
   (name :accessor name-of :initform "Anonymous pool" :initarg :name)))

(defmethod print-object ((object gobject-garbage-pool) stream)
  (print-unreadable-object (object stream :type t :identity t)
    (format stream "GOBJ: ~a" (hash-table-count (gobjects-of object)))))

(defvar *current-pool* (make-instance 'gobject-garbage-pool :name "Top level pool"))

(defgeneric cleanup-pool (pool)
  (:method ((pool gobject-garbage-pool))
    (maphash #'(lambda (key value)
                 (dotimes (i value)
                   (g-object-unref key)))
             (gobjects-of pool))
    (setf (gobjects-of pool) (make-hash-table))
    pool))

(defmacro with-pool (pool &body body)
  `(let ((*current-pool* ,pool))
     (unwind-protect (progn ,@body)
       (cleanup-pool *current-pool*))))

(defmacro with-new-pool (name &body body)
  `(with-pool (make-instance 'gobject-garbage-pool :name ,name)
     ,@body))

(defun pool (object &optional (pool *current-pool*))
  (incf (gethash object (gobjects-of pool) 0))
  object)

(defun unpool (object &optional (pool *current-pool*))
  (let ((pool-count (gethash object (gobjects-of pool))))
    (cond ((null pool-count)
           (error "Tried to unpool object which was not pooled."))
          ((= 1 pool-count)
           (remhash object (gobjects-of pool)))
          (t (decf (gethash object (gobjects-of pool))))))
  object)

(defun unpool-unref (object &optional (pool *current-pool*))
  (unpool object pool)
  (g-object-unref object)
  (values))
