# cffi-clutter

This is a basis for Common Lisp bindings for [Clutter](http://clutter-project.org/) toolkit, version 0.9.6.

It is mostly composed from semi-automatically generated bindings for Clutter and small parts of GLib and GObject. Currently, the only part somewhat lispified is callback/signal mechanism.

There are basic examples in examples subdirectory, for now only a few chapters of [this tutorial](http://www.openismus.com/documents/clutter_tutorial/0.9/docs/tutorial/html/).

Note that both `grovel.lisp` and `bindings.lisp` contain lots of absolute paths which have to be set appropriately before compilation.