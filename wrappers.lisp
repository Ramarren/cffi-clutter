(in-package :cffi-clutter)

;; mid-level bindings
;; I don't think there is much point in wrapping pointers with objects at this level

(defun event-get-coords (event)
  (with-foreign-objects ((x :float) (y :float))
    (%event-get-coords event x y)
    (list (mem-ref x :float) (mem-ref y :float))))

;; on the other hand, is there a point of those single line wrappers?
(declaim (inline make-color free-color copy-color))
(defun make-color (red green blue &optional (alpha 255))
  (%color-new red green blue alpha))

(defun free-color (color)
  (%color-free color))

(defun copy-color (color)
  (%color-copy color))

(defmacro with-color ((var red green blue &optional (alpha 255)) &body body)
  `(let ((,var (make-color ,red ,green ,blue ,alpha)))
     (unwind-protect (progn ,@body)
       (free-color ,var))))

(defun init-clutter (&rest clutter-argument-list)
  (if clutter-argument-list
      (let ((argc (length clutter-argument-list))
	    (argvs (mapcar #'foreign-string-alloc clutter-argument-list)))
	(with-foreign-objects ((argc-pointer :int)
                               (argv-pointer :pointer argc))
          (iter (for p in argvs)
                (for i from 0)
                (setf (mem-aref argv-pointer :pointer i) p))
          (setf (mem-ref argc-pointer :int) argc)
          (unwind-protect
               (%init argc-pointer argvs)
            (mapc #'foreign-string-free argvs))))
      (with-foreign-object (argc :int)
        (setf (mem-ref argc :int) 0)
        (%init argc (null-pointer)))))
