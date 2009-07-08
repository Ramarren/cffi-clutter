(in-package :cffi-clutter)

;; factor out some subclassing architecture

(defvar *g-type-cache* (make-hash-table))

(defun get-g-type (symbol namestring)
  (if-let ((cache (gethash symbol *g-type-cache*)))
    cache
    (let ((g-type (%g-type-from-name namestring)))
      (when (not (zerop g-type))
        (setf (gethash symbol *g-type-cache*)
              g-type)))))

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

;;; add an actor with a lisp resource
;;; the class hold a number

(defparameter *lisp-actor-parent-class* nil)

;; class
(defcstruct lisp-actor-class
  (actor-class actor-class)
  (init-resource :uint64))

;; instance, with resource number
(defcstruct lisp-actor
  (actor-instance actor)
  (resource-number :uint64))

;; accessors
(defun init-resource-function (g-class)
  (resource (foreign-slot-pointer g-class 'lisp-actor-class 'init-resource)))

(defun (setf init-resource-function) (new-value g-class)
  (setf (resource (foreign-slot-pointer g-class 'lisp-actor-class 'init-resource)) new-value))

(defun lisp-actor-resource (lisp-actor)
  (resource (foreign-slot-pointer lisp-actor 'lisp-actor 'resource-number)))

(defun (setf lisp-actor-resource) (new-value lisp-actor)
  (setf (resource (foreign-slot-pointer lisp-actor 'lisp-actor 'resource-number)) new-value))

;; instance finalization
(defcallback lisp-actor-finalize-instance :void
    ((object :pointer))
  (unregister-resource (foreign-slot-pointer object 'lisp-actor 'resource-number))
  (foreign-funcall-pointer (foreign-slot-value *lisp-actor-parent-class* 'g-object-class 'finalize)
                           ()
                           :pointer object))

;; base class initialization
(defcallback lisp-actor-base-init :void
    ((g-class :pointer))
  (register-resource nil (foreign-slot-pointer g-class 'lisp-actor-class 'init-resource)))

;; base class finalization
(defcallback lisp-actor-base-finalize :void
    ((g-class :pointer))
  (unregister-resource (foreign-slot-pointer g-class 'lisp-actor-class 'init-resource)))

;; static class initialization
(defcallback lisp-actor-class-init :void
    ((g-class :pointer) (class-data :pointer))
  (declare (ignore class-data))
  (setf *lisp-actor-parent-class* (%g-type-class-peek-parent g-class))
  (setf (foreign-slot-value g-class 'g-object-class 'finalize) (callback lisp-actor-finalize-instance)))

;; instance initialization
(defcallback lisp-actor-instance-init :void
    ((self :pointer) (g-class :pointer))
  (when-let (resource-init (init-resource-function g-class))
    (register-resource
     (funcall resource-init self g-class)
     (foreign-slot-pointer self 'lisp-actor 'resource-number))))

(defun register-lisp-actor ()
  (unless (get-g-type 'lisp-actor "LispClutterActor")
    (with-foreign-object (type-info 'g-type-info)
      (with-foreign-slots ((class-size base-init base-finalize class-init class-finalize class-data
                                       instance-size n-preallocs instance-init value-table)
                           type-info g-type-info)
        (setf class-size (foreign-type-size 'lisp-actor-class)
              base-init (callback lisp-actor-base-init)
              base-finalize (callback lisp-actor-base-finalize)
              class-init (callback lisp-actor-class-init)
              class-finalize (null-pointer)
              class-data (null-pointer)
              instance-size (foreign-type-size 'lisp-actor)
              n-preallocs 0
              instance-init (callback lisp-actor-instance-init)
              value-table (null-pointer)))
      (%g-type-register-static (get-g-type 'actor "ClutterActor")
                               "LispClutterActor"
                               type-info
                               :abstract)))
  (get-g-type 'lisp-actor "LispClutterActor"))

(pushnew 'register-lisp-actor *clutter-initialization-addons*)
