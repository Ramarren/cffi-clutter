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

(defun get-color (color)
  (list (foreign-slot-value color 'color 'red)
        (foreign-slot-value color 'color 'green)
        (foreign-slot-value color 'color 'blue)
        (foreign-slot-value color 'color 'alpha)))

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

;; if threads are not initialized %threads-enter/leave are a noop on C level
;; it doesn't need to be called in callbacks or threads-idle etc.
(defmacro with-clutter-lock (&body body)
  `(progn
     (%threads-enter)
     (unwind-protect (progn ,@body)
       (%threads-leave))))

(defun animation-mode (mode)
  (if (keywordp mode)
      (foreign-enum-value 'animation-mode mode)
      mode))

(defun alpha-set-mode (alpha mode)
  (%alpha-set-mode alpha (animation-mode mode)))

(defun make-behaviour-path-with-knots (alpha &rest knots-xy)
  (assert (zerop (mod (length knots-xy) 2)))
  (let ((n (/ (length knots-xy) 2)))
    (let ((knots (foreign-alloc 'knot :count n)))
      (loop for (x y . nil) on knots-xy by #'cddr
            for i from 0
            do (let ((knot (mem-aref knots 'knot i)))
                 (setf (foreign-slot-value knot 'knot 'x) x
                       (foreign-slot-value knot 'knot 'y) y)))
      (%behaviour-path-new-with-knots alpha knots n))))

(defun get-preferred-size (actor)
  (with-foreign-objects ((min-width :float)
                         (min-height :float)
                         (natural-width :float)
                         (natural-height :float))
    (%actor-get-preferred-size actor min-width min-height natural-width natural-height)
    (values (mem-ref min-width :float) (mem-ref min-height :float)
            (mem-ref natural-width :float) (mem-ref natural-height :float))))

(defun get-preferred-width (actor for-height)
  (with-foreign-objects ((min-width :float)
                         (natural-width :float))
    (%actor-get-preferred-width actor for-height min-width  natural-width)
    (values (mem-ref min-width :float) 
            (mem-ref natural-width :float))))

(defun get-preferred-height (actor for-width)
  (with-foreign-objects ((min-height :float)
                         (natural-height :float))
    (%actor-get-preferred-height actor for-width min-height  natural-height)
    (values (mem-ref min-height :float) 
            (mem-ref natural-height :float))))


(defun get-size (actor)
  (with-foreign-objects ((width :float)
                         (height :float))
    (%actor-get-size actor width height)
    (values (mem-ref width :float) 
            (mem-ref height :float)))) 

(defun get-actor-at-position (stage pick-mode x y)
  (let ((result (%stage-get-actor-at-pos stage pick-mode x y)))
    (if (null-pointer-p result)
        nil
        result)))

(defun score-append (score parent timeline)
  (%score-append score (if parent parent (null-pointer)) timeline))

(defun get-geometry (actor)
  (with-foreign-object (geometry 'geometry)
    (%actor-get-geometry actor geometry)
    (list (foreign-slot-value geometry 'geometry 'x)
          (foreign-slot-value geometry 'geometry 'y)
          (foreign-slot-value geometry 'geometry 'width)
          (foreign-slot-value geometry 'geometry 'height))))
