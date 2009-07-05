(in-package :clutter-examples)

;; hard to decide where to keep properties and/or how to best keep them synchronized
;; clearly, a task for Cells! maybe later

;; this is not a very good way to do it, but just to see if it work...

(defclass clutter-triangle ()
  ((color :accessor color-of :initform (list 1.0 1.0 1.0 1.0) :initarg :color)
   (actor :accessor actor-of :initform (%rectangle-new) :initarg :actor)))

(defun paint-triangle-with-color (actor r g b a)
  (multiple-value-bind (w h) (get-size actor)
    (%cogl-push-matrix)
    (%cogl-set-source-color4ub r g b a)
    (%cogl-path-new)
    (%cogl-path-move-to 0.0 0.0)
    (%cogl-path-line-to w 0.0)
    (%cogl-path-line-to w h)
    (%cogl-path-close)
    (%cogl-path-fill)
    (%cogl-pop-matrix)))

(defun paint-triangle (actor)
  (with-color (color 0 0 0 0)
    (%rectangle-get-color actor color)
    (destructuring-bind (r g b a) (get-color color)
      (paint-triangle-with-color actor r b g a)))
  ;(%g-signal-stop-emission-by-name actor "paint")
  )

(defun pick-triangle (actor color)
  (when (eql +true+ (%actor-should-pick-paint actor))
    (destructuring-bind (r g b a) (get-color color)
      (paint-triangle-with-color actor r g b a))
    (%g-signal-stop-emission-by-name actor "pick")))

(defun make-triangle (r g b a)
  (let ((instance (make-instance 'clutter-triangle :color (list r g b a))))
    (let ((actor (actor-of instance)))
      ;; if connect the paint signal with :after flag so that rectangle will be painted first
      ;; to check if picking is reduced properly
      (connect-one-pointer-signal actor "paint" #'paint-triangle :flags :after)
      (connect-two-pointer-signal actor "pick" #'pick-triangle)
      (with-color (color r g b a)
       (%rectangle-set-color actor color)))
    instance))

(defun triangle-example ()
  (with-colors ((stage-color 0 0 0))
    (init-clutter)
    (let ((stage (%stage-get-default)))
      (%group-remove-all stage)
      (%actor-set-size stage 200.0 200.0)
      (%stage-set-color stage stage-color)
      (let ((triangle (make-triangle 0 0 255 255))
            (timeline (%timeline-new 5000)))
        (%actor-set-size (actor-of triangle) 60.0 60.0)
        (%actor-set-position (actor-of triangle) 100.0 100.0)
        (%container-add-actor stage (actor-of triangle))
        (%actor-set-reactive (actor-of triangle) +true+)
        ;; check if picking picks correctly
        (connect-event-handler (actor-of triangle)
                               "button-press-event"
                               #'(lambda (actor event)
                                   (declare (ignore actor event))
                                   (format t "Triangle is here!~&")))
        (%actor-show (actor-of triangle))
        (%timeline-set-loop timeline +true+)
        (%timeline-start timeline)
        (let ((alpha (alpha-new-with-function timeline
                                              #'(lambda (alpha)
                                                  (%timeline-get-progress
                                                   (%alpha-get-timeline alpha))))))
          (let ((behave (%behaviour-rotate-new alpha :z-axis :rotate-cw 0d0 360d0)))
            (%behaviour-apply behave (actor-of triangle))
            (main-with-cleanup stage timeline behave)))))))
