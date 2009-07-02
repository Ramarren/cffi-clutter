(in-package :cffi-clutter)

;;; Implement tutorial from
;;; http://www.openismus.com/documents/clutter_tutorial/0.9/docs/tutorial/html/index.html



(defcallback chapter-4-on-stage-button-press gboolean
    ((stage :pointer) (event :pointer) (data :pointer))
  (declare (ignore stage data))
  (destructuring-bind (x y) (event-get-coords event)
    (format t "Stage clicked at ~a ~a~&" x y))
  +true+)

(defcallback quit-main-loop-when-idle gboolean
    ((data :pointer))
  (declare (ignore data))
  (%main-quit)
  +false+)

(defun chapter-4 ()
  (with-color (stage-color 0 0 0 255)
    (init-clutter)
    (let ((stage (%stage-get-default)))
      ;; in case other examples were run before
      (%group-remove-all stage)
      (%actor-set-size stage 200.0 200.0)
      (%stage-set-color stage stage-color)
      (%actor-show stage)
      (g-signal-connect stage "button-press-event" (callback chapter-4-on-stage-button-press))
      (%main)
      ;; when I click window close button the loops stops, but window doesn't close
      ;; have to run main loop for a bit so it is hidden
      (%threads-add-idle (callback quit-main-loop-when-idle) (null-pointer))
      (%actor-hide stage)
      (%main))))

(defun chapter-5-1 ()
  (with-colors ((stage-color 0 0 0)
                (actor-color #xff #xff #xff #x99))
    (init-clutter)
    (let ((stage (%stage-get-default)))
      (%group-remove-all stage)      
      (%actor-set-size stage 200.0 200.0)
      (%stage-set-color stage stage-color)
      (let ((rect (%rectangle-new-with-color actor-color))
            (label (%text-new-full "Sans 12" "Some Text" actor-color)))
        (%actor-set-size rect 100.0 100.0)
        (%actor-set-position rect 20.0 20.0)
        (%container-add-actor stage rect)
        (%actor-show rect)
        (%actor-set-size label 500.0 500.0)
        (%actor-set-position label 20.0 150.0)
        (%container-add-actor stage label)
        (%actor-show label))
      (%actor-show stage)
      (%main)
      (%threads-add-idle (callback quit-main-loop-when-idle) (null-pointer))
      (%actor-hide stage)
      (%main))))
