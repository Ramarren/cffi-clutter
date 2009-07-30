(in-package :clutter-examples)

;;; First, reimplement ClutterGroup using LispClutterActor

;;; this is mostly straight port of clutter-group.c, but using lisp list in lisp object rather than
;;; C list

;;; would probably be a good idea to use a data structure with O(1) append

(defclass lisp-group-aux ()
  ((children :accessor children-of :initarg :children :initform nil)))

(defvar *lisp-group-parent-class* nil)

(defcallback lisp-group-paint :void
    ((actor :pointer))
  (mapc #'actor-paint (children-of (lisp-actor-resource actor))))

(defcallback lisp-group-pick :void
    ((actor :pointer) (color :pointer))
  (foreign-funcall-pointer (foreign-slot-value *lisp-group-parent-class* 'actor-class 'pick)
                   ()
                   :pointer actor :pointer color)
  (mapc #'actor-paint (children-of (lisp-actor-resource actor))))

(defun fixed-layout-get-preferred-width (children)
  (let ((min-left 0.0) (min-right 0.0)
        (natural-left 0.0) (natural-right 0.0))
    (iter (for child in children)
          (for child-x = (actor-get-x child))
          (for (values child-min nil child-natural nil) = (get-preferred-size child))
          (if (first-iteration-p)
              (setf min-left child-x
                    natural-left child-x
                    min-right (+ min-left child-min)
                    natural-right (+ natural-left child-natural))
              (progn
                (when (< child-x min-left)
                  (setf min-left child-x))
                (when (< child-x natural-left)
                  (setf natural-left child-x))
                (when (> (+ child-x child-min) min-right)
                  (setf min-right (+ child-x child-min)))
                (when (> (+ child-x child-natural) natural-right)
                  (setf natural-right (+ child-x child-natural)))))
          (finally (return (values (- (max min-right 0.0) (max min-left 0.0))
                                   (- (max natural-right 0.0) (max natural-left 0.0))))))))

(defun fixed-layout-get-preferred-height (children)
  (let ((min-top 0.0) (min-bottom 0.0)
        (natural-top 0.0) (natural-bottom 0.0))
    (iter (for child in children)
          (for child-y = (actor-get-y child))
          (for (values nil child-min nil child-natural) = (get-preferred-size child))
          (if (first-iteration-p)
              (setf min-top child-y
                    natural-top child-y
                    min-bottom (+ min-top child-min)
                    natural-bottom (+ natural-top child-natural))
              (progn
                (when (< child-y min-top)
                  (setf min-top child-y))
                (when (< child-y natural-top)
                  (setf natural-top child-y))
                (when (> (+ child-y child-min) min-bottom)
                  (setf min-bottom (+ child-y child-min)))
                (when (> (+ child-y child-natural) natural-bottom)
                  (setf natural-bottom (+ child-y child-natural)))))
          (finally (return (values (- (max min-bottom 0.0) (max min-top 0.0))
                                   (- (max natural-bottom 0.0) (max natural-top 0.0))))))))

(defun fixed-layout-allocate (children flags)
  (mapc (rcurry #'actor-allocate-preferred-size flags) children))

(defcallback lisp-group-preferred-width :void
    ((self :pointer) (for-height :float) (min-width-pointer :pointer) (natural-width-pointer :pointer))
  (declare (ignore for-height))
  (multiple-value-bind (min-width natural-width) (fixed-layout-get-preferred-width
                                                  (children-of (lisp-actor-resource self)))
    (setf (mem-ref min-width-pointer :float) min-width
          (mem-ref natural-width-pointer :float) natural-width)))

(defcallback lisp-group-preferred-height :void
    ((self :pointer) (for-width :float) (min-height-pointer :pointer) (natural-height-pointer :pointer))
  (declare (ignore for-width))
  (multiple-value-bind (min-height natural-height) (fixed-layout-get-preferred-height
                                                  (children-of (lisp-actor-resource self)))
    (setf (mem-ref min-height-pointer :float) min-height
          (mem-ref natural-height-pointer :float) natural-height)))

(defcallback lisp-group-allocate :void
    ((self :pointer) (box :pointer) (flags allocation-flags))
  (let ((parent-allocate (foreign-slot-value *lisp-group-parent-class* 'actor-class 'allocate)))
    (foreign-funcall-pointer parent-allocate ()
                             :pointer self :pointer box allocation-flags flags))
  (fixed-layout-allocate (children-of (lisp-actor-resource self)) flags))

(defcallback lisp-group-dispose :void
    ((object :pointer))
  (mapc #'actor-destroy (children-of (lisp-actor-resource object)))
  (setf (children-of (lisp-actor-resource object)) nil)
  (foreign-funcall-pointer (foreign-slot-value *lisp-group-parent-class* 'g-object-class 'dispose)
                           ()
                           :pointer object))

(defcallback lisp-group-real-show-all :void
    ((actor :pointer))
  (mapc #'actor-show (children-of (lisp-actor-resource actor)))
  (actor-show actor))

(defcallback lisp-group-real-hide-all :void
    ((actor :pointer))
  (actor-hide actor)
  (mapc #'actor-hide (children-of (lisp-actor-resource actor))))

(defcallback lisp-group-real-add :void
    ((container :pointer) (actor :pointer))
  (g-object-ref actor)
  (let ((aux (lisp-actor-resource container)))
    (setf (children-of aux) (append (children-of aux) (list actor))))
  (actor-set-parent actor container)
  (actor-queue-relayout container)
  (foreign-funcall "g_signal_emit_by_name"
                   :pointer container
                   :string "actor-added"
                   :pointer actor)
  (container-sort-depth-order container)
  (g-object-unref actor))

(defcallback lisp-group-real-remove :void
    ((container :pointer) (actor :pointer))
  (g-object-ref actor)
  (let ((aux (lisp-actor-resource container)))
    (setf (children-of aux) (remove actor (children-of aux)))
    (actor-unparent actor)
    (actor-queue-relayout container)
    (foreign-funcall "g_signal_emit_by_name"
                     :pointer container
                     :string "actor-removed"
                     :pointer actor)
    (when (member :visible (ensure-list (actor-get-flags actor)))
      (actor-queue-redraw container))
    (g-object-unref actor)))

(defcallback lisp-group-real-foreach :void
    ((container :pointer) (callback function-pointer) (user-data :pointer))
  (mapc #'(lambda (child)
            (foreign-funcall-pointer callback () :pointer child :pointer user-data))
        (children-of (lisp-actor-resource container))))

(defcallback lisp-group-real-raise :void
    ((container :pointer) (actor :pointer) (sibling :pointer))
  (let ((aux (lisp-actor-resource container)))
    (let ((new-list (remove actor (children-of aux))))
      (if (null-pointer-p sibling)
          (setf (children-of aux) (append new-list (list actor)))
          (setf (children-of aux)
                (iter (for child in new-list)
                      (collect child)
                      (when (pointer-eq child sibling)
                        (collect actor))))))
    (if (/= (actor-get-depth sibling)
            (actor-get-depth actor))
        (actor-set-depth actor (actor-get-depth sibling)))
    (when (member :visible (ensure-list (actor-get-flags actor)))
      (actor-queue-redraw container))))

(defcallback lisp-group-real-lower :void
    ((container :pointer) (actor :pointer) (sibling :pointer))
  (let ((aux (lisp-actor-resource container)))
    (let ((new-list (remove actor (children-of aux))))
      (if (null-pointer-p sibling)
          (setf (children-of aux) (cons actor new-list))
          (setf (children-of aux)
                (iter (for child in new-list)
                      (when (pointer-eq child sibling)
                        (collect actor))
                      (collect child)))))
    (if (/= (actor-get-depth sibling)
            (actor-get-depth actor))
        (actor-set-depth actor (actor-get-depth sibling)))
    (when (member :visible (ensure-list (actor-get-flags actor)))
      (actor-queue-redraw container))))

(defcallback lisp-group-real-sort-depth-order :void
    ((container :pointer))
  (let ((aux (lisp-actor-resource container)))
    (setf (children-of aux)
          (sort (children-of aux) #'< :key #'actor-get-depth))
    (when (member :visible (ensure-list (actor-get-flags container)))
      (actor-queue-redraw container))))

(defcallback lisp-group-container-iface-init :void
    ((iface :pointer))
  (with-foreign-slots ((add remove foreach raise lower sort-depth-order) iface container-iface)
    (setf add (callback lisp-group-real-add)
          remove (callback lisp-group-real-remove)
          foreach (callback lisp-group-real-foreach)
          raise (callback lisp-group-real-raise)
          lower (callback lisp-group-real-lower)
          sort-depth-order (callback lisp-group-real-sort-depth-order))))

(defcallback lisp-group-class-init :void
    ((g-class :pointer))
  (setf *lisp-group-parent-class* (g-type-class-peek (get-g-type 'lisp-actor "LispClutterActor")))
  (with-foreign-slots ((dispose) g-class g-object-class)
    (setf dispose (callback lisp-group-dispose)))
  (with-foreign-slots ((paint pick show-all hide-all get-preferred-width get-preferred-height allocate)
                       g-class actor-class)
    (setf paint (callback lisp-group-paint)
          pick (callback lisp-group-pick)
          show-all (callback lisp-group-real-show-all)
          hide-all (callback lisp-group-real-hide-all)
          get-preferred-width (callback lisp-group-preferred-width)
          get-preferred-height (callback lisp-group-preferred-height)
          allocate (callback lisp-group-allocate)))
  (setf (init-resource-function g-class)
        #'(lambda (self class)
            (declare (ignore self class))
            (make-instance 'lisp-group-aux))))

(defcallback lisp-group-init :void ((self :pointer))
  (declare (ignore self))
  (values))

(defun lisp-group-new ()
  (g-object-newv (get-g-type 'lisp-group "LispClutterGroup") 0 (null-pointer)))

(defun lisp-group-remove-all (group)
  (let ((children (copy-list (children-of (lisp-actor-resource group)))))
    (mapc (curry #'container-remove-actor group) children)))

(defun lisp-group-get-n-children (group)
  (length (children-of (lisp-actor-resource group))))

(defun lisp-group-get-nth-child (group n)
  (nth n (children-of (lisp-actor-resource group))))

(defun register-lisp-group ()
  (unless (get-g-type 'lisp-group "LispClutterGroup")
    (g-type-register-static-simple
     (get-g-type 'lisp-actor "LispClutterActor")
     "LispClutterGroup"
     (foreign-type-size 'lisp-actor-class)
     (callback lisp-group-class-init)
     (foreign-type-size 'lisp-actor)
     (callback lisp-group-init)
     nil)
    (with-foreign-object (iface-info 'g-interface-info)
      (with-foreign-slots ((interface-init interface-finalize interface-data) iface-info g-interface-info)
        (setf interface-init (callback lisp-group-container-iface-init)
              interface-finalize (null-pointer)
              interface-data (null-pointer))
        (g-type-add-interface-static
         (get-g-type 'lisp-group "LispClutterGroup")
         (get-g-type 'container-iface "ClutterContainer")
         iface-info))))
  (get-g-type 'lisp-group "LispClutterGroup"))

;;; Example using lisp-group

(defun lisp-group-example ()
  (with-new-pool :main
    (with-colors ((stage-color 0 0 0))
      (init-clutter)
      (register-triangle)
      (register-lisp-group)
      (let ((stage (stage-get-default)))
        (group-remove-all stage)
        (actor-set-size stage 200.0 200.0)
        (stage-set-color stage stage-color)
        (let ((group (lisp-group-new))
              (triangle (make-subclassed-triangle 0 0 255 255))
              (triangle2 (make-subclassed-triangle))
              (timeline (pool (timeline-new 5000))))
          (actor-set-size triangle 60.0 60.0)
          (actor-set-position triangle 20.0 20.0)
          (container-add-actor group triangle)
          (actor-show triangle)
          (actor-set-size triangle2 20.0 20.0)
          (actor-set-position triangle2 40.0 40.0)
          (container-add-actor group triangle2)
          (actor-show triangle2)
          (timeline-set-loop timeline +true+)
          (timeline-start timeline)
          (container-add-actor stage group)
          (actor-set-position group 100.0 100.0)
          (let ((alpha (alpha-new-full timeline (animation-mode :linear))))
            (let ((behave (pool (behaviour-rotate-new alpha :z-axis :rotate-cw 0d0 360d0))))
              (behaviour-apply behave group)
              (main-with-cleanup stage))))))))

;;; Using lisp-group layout container can be made just by overriding get-preferred-width,
;;; get-preferred-height and allocate. In fact, one can just trampoline to Lisp methods, assuming
;;; that relayouts happen rarely enough not to destroy performance.

;; a fixed layout layout, identical to lisp-group, except with one more level of indirection
(defclass layout-group-aux (lisp-group-aux)
  ())

(defgeneric preferred-width (self self-actor for-height)
  (:method ((self layout-group-aux) self-actor for-height)
    (declare (ignore for-height self-actor))
    (fixed-layout-get-preferred-height (children-of self))))

(defgeneric preferred-height (self self-actor for-width)
  (:method ((self layout-group-aux) self-actor for-width)
    (declare (ignore for-width self-actor))
    (fixed-layout-get-preferred-width (children-of self))))

(defgeneric allocate-layout (self self-actor box flags)
  (:method ((self layout-group-aux) self-actor box flags)
    (declare (ignore self-actor))
    (fixed-layout-allocate (children-of self) flags)))

(defcallback layout-group-preferred-width :void
    ((self :pointer) (for-height :float) (min-width-pointer :pointer) (natural-width-pointer :pointer))
  (multiple-value-bind (min-width natural-width) (preferred-width (lisp-actor-resource self) self for-height)
    (setf (mem-ref min-width-pointer :float) min-width
          (mem-ref natural-width-pointer :float) natural-width)))

(defcallback layout-group-preferred-height :void
    ((self :pointer) (for-width :float) (min-height-pointer :pointer) (natural-height-pointer :pointer))
  (multiple-value-bind (min-height natural-height) (preferred-height (lisp-actor-resource self) self for-width)
    (setf (mem-ref min-height-pointer :float) min-height
          (mem-ref natural-height-pointer :float) natural-height)))

(defcallback layout-group-allocate :void
    ((self :pointer) (box :pointer) (flags allocation-flags))
  (let ((parent-allocate (foreign-slot-value *lisp-group-parent-class* 'actor-class 'allocate)))
    ;; use ClutterActor allocate to create allocation box
    (foreign-funcall-pointer parent-allocate ()
                             :pointer self :pointer box allocation-flags flags))
  (allocate-layout (lisp-actor-resource self) self box flags))

(defcallback layout-group-class-init :void
    ((g-class :pointer))
(with-foreign-slots ((paint pick show-all hide-all get-preferred-width get-preferred-height allocate)
                     g-class actor-class)
  (setf get-preferred-width (callback layout-group-preferred-width)
        get-preferred-height (callback layout-group-preferred-height)
        allocate (callback layout-group-allocate)))
  (setf (init-resource-function g-class)
        #'(lambda (self class)
            (declare (ignore self class))
            (make-instance 'layout-group-aux))))

(defun layout-group-new ()
  (g-object-newv (get-g-type 'layout-group "LayoutClutterGroup") 0 (null-pointer)))

(defun register-layout-group ()
  (unless (get-g-type 'layout-group "LayoutClutterGroup")
    (register-lisp-group)
    (g-type-register-static-simple
     (get-g-type 'lisp-group "LispClutterGroup")
     "LayoutClutterGroup"
     (foreign-type-size 'lisp-actor-class)
     (callback layout-group-class-init)
     (foreign-type-size 'lisp-actor)
     (null-pointer)
     nil))
  (get-g-type 'lisp-group "LispClutterGroup"))

(defun layout-group-example ()
  (with-colors ((stage-color 0 0 0))
    (init-clutter)
    (register-triangle)
    (register-layout-group)
    (let ((stage (stage-get-default)))
      (group-remove-all stage)
      (actor-set-size stage 200.0 200.0)
      (stage-set-color stage stage-color)
      (let ((group (layout-group-new))
            (triangle (make-subclassed-triangle 0 0 255 255))
            (triangle2 (make-subclassed-triangle))
            (timeline (timeline-new 5000)))
        (actor-set-size triangle 60.0 60.0)
        (actor-set-position triangle 20.0 20.0)
        (container-add-actor group triangle)
        (actor-show triangle)
        (actor-set-size triangle2 20.0 20.0)
        (actor-set-position triangle2 40.0 40.0)
        (container-add-actor group triangle2)
        (actor-show triangle2)
        (timeline-set-loop timeline +true+)
        (timeline-start timeline)
        (container-add-actor stage group)
        (actor-set-position group 100.0 100.0)
        (let ((alpha (alpha-new-full timeline (animation-mode :linear))))
          (let ((behave (behaviour-rotate-new alpha :z-axis :rotate-cw 0d0 360d0)))
            (behaviour-apply behave group)
            (main-with-cleanup stage timeline behave)))))))

;;; Now new layout classes can be made just by overriding class-init to set appropriate resource
;;; creator and specializing methods above.
