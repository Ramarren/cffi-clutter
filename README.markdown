# cffi-clutter

This is a basis for Common Lisp bindings for [Clutter](http://clutter-project.org/) toolkit, version 1.0.0.

It is mostly composed from semi-automatically generated bindings for Clutter and parts of GLib and GObject. The Lisp layer is pretty thin, so C APIs remain only documentation.

There are basic examples in examples subdirectory. There are examples from nine chapters of [this tutorial](http://www.openismus.com/documents/clutter_tutorial/0.9/docs/tutorial/html/) (all but final one). There are two examples of widgets with custom drawing, `triangle-example` uses signal override, and `subclass-example` creates a GObject level subclass of `ClutterActor`. The architecture for the latter is rather ad-hoc, and should probably be abstracted to be useful.

Note that both `grovel.lisp` and `bindings.lisp` contain lots of absolute paths which have to be set appropriately before compilation.
