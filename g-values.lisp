(in-package :cffi-clutter)

(defun (setf g-value) (new-value g-value)
  (ecase (g-type-to-ffi-type (foreign-slot-value g-value 'g-value 'g-type))
    ((request-mode cogl-pixel-format pango-wrap-mode
                   pango-alignment texture-quality pango-ellipsize-mode
                   rotate-direction rotate-axis gravity)
       (%g-value-set-enum g-value new-value))
    (gboolean (%g-value-set-boolean g-value new-value))
    (gchar (%g-value-set-char g-value new-value))
    (guchar (%g-value-set-uchar g-value new-value))
    (gint (%g-value-set-int g-value new-value))
    (guint (%g-value-set-uint g-value new-value))
    (glong (%g-value-set-long g-value new-value))
    (gulong (%g-value-set-ulong g-value new-value))
    (gint64 (%g-value-set-int64 g-value new-value))
    (guint64 (%g-value-set-uint64 g-value new-value))
    (:float (%g-value-set-float g-value new-value))
    (:double (%g-value-set-double g-value new-value))
    (:string (%g-value-set-string g-value new-value))))

(defun g-value (g-value)
  (let ((g-type (foreign-slot-value g-value 'g-value 'g-type)))
    (let ((ffi-type (g-type-to-ffi-type g-type)))
      (ecase ffi-type
        ((request-mode cogl-pixel-format pango-wrap-mode
                       pango-alignment texture-quality pango-ellipsize-mode
                       rotate-direction rotate-axis gravity)
           (foreign-enum-keyword ffi-type (%g-value-get-enum g-value)))
        (gboolean (%g-value-get-boolean g-value))
        (gchar (%g-value-get-char g-value))
        (guchar (%g-value-get-uchar g-value))
        (gint (%g-value-get-int g-value))
        (guint (%g-value-get-uint g-value))
        (glong (%g-value-get-long g-value))
        (gulong (%g-value-get-ulong g-value))
        (gint64 (%g-value-get-int64 g-value))
        (guint64 (%g-value-get-uint64 g-value))
        (:float (%g-value-get-float g-value))
        (:double (%g-value-get-double g-value))
        (:string (%g-value-get-string g-value))))))

(defun make-g-value (g-type &optional (value 0.0 value-supplied-p))
  (let ((g-value (foreign-alloc 'g-value)))
    (loop for i from 0 below size-of-g-value
          do (setf (mem-aref (inc-pointer g-value i) :uint8) 0))
    (%g-value-init g-value g-type)
    (when value-supplied-p
      (setf (g-value g-value) value))
    g-value))

(defun free-g-value (g-value)
  (%g-value-unset g-value)
  (foreign-free g-value))

(defmacro with-g-value ((g-value g-type &optional (value 0.0 value-supplied-p)) &body body)
  `(let ((,g-value ,(if value-supplied-p
                        `(make-g-value ,g-type ,value)
                        `(make-g-value ,g-type))))
     (unwind-protect
          (progn ,@body)
       (free-g-value ,g-value))))

(defun make-g-value-block (n)
  (cons n (foreign-alloc :uint8 :initial-element 0 :count (* n size-of-g-value))))

(defun free-g-value-block (g-value-block)
  (destructuring-bind (n . block-pointer) g-value-block
    (dotimes (i n)
      (%g-value-unset (inc-pointer block-pointer (* i size-of-g-value))))
    (foreign-free block-pointer)))

(defun init-g-value-in-block (g-value-block n g-type &optional (value 0.0 value-supplied-p))
  (assert (< n (car g-value-block)))
  (let ((pointer-into-block (inc-pointer (cdr g-value-block) (* n size-of-g-value))))
    (%g-value-init pointer-into-block g-type)
    (when value-supplied-p
      (setf (g-value pointer-into-block)
            value))))

(defun (setf g-value-in-block) (new-value g-value-block n)
  (assert (< n (car g-value-block)))
  (let ((pointer-into-block (inc-pointer (cdr g-value-block) (* n size-of-g-value))))
    (setf (g-value pointer-into-block) new-value)))

(defun g-value-in-block (g-value-block n)
  (assert (< n (car g-value-block)))
  (let ((pointer-into-block (inc-pointer (cdr g-value-block) (* n size-of-g-value))))
    (g-value pointer-into-block)))

(defmacro with-g-value-block ((g-value-block g-value-block-pointer n) &body body)
  `(let ((,g-value-block (make-g-value-block ,n)))
     (let ((,g-value-block-pointer (cdr ,g-value-block)))
      (unwind-protect
           (progn ,@body)
        (free-g-value-block ,g-value-block)))))
