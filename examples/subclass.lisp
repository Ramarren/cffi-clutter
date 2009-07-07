(in-package :clutter-examples)

;; example of subclassing a ClutterActor on GObject level
;; mixes triangle definition with bits of infrastructure, which should be abstracted away
;; the problem is how to do it without adding ridiculous overhead

(define-properties-id-map (triangle-prop-id triangle-prop-symbol)
    :color)

;; don't need class level fields, so reuse ClutterActorClass layout
;; define triangle instance layout
;; ignore the private subobject distinction
(defcstruct triangle
  (actor-instance actor)
  (color color))

;; actor callbacks:
(defcallback triangle-paint :void
    ((triangle :pointer))
  (destructuring-bind (r g b a) (get-color (foreign-slot-value triangle 'triangle 'color))
    (let ((paint-opacity (%actor-get-paint-opacity triangle)))
      (paint-triangle-with-color triangle r g b (truncate (* paint-opacity a) 255)))))

(defcallback triangle-pick :void
    ((triangle :pointer) (color :pointer))
  (when (eql +true+ (%actor-should-pick-paint triangle))
   (destructuring-bind (r g b a) (get-color color)
     (paint-triangle-with-color triangle r g b a))))

;; class callbacks:

(defcallback triangle-set-property :void
    ((object :pointer) (prop-id guint) (value (:pointer g-value)) (pspec (:pointer g-param-spec)))
  (declare (ignore pspec))
  (ecase (triangle-prop-id prop-id)
    (:color
       (apply #'set-color (foreign-slot-value object 'triangle 'color)
              (get-color (%value-get-color value)))
       (%g-object-notify object "color"))))

(defcallback triangle-get-property :void
    ((object :pointer) (prop-id guint) (value (:pointer g-value)) (pspec (:pointer g-param-spec)))
  (declare (ignore pspec))
  (ecase (triangle-prop-id prop-id)
    (:color
       (%value-set-color value (foreign-slot-value object 'triangle 'color)))))

(defvar *default-triangle-color* (make-color 255 255 255 255))

;; callbacks change address when redefined
;; use something like: (attach-triangle-callbacks (%g-type-class-peek (get-g-type 'triangle "CustomClutterTriangle")))
;; to reconnect
(defun attach-triangle-callbacks (g-class)
  (setf (foreign-slot-value g-class 'actor-class 'paint) (callback triangle-paint)
        (foreign-slot-value g-class 'actor-class 'pick) (callback triangle-pick)
        (foreign-slot-value g-class 'g-object-class 'set-property) (callback triangle-set-property)
        (foreign-slot-value g-class 'g-object-class 'get-property) (callback triangle-get-property)))

(defcallback triangle-class-init :void
    ((g-class :pointer) (data :pointer))
  (declare (ignore data))
  (attach-triangle-callbacks g-class)
  (let ((pspec (%param-spec-color "color"
                                  "Color"
                                  "The color of the triangle"
                                  *default-triangle-color*
                                  '(:readable :writable))))
    (%g-object-class-install-property g-class (triangle-prop-symbol :color) pspec)))

(defcallback triangle-instance-init :void
    ((self :pointer) (g-class :pointer))
  (declare (ignore g-class))
  (apply #'set-color
         (foreign-slot-pointer self 'triangle 'color)
         (get-color *default-triangle-color*)))

(defparameter *triangle-g-name* "CustomClutterTriangle")

(defun register-triangle ()
  (unless (get-g-type 'triangle *triangle-g-name*)
    (%g-type-register-static-simple
     (get-g-type 'actor "ClutterActor")
     *triangle-g-name*
     (foreign-type-size 'actor-class)
     (callback triangle-class-init)
     (foreign-type-size 'triangle)
     (callback triangle-instance-init)
     nil)))

(defun make-subclassed-triangle (&rest color-components)
  (let ((g-type (get-g-type 'triangle *triangle-g-name*)))
    (if color-components
        (destructuring-bind (&optional (r 255) (g 255) (b 255) (a 255)) color-components
          (with-foreign-object (g-param 'g-parameter)
            (iter (for i from 0 below (foreign-type-size 'g-parameter))
                  (setf (mem-aref g-param :uint8 i) 0))
            (with-foreign-string (param-name "color")
              (let ((g-value (foreign-slot-pointer g-param 'g-parameter 'value)))
                (%g-value-init g-value (get-g-type 'color "ClutterColor"))
                (with-color (color r g b a)
                  (%value-set-color g-value color)
                  (setf (foreign-slot-value g-param 'g-parameter 'name) param-name)
                  (%g-object-newv g-type 1 g-param))))))
        (%g-object-newv g-type 0 (null-pointer)))))

(defun subclass-example ()
  (with-colors ((stage-color 0 0 0))
    (init-clutter)
    (register-triangle)
    (let ((stage (%stage-get-default)))
      (%group-remove-all stage)
      (%actor-set-size stage 200.0 200.0)
      (%stage-set-color stage stage-color)
      (let ((triangle (make-subclassed-triangle 0 0 255 255))
            (triangle2 (make-subclassed-triangle))
            (timeline (%timeline-new 5000)))
        (%actor-set-size triangle 60.0 60.0)
        (%actor-set-position triangle 100.0 100.0)
        (%container-add-actor stage triangle)
        (%actor-set-reactive triangle +true+)
        ;;check if picking picks correctly
        (connect-event-handler triangle
                               "button-press-event"
                               #'(lambda (actor event)
                                   (declare (ignore actor event))
                                   (format t "Triangle is here!~&")))
        (%actor-show triangle)
        (%actor-set-size triangle2 20.0 20.0)
        (%actor-set-position triangle2 40.0 40.0)
        (%container-add-actor stage triangle2)
        (%actor-show triangle2)
        (%timeline-set-loop timeline +true+)
        (%timeline-start timeline)
        (let ((alpha (%alpha-new-full timeline (animation-mode :linear)))
              (alpha2 (alpha-new-with-function timeline
                                               #'(lambda (alpha)
                                                   (expt (sin
                                                          (* 2 pi
                                                             (%timeline-get-progress
                                                              (%alpha-get-timeline alpha))))
                                                         2)))))
          (let ((behave (%behaviour-rotate-new alpha :z-axis :rotate-cw 0d0 360d0))
                (behave2 (%behaviour-opacity-new alpha2 0 255)))
            (%behaviour-apply behave triangle)
            (%behaviour-apply behave triangle2)
            (%behaviour-apply behave2 triangle)
            (main-with-cleanup stage timeline behave behave2)))))))
