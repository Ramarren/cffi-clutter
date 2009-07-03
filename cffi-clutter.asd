(cl:eval-when (:load-toplevel :execute)
    (asdf:operate 'asdf:load-op 'cffi-grovel))

(asdf:defsystem cffi-clutter
  :version "0"
  :description "Bindings for Clutter gui library"
  :maintainer " <ramarren@cignet.higersbergernet>"
  :author " <ramarren@cignet.higersbergernet>"
  :licence "BSD-style"
  :depends-on (:cffi :alexandria)
  :components ((:file "package")
	       (cffi-grovel:grovel-file "grovel" :depends-on ("package"))
	       (:file "bindings" :depends-on ("package" "grovel"))
               (:file "properties-typemap" :depends-on ("package" "grovel" "bindings"))
               (:file "g-values" :depends-on ("package" "grovel" "bindings" "properties-typemap"))
               (:file "wrappers" :depends-on ("package" "grovel" "bindings" "callbacks" "properties-typemap"))
               (:file "callbacks" :depends-on ("package" "grovel" "bindings"))
               (:file "animations" :depends-on ("package" "grovel" "bindings" "wrappers" "callbacks" "g-values"))))



