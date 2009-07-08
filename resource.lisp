(in-package :cffi-clutter)

;;; create system for mapping lisp objects to-from integers, so that references to them can be
;;; easily stored C-side

;;; resources held in lists (?) (resource number pointer-to-foreign-number)
(defvar *resources* (make-array 32 :initial-element nil))
(defvar *resource-counter* 0)

(declaim (inline get-resource-meta-by-number get-resource-meta
                 resource resource-by-number (setf resource) (setf resource-by-number)))

(defun get-resource-meta-by-number (n)
  (svref *resources* n))

(defun resource-by-number (n)
  (car (get-resource-meta-by-number n)))

(defun get-resource-meta (foreign-pointer)
  (get-resource-meta-by-number (mem-ref foreign-pointer :uint64)))

(defun resource (foreign-pointer)
  (resource-by-number (mem-ref foreign-pointer :uint64)))

(defun (setf resource) (new-value foreign-pointer)
  (setf (car (get-resource-meta foreign-pointer)) new-value))

(defun (setf resource-by-number) (new-value n)
  (setf (car (get-resource-meta-by-number n)) new-value))

(defun grow-resource-array ()
  (let ((new-array (make-array (* 2 (length *resources*)) :initial-element nil))
        (old-array *resources*))
    (loop for i from 0 below *resource-counter*
          do (setf (svref new-array i)
                   (svref old-array i)))))

(defun shrink-resource-array ()
  (let ((old-array *resources*))
    (assert (> (/ (length old-array) 2) *resource-counter*))
    (let ((new-array (make-array (/ (length old-array) 2))))
      (loop for i from 0 below *resource-counter*
            do (setf (svref new-array i)
                     (svref old-array i))))))

(defun register-resource (resource foreign-pointer)
  (let ((n *resource-counter*))
    (when (= (length *resources*) n)
      (grow-resource-array))
    (setf (svref *resources* n) (list resource n foreign-pointer)
          (mem-ref foreign-pointer :uint64) n)
    (incf *resource-counter*)
    (values n)))

(defun move-resource (from to)
  (assert (null (svref *resources* to)))
  (destructuring-bind (resource n foreign-pointer) (svref *resources* from)
    (assert (= n from))
    (setf (svref *resources* to) (list resource to foreign-pointer)
          (mem-ref foreign-pointer :uint64) to
          (svref *resources* from) nil)))

(defun unregister-resource (foreign-pointer)
  (destructuring-bind (resource i f-pointer) (get-resource-meta foreign-pointer)
    (declare (ignore resource f-pointer))
    (setf (svref *resources* i) nil)
    (decf *resource-counter*)
    (unless (eql i *resource-counter*)
      (move-resource *resource-counter* i))
    (when (< (* 4 *resource-counter*)
             (length *resources*))
      (shrink-resource-array))))
