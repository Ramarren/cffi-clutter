(in-package :cffi-clutter)

;; factor out some subclassing architecture

(defvar *g-type-cache* (make-hash-table))

(defun get-g-type (symbol namestring)
  (if-let ((cache (gethash symbol *g-type-cache*)))
    cache
    (setf (gethash symbol *g-type-cache*)
          (%g-type-from-name namestring))))

(defmacro define-properties-id-map ((id-to-symbol-function symbol-to-id-function)
                                    &rest property-symbols)
  (with-unique-names (prop-id symbol)
    `(progn (declaim (inline ,id-to-symbol-function ,symbol-to-id-function))
            (defun ,id-to-symbol-function (,prop-id)
              (ecase ,prop-id
                ,@(loop for i from 1
                        for symbol in property-symbols
                        collect (list i (list 'quote symbol)))))
            (defun ,symbol-to-id-function (,symbol)
              (ecase ,symbol
                ,@(loop for i from 1
                        for symbol in property-symbols
                        collect (list (list 'quote symbol) i)))))))
