(defpackage :cffi-clutter
    (:use :cl :cffi :iterate :alexandria)
  (:export #:event-get-coords
           #:make-color
           #:free-color
           #:copy-color
           #:with-color
           #:init-clutter))
