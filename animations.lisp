(in-package :cffi-clutter)

(defun g-type-for-object-property (object property)
  (let ((param-spec (%g-object-class-find-property
                       (foreign-slot-value object 'g-type-instance 'g-class)
                       property)))
    (if (null-pointer-p)
        (error "Object ~a of type ~a does not have property ~s"
               object
               (%g-type-name (g-type-from-instance object))
               property)
        (foreign-slot-value param-spec 'g-param-spec 'value-type))))

(defun call-with-properties (function actor properties)
  (assert (zerop (mod (length properties) 2)))
  (when properties
    (let ((n (/ (length properties) 2)))
      (with-foreign-objects ((string-array :pointer n))
        (with-g-value-block (g-values g-values-pointer n)
          (loop for (property value . nil) on properties by #'cddr
                for i from 0
                do (setf (mem-aref string-array :pointer i)
                         (foreign-string-alloc property))
                do (init-g-value-in-block g-values i (g-type-for-object-property actor property) value))
          (unwind-protect
               (funcall function n string-array g-values-pointer)
            (loop for i from 0 below n
                  do (foreign-string-free (mem-aref string-array :pointer i)))))))))

(defun animate-actor (actor mode duration &rest properties)
  (call-with-properties (curry #'%actor-animatev actor mode duration) actor properties))

(defun animate-actor-with-timeline (actor mode timeline &rest properties)
  (call-with-properties (curry #'%actor-animate-with-timelinev actor mode timeline) actor properties))

(defun animate-actor-with-alpha (actor alpha &rest properties)
  (call-with-properties (curry #'%actor-animate-with-alphav actor alpha) actor properties))
