(asdf:defsystem clutter-examples
    :version "0"
  :description "Examples and tests for cffi-clutter"
  :maintainer "Jakub Higersberger <ramarren@gmail.com>"
  :author "Jakub Higersberger <ramarren@gmail.com>"
  :licence "BSD-style"
  :depends-on (:cffi-clutter :iterate :alexandria)
  :components ((:module "examples"
                        :components
                        ((:file "package")
                         (:file "tutorial" :depends-on ("package"))
                         (:file "triangle" :depends-on ("package"))))))
