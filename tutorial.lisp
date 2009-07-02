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
    (init)
    (let ((stage (%stage-get-default)))
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
