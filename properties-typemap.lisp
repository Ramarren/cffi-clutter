(in-package :cffi-clutter)

;; there are some duplicate properties (direction, duration, ?), but for most this works
;; only those for actors are really useful anyway, as they go into Animation objects

(defparameter *property-types*
  (plist-hash-table
   '("activatable" "gboolean"
     "actor" "gpointer"
     "allocation" "gpointer"
     "alpha" "gpointer"
     "anchor-gravity" "ClutterGravity"
     "anchor-x" "gfloat"
     "anchor-y" "gfloat"
     "angle-end" "gdouble"
     "angle-start" "gdouble"
     "angle-tilt-x" "gdouble"
     "angle-tilt-y" "gdouble"
     "angle-tilt-z" "gdouble"
     "attributes" "gpointer"
     "audio-volume" "gdouble"
     "axis" "ClutterRotateAxis"
     "border-color" "gpointer"
     "border-width" "guint"
     "buffer-fill" "gdouble"
     "can-seek" "gboolean"
     "center" "gpointer"
     "center-x" "gint"
     "center-y" "gint"
     "center-z" "gint"
     "clip" "gpointer"
     "clip-to-allocation" "gboolean"
     "cogl-material" "gpointer"
     "cogl-texture" "gpointer"
     "color" "gpointer"
     "compiled" "gboolean"
     "container" "gpointer"
     "cursor-color" "gpointer"
     "cursor-color-set" "gboolean"
     "cursor-size" "gint"
     "cursor-visible" "gboolean"
     "delay" "guint"
     "depth" "gfloat"
     "depth-end" "gint"
     "depth-start" "gint"
     "description" "gpointer"
     "direction" "ClutterRotateDirection"
     "disable-slicing" "gboolean"
     "duration" "guint"
     "editable" "gboolean"
     "ellipsize" "PangoEllipsizeMode"
     "enabled" "gboolean"
     "filename" "gpointer"
     "filename-set" "gboolean"
     "filter-quality" "ClutterTextureQuality"
     "filter-set" "gboolean"
     "fixed-position-set" "gboolean"
     "fixed-x" "gfloat"
     "fixed-y" "gfloat"
     "fog" "gpointer"
     "font-name" "gpointer"
     "fragment-source" "gpointer"
     "fullscreen-set" "gboolean"
     "has-border" "gboolean"
     "has-clip" "gboolean"
     "height" "gfloat"
     "height" "gint"
     "justify" "gboolean"
     "keep-aspect-ratio" "gboolean"
     "length" "guint"
     "line-alignment" "PangoAlignment"
     "line-wrap" "gboolean"
     "line-wrap-mode" "PangoWrapMode"
     "load-async" "gboolean"
     "load-data-async" "gboolean"
     "loop" "gboolean"
     "mapped" "gboolean"
     "max-length" "gint"
     "min-height" "gfloat"
     "min-height-set" "gboolean"
     "min-width" "gfloat"
     "min-width-set" "gboolean"
     "mode" "gulong"
     "model" "gpointer"
     "name" "gpointer"
     "natural-height" "gfloat"
     "natural-height-set" "gboolean"
     "natural-width" "gfloat"
     "natural-width-set" "gboolean"
     "object" "gpointer"
     "offscreen" "gboolean"
     "opacity" "guchar"
     "opacity-end" "guint"
     "opacity-start" "guint"
     "password-char" "guint"
     "path" "gpointer"
     "perspective" "gpointer"
     "pixel-format" "CoglPixelFormat"
     "playing" "gboolean"
     "position" "gint"
     "progress" "gdouble"
     "reactive" "gboolean"
     "realized" "gboolean"
     "repeat-x" "gboolean"
     "repeat-y" "gboolean"
     "request-mode" "ClutterRequestMode"
     "rotation-angle-x" "gdouble"
     "rotation-angle-y" "gdouble"
     "rotation-angle-z" "gdouble"
     "rotation-center-x" "gpointer"
     "rotation-center-y" "gpointer"
     "rotation-center-z" "gpointer"
     "rotation-center-z-gravity" "ClutterGravity"
     "row" "guint"
     "scale-center-x" "gfloat"
     "scale-center-y" "gfloat"
     "scale-gravity" "ClutterGravity"
     "scale-x" "gdouble"
     "scale-y" "gdouble"
     "selectable" "gboolean"
     "selection-bound" "gint"
     "selection-color" "gpointer"
     "selection-color-set" "gboolean"
     "show-on-set-parent" "gboolean"
     "single-line-mode" "gboolean"
     "source" "gpointer"
     "surface-height" "guint"
     "surface-width" "guint"
     "sync-size" "gboolean"
     "text" "gpointer"
     "tile-waste" "gint"
     "timeline" "gpointer"
     "title" "gpointer"
     "uri" "gpointer"
     "use-fog" "gboolean"
     "use-markup" "gboolean"
     "user-resizable" "gboolean"
     "vertex-source" "gpointer"
     "visible" "gboolean"
     "width" "gfloat"
     "width" "gint"
     "x" "gfloat"
     "x-scale-end" "gdouble"
     "x-scale-start" "gdouble"
     "y" "gfloat"
     "y-scale-end" "gdouble"
     "y-scale-start" "gdouble")
   :test 'equal))

(defparameter *property-type-cache* (make-hash-table :test 'equal))

(defun g-name-to-ffi-type (g-name)
  (eswitch (g-name :test #'string=)
    ("ClutterRequestMode" 'request-mode)
    ("CoglPixelFormat" 'cogl-pixel-format)
    ("guchar" 'guchar)
    ("gulong" 'gulong)
    ("PangoWrapMode" 'pango-wrap-mode)
    ("PangoAlignment" 'pango-alignment)
    ("ClutterTextureQuality" 'texture-quality)
    ("PangoEllipsizeMode" 'pango-ellipsize-mode)
    ("ClutterRotateDirection" 'rotate-direction)
    ("gint" 'gint)
    ("guint" 'guint)
    ("ClutterRotateAxis" 'rotate-axis)
    ("gdouble" :double)
    ("gfloat" :float)
    ("ClutterGravity" 'gravity)
    ("gpointer" :pointer)
    ("gboolean" 'gboolean)))

(defparameter *g-type-cache* (make-hash-table))

(defun g-type-to-ffi-type (g-type)
  (let ((cache (gethash g-type *g-type-cache*)))
    (if cache
        cache
        (g-name-to-ffi-type (%g-type-name g-type)))))

(defun type-for-property (property)
  (let ((cache (gethash property *property-type-cache*)))
    (if cache
        cache
        (setf (gethash property *property-type-cache*)
              (let ((g-name (gethash property *property-types*)))
                (list (%g-type-from-name g-name)
                      (g-name-to-ffi-type g-name)))))))
