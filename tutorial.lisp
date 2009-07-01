(in-package :cffi-clutter)

;;; Implement tutorial from
;;; http://www.openismus.com/documents/clutter_tutorial/0.9/docs/tutorial/html/index.html

(defun event-get-coords (event-pointer)
  (with-foreign-objects ((x :float) (y :float))
    (%event-get-coords event-pointer x y)
    (list (mem-ref x :float) (mem-ref y :float))))

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

(defun make-color (red green blue alpha)
  (let ((color (foreign-alloc 'color)))
    (setf (foreign-slot-value color 'color 'red) red
	  (foreign-slot-value color 'color 'green) green
	  (foreign-slot-value color 'color 'blue) blue
	  (foreign-slot-value color 'color 'alpha) alpha)
    color))

(defmacro with-color ((var red green blue alpha) &body body)
  `(let ((,var (make-color ,red ,green ,blue ,alpha)))
     (unwind-protect (progn ,@body)
       (foreign-free ,var))))

(defun init (&optional (clutter-argument-list nil))
  (if clutter-argument-list
      (let ((argc (length clutter-argument-list))
	    (argvs (mapcar #'foreign-string-alloc clutter-argument-list)))
	(with-foreign-object (argc-pointer :int)
	  (with-foreign-object (argv-pointer :pointer argc)
	    (iter (for p in argvs)
		  (for i from 0)
		  (setf (mem-aref argv-pointer :pointer i) p))
	    (setf (mem-ref argc-pointer :int) argc)
	    (prog1
		(%init argc-pointer argvs)
	      (mapc #'foreign-string-free argvs)))))
      (with-foreign-object (argc :int)
	(setf (mem-ref argc :int) 0)
	(%init argc (null-pointer)))))

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
