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
               (:file "inline-wrappers" :depends-on ("package" "grovel" "bindings"))
               (:file "pool" :depends-on ("package" "inline-wrappers"))
               (:file "g-values" :depends-on ("package" "grovel" "inline-wrappers"))
               (:file "wrappers" :depends-on ("package" "grovel" "bindings" "callbacks" "inline-wrappers" "pool"))
               (:file "resource" :depends-on ("package"))
               (:file "callbacks" :depends-on ("package" "grovel" "inline-wrappers" "resource"))
               (:file "gobject-subclass" :depends-on ("package" "grovel" "resource" "wrappers" "inline-wrappers"))
               (:file "animations" :depends-on ("package" "grovel" "wrappers" "callbacks" "g-values"))))
