(in-package :cffi-clutter)

;; mid-level bindings
;; I don't think there is much point in wrapping pointers with objects at this level

(defun event-get-coords (event)
  (with-foreign-objects ((x :float) (y :float))
    (%event-get-coords event x y)
    (list (mem-ref x :float) (mem-ref y :float))))

;; on the other hand, is there a point of those single line wrappers?
(declaim (inline make-color free-color copy-color set-color))
(defun make-color (red green blue &optional (alpha 255))
  (%color-new red green blue alpha))

(defun free-color (color)
  (%color-free color))

(defun copy-color (color)
  (%color-copy color))

(defun set-color (color r g b &optional (a 255))
  (setf (foreign-slot-value color 'color 'red) r
        (foreign-slot-value color 'color 'green) g
        (foreign-slot-value color 'color 'blue) b
        (foreign-slot-value color 'color 'alpha) a)
  color)

(defmacro with-color ((var red green blue &optional (alpha 255)) &body body)
  `(let ((,var (make-color ,red ,green ,blue ,alpha)))
     (unwind-protect (progn ,@body)
       (free-color ,var))))

(defmacro with-colors (color-specs &body body)
  (if (cdr color-specs)
      `(with-color ,(car color-specs)
         (with-colors ,(cdr color-specs) ,@body))
      `(with-color ,(car color-specs)
         ,@body)))

(defvar *clutter-initialized* nil)

(defun init-clutter (&key (clutter-argument-list nil) (threading t))
  (unless *clutter-initialized*
    (setf *clutter-initialized* t)
    (when threading
      (%g-thread-init (null-pointer))
      (%threads-init))
    (if clutter-argument-list
        (let ((argc (length clutter-argument-list))
              (argvs (mapcar #'foreign-string-alloc clutter-argument-list)))
          (with-foreign-objects ((argc-pointer :int)
                                 (argv-pointer :pointer argc))
            (loop for p in argvs
                  for i from 0
                  do (setf (mem-aref argv-pointer :pointer i) p))
            (setf (mem-ref argc-pointer :int) argc)
            (unwind-protect
                 (%init argc-pointer argvs)
              (mapc #'foreign-string-free argvs))))
        (with-foreign-object (argc :int)
          (setf (mem-ref argc :int) 0)
          (%init argc (null-pointer))))))

(defun main-with-cleanup (stage &rest objects-to-unref)
  (%actor-show stage)
  (%main)
  (add-idle (compose (constantly nil)
                     #'%main-quit))
  (%group-remove-all stage)
  (disconnect-lisp-signals stage)
  (%actor-hide stage)
  (dolist (object objects-to-unref)
    (%g-object-unref object))
  (%main))

(defun animation-mode (mode)
  (if (keywordp mode)
      (foreign-enum-value 'animation-mode mode)
      mode))

(defun alpha-set-mode (alpha mode)
  (%alpha-set-mode alpha (animation-mode mode)))
