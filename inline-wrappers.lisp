(in-package :cffi-clutter)

;;; Automatically generated wrappers for functions which do not require additional processing, can
;;; be easily dropped when regenerating for adding more complex wrappers. This allows to present
;;; more unified interface.

(declaim (inline actor-set-flags))
(defun actor-set-flags (self flags)
  (%actor-set-flags self flags))

(declaim (inline actor-unset-flags))
(defun actor-unset-flags (self flags)
  (%actor-unset-flags self flags))

(declaim (inline actor-get-flags))
(defun actor-get-flags (self)
  (%actor-get-flags self))

(declaim (inline actor-show))
(defun actor-show (self)
  (%actor-show self))

(declaim (inline actor-show-all))
(defun actor-show-all (self)
  (%actor-show-all self))

(declaim (inline actor-hide))
(defun actor-hide (self)
  (%actor-hide self))

(declaim (inline actor-hide-all))
(defun actor-hide-all (self)
  (%actor-hide-all self))

(declaim (inline actor-realize))
(defun actor-realize (self)
  (%actor-realize self))

(declaim (inline actor-unrealize))
(defun actor-unrealize (self)
  (%actor-unrealize self))

(declaim (inline actor-paint))
(defun actor-paint (self)
  (%actor-paint self))

(declaim (inline actor-queue-redraw))
(defun actor-queue-redraw (self)
  (%actor-queue-redraw self))

(declaim (inline actor-queue-relayout))
(defun actor-queue-relayout (self)
  (%actor-queue-relayout self))

(declaim (inline actor-destroy))
(defun actor-destroy (self)
  (%actor-destroy self))

(declaim (inline actor-event))
(defun actor-event (actor event capture)
  (%actor-event actor event capture))

(declaim (inline actor-should-pick-paint))
(defun actor-should-pick-paint (self)
  (%actor-should-pick-paint self))

(declaim (inline actor-map))
(defun actor-map (self)
  (%actor-map self))

(declaim (inline actor-unmap))
(defun actor-unmap (self)
  (%actor-unmap self))

(declaim (inline actor-allocate))
(defun actor-allocate (self box flags)
  (%actor-allocate self box flags))

(declaim (inline actor-allocate-preferred-size))
(defun actor-allocate-preferred-size (self flags)
  (%actor-allocate-preferred-size self flags))

(declaim (inline actor-allocate-available-size))
(defun actor-allocate-available-size (self x y available-width available-height flags)
  (%actor-allocate-available-size self x y available-width available-height flags))

(declaim (inline actor-get-allocation-box))
(defun actor-get-allocation-box (self box)
  (%actor-get-allocation-box self box))

(declaim (inline actor-get-allocation-geometry))
(defun actor-get-allocation-geometry (self geom)
  (%actor-get-allocation-geometry self geom))

(declaim (inline actor-get-allocation-vertices))
(defun actor-get-allocation-vertices (self ancestor verts[4])
  (%actor-get-allocation-vertices self ancestor verts[4]))

(declaim (inline actor-set-fixed-position-set))
(defun actor-set-fixed-position-set (self is-set)
  (%actor-set-fixed-position-set self is-set))

(declaim (inline actor-get-fixed-position-set))
(defun actor-get-fixed-position-set (self)
  (%actor-get-fixed-position-set self))

(declaim (inline actor-set-geometry))
(defun actor-set-geometry (self geometry)
  (%actor-set-geometry self geometry))

(declaim (inline actor-set-size))
(defun actor-set-size (self width height)
  (%actor-set-size self width height))

(declaim (inline actor-set-position))
(defun actor-set-position (self x y)
  (%actor-set-position self x y))

(declaim (inline actor-get-position))
(defun actor-get-position (self x y)
  (%actor-get-position self x y))

(declaim (inline actor-set-width))
(defun actor-set-width (self width)
  (%actor-set-width self width))

(declaim (inline actor-get-width))
(defun actor-get-width (self)
  (%actor-get-width self))

(declaim (inline actor-set-height))
(defun actor-set-height (self height)
  (%actor-set-height self height))

(declaim (inline actor-get-height))
(defun actor-get-height (self)
  (%actor-get-height self))

(declaim (inline actor-set-x))
(defun actor-set-x (self x)
  (%actor-set-x self x))

(declaim (inline actor-get-x))
(defun actor-get-x (self)
  (%actor-get-x self))

(declaim (inline actor-set-y))
(defun actor-set-y (self y)
  (%actor-set-y self y))

(declaim (inline actor-get-y))
(defun actor-get-y (self)
  (%actor-get-y self))

(declaim (inline actor-move-by))
(defun actor-move-by (self dx dy)
  (%actor-move-by self dx dy))

(declaim (inline actor-set-rotation))
(defun actor-set-rotation (self axis angle x y z)
  (%actor-set-rotation self axis angle x y z))

(declaim (inline actor-set-z-rotation-from-gravity))
(defun actor-set-z-rotation-from-gravity (self angle gravity)
  (%actor-set-z-rotation-from-gravity self angle gravity))

(declaim (inline actor-get-rotation))
(defun actor-get-rotation (self axis x y z)
  (%actor-get-rotation self axis x y z))

(declaim (inline actor-get-z-rotation-gravity))
(defun actor-get-z-rotation-gravity (self)
  (%actor-get-z-rotation-gravity self))

(declaim (inline actor-is-rotated))
(defun actor-is-rotated (self)
  (%actor-is-rotated self))

(declaim (inline actor-set-opacity))
(defun actor-set-opacity (self opacity)
  (%actor-set-opacity self opacity))

(declaim (inline actor-get-opacity))
(defun actor-get-opacity (self)
  (%actor-get-opacity self))

(declaim (inline actor-set-name))
(defun actor-set-name (self name)
  (%actor-set-name self name))

(declaim (inline actor-get-name))
(defun actor-get-name (self)
  (%actor-get-name self))

(declaim (inline actor-get-gid))
(defun actor-get-gid (self)
  (%actor-get-gid self))

(declaim (inline actor-set-clip))
(defun actor-set-clip (self xoff yoff width height)
  (%actor-set-clip self xoff yoff width height))

(declaim (inline actor-remove-clip))
(defun actor-remove-clip (self)
  (%actor-remove-clip self))

(declaim (inline actor-has-clip))
(defun actor-has-clip (self)
  (%actor-has-clip self))

(declaim (inline actor-get-clip))
(defun actor-get-clip (self xoff yoff width height)
  (%actor-get-clip self xoff yoff width height))

(declaim (inline actor-set-parent))
(defun actor-set-parent (self parent)
  (%actor-set-parent self parent))

(declaim (inline actor-get-parent))
(defun actor-get-parent (self)
  (%actor-get-parent self))

(declaim (inline actor-reparent))
(defun actor-reparent (self new-parent)
  (%actor-reparent self new-parent))

(declaim (inline actor-unparent))
(defun actor-unparent (self)
  (%actor-unparent self))

(declaim (inline actor-raise))
(defun actor-raise (self below)
  (%actor-raise self below))

(declaim (inline actor-lower))
(defun actor-lower (self above)
  (%actor-lower self above))

(declaim (inline actor-raise-top))
(defun actor-raise-top (self)
  (%actor-raise-top self))

(declaim (inline actor-lower-bottom))
(defun actor-lower-bottom (self)
  (%actor-lower-bottom self))

(declaim (inline actor-get-stage))
(defun actor-get-stage (actor)
  (%actor-get-stage actor))

(declaim (inline actor-set-depth))
(defun actor-set-depth (self depth)
  (%actor-set-depth self depth))

(declaim (inline actor-get-depth))
(defun actor-get-depth (self)
  (%actor-get-depth self))

(declaim (inline actor-set-scale))
(defun actor-set-scale (self scale-x scale-y)
  (%actor-set-scale self scale-x scale-y))

(declaim (inline actor-set-scale-full))
(defun actor-set-scale-full (self scale-x scale-y center-x center-y)
  (%actor-set-scale-full self scale-x scale-y center-x center-y))

(declaim (inline actor-set-scale-with-gravity))
(defun actor-set-scale-with-gravity (self scale-x scale-y gravity)
  (%actor-set-scale-with-gravity self scale-x scale-y gravity))

(declaim (inline actor-get-scale))
(defun actor-get-scale (self scale-x scale-y)
  (%actor-get-scale self scale-x scale-y))

(declaim (inline actor-get-scale-center))
(defun actor-get-scale-center (self center-x center-y)
  (%actor-get-scale-center self center-x center-y))

(declaim (inline actor-get-scale-gravity))
(defun actor-get-scale-gravity (self)
  (%actor-get-scale-gravity self))

(declaim (inline actor-is-scaled))
(defun actor-is-scaled (self)
  (%actor-is-scaled self))

(declaim (inline actor-apply-transform-to-point))
(defun actor-apply-transform-to-point (self point vertex)
  (%actor-apply-transform-to-point self point vertex))

(declaim (inline actor-transform-stage-point))
(defun actor-transform-stage-point (self x y x-out y-out)
  (%actor-transform-stage-point self x y x-out y-out))

(declaim (inline actor-apply-relative-transform-to-point))
(defun actor-apply-relative-transform-to-point (self ancestor point vertex)
  (%actor-apply-relative-transform-to-point self ancestor point vertex))

(declaim (inline actor-get-transformed-position))
(defun actor-get-transformed-position (self x y)
  (%actor-get-transformed-position self x y))

(declaim (inline actor-get-transformed-size))
(defun actor-get-transformed-size (self width height)
  (%actor-get-transformed-size self width height))

(declaim (inline actor-get-paint-opacity))
(defun actor-get-paint-opacity (self)
  (%actor-get-paint-opacity self))

(declaim (inline actor-get-paint-visibility))
(defun actor-get-paint-visibility (self)
  (%actor-get-paint-visibility self))

(declaim (inline actor-get-abs-allocation-vertices))
(defun actor-get-abs-allocation-vertices (self verts[4])
  (%actor-get-abs-allocation-vertices self verts[4]))

(declaim (inline actor-get-transformation-matrix))
(defun actor-get-transformation-matrix (self matrix)
  (%actor-get-transformation-matrix self matrix))

(declaim (inline actor-set-anchor-point))
(defun actor-set-anchor-point (self anchor-x anchor-y)
  (%actor-set-anchor-point self anchor-x anchor-y))

(declaim (inline actor-get-anchor-point))
(defun actor-get-anchor-point (self anchor-x anchor-y)
  (%actor-get-anchor-point self anchor-x anchor-y))

(declaim (inline actor-set-anchor-point-from-gravity))
(defun actor-set-anchor-point-from-gravity (self gravity)
  (%actor-set-anchor-point-from-gravity self gravity))

(declaim (inline actor-get-anchor-point-gravity))
(defun actor-get-anchor-point-gravity (self)
  (%actor-get-anchor-point-gravity self))

(declaim (inline actor-move-anchor-point))
(defun actor-move-anchor-point (self anchor-x anchor-y)
  (%actor-move-anchor-point self anchor-x anchor-y))

(declaim (inline actor-move-anchor-point-from-gravity))
(defun actor-move-anchor-point-from-gravity (self gravity)
  (%actor-move-anchor-point-from-gravity self gravity))

(declaim (inline actor-set-reactive))
(defun actor-set-reactive (actor reactive)
  (%actor-set-reactive actor reactive))

(declaim (inline actor-get-reactive))
(defun actor-get-reactive (actor)
  (%actor-get-reactive actor))

(declaim (inline actor-set-shader))
(defun actor-set-shader (self shader)
  (%actor-set-shader self shader))

(declaim (inline actor-get-shader))
(defun actor-get-shader (self)
  (%actor-get-shader self))

(declaim (inline actor-set-shader-param))
(defun actor-set-shader-param (self param value)
  (%actor-set-shader-param self param value))

(declaim (inline actor-set-shader-param-float))
(defun actor-set-shader-param-float (self param value)
  (%actor-set-shader-param-float self param value))

(declaim (inline actor-set-shader-param-int))
(defun actor-set-shader-param-int (self param value)
  (%actor-set-shader-param-int self param value))

(declaim (inline actor-grab-key-focus))
(defun actor-grab-key-focus (self)
  (%actor-grab-key-focus self))

(declaim (inline actor-get-pango-context))
(defun actor-get-pango-context (self)
  (%actor-get-pango-context self))

(declaim (inline actor-create-pango-context))
(defun actor-create-pango-context (self)
  (%actor-create-pango-context self))

(declaim (inline actor-create-pango-layout))
(defun actor-create-pango-layout (self text)
  (%actor-create-pango-layout self text))

(declaim (inline actor-box-new))
(defun actor-box-new (x-1 y-1 x-2 y-2)
  (%actor-box-new x-1 y-1 x-2 y-2))

(declaim (inline actor-box-copy))
(defun actor-box-copy (box)
  (%actor-box-copy box))

(declaim (inline actor-box-free))
(defun actor-box-free (box)
  (%actor-box-free box))

(declaim (inline actor-box-equal))
(defun actor-box-equal (box-a box-b)
  (%actor-box-equal box-a box-b))

(declaim (inline actor-box-get-x))
(defun actor-box-get-x (box)
  (%actor-box-get-x box))

(declaim (inline actor-box-get-y))
(defun actor-box-get-y (box)
  (%actor-box-get-y box))

(declaim (inline actor-box-get-width))
(defun actor-box-get-width (box)
  (%actor-box-get-width box))

(declaim (inline actor-box-get-height))
(defun actor-box-get-height (box)
  (%actor-box-get-height box))

(declaim (inline actor-box-get-origin))
(defun actor-box-get-origin (box x y)
  (%actor-box-get-origin box x y))

(declaim (inline actor-box-get-size))
(defun actor-box-get-size (box width height)
  (%actor-box-get-size box width height))

(declaim (inline actor-box-get-area))
(defun actor-box-get-area (box)
  (%actor-box-get-area box))

(declaim (inline actor-box-contains))
(defun actor-box-contains (box x y)
  (%actor-box-contains box x y))

(declaim (inline actor-box-from-vertices))
(defun actor-box-from-vertices (box verts)
  (%actor-box-from-vertices box verts))

(declaim (inline vertex-new))
(defun vertex-new (x y z)
  (%vertex-new x y z))

(declaim (inline vertex-copy))
(defun vertex-copy (vertex)
  (%vertex-copy vertex))

(declaim (inline vertex-free))
(defun vertex-free (vertex)
  (%vertex-free vertex))

(declaim (inline vertex-equal))
(defun vertex-equal (vertex-a vertex-b)
  (%vertex-equal vertex-a vertex-b))

(declaim (inline container-add-actor))
(defun container-add-actor (container actor)
  (%container-add-actor container actor))

(declaim (inline container-add-valist))
(defun container-add-valist (container first-actor var-args)
  (%container-add-valist container first-actor var-args))

(declaim (inline container-remove-actor))
(defun container-remove-actor (container actor)
  (%container-remove-actor container actor))

(declaim (inline container-remove-valist))
(defun container-remove-valist (container first-actor var-args)
  (%container-remove-valist container first-actor var-args))

(declaim (inline container-get-children))
(defun container-get-children (container)
  (%container-get-children container))

(declaim (inline container-foreach))
(defun container-foreach (container callback user-data)
  (%container-foreach container callback user-data))

(declaim (inline container-foreach-with-internals))
(defun container-foreach-with-internals (container callback user-data)
  (%container-foreach-with-internals container callback user-data))

(declaim (inline container-find-child-by-name))
(defun container-find-child-by-name (container child-name)
  (%container-find-child-by-name container child-name))

(declaim (inline container-raise-child))
(defun container-raise-child (container actor sibling)
  (%container-raise-child container actor sibling))

(declaim (inline container-lower-child))
(defun container-lower-child (container actor sibling)
  (%container-lower-child container actor sibling))

(declaim (inline container-sort-depth-order))
(defun container-sort-depth-order (container)
  (%container-sort-depth-order container))

(declaim (inline container-class-find-child-property))
(defun container-class-find-child-property (klass property-name)
  (%container-class-find-child-property klass property-name))

(declaim (inline container-class-list-child-properties))
(defun container-class-list-child-properties (klass n-properties)
  (%container-class-list-child-properties klass n-properties))

(declaim (inline container-child-set-property))
(defun container-child-set-property (container child property value)
  (%container-child-set-property container child property value))

(declaim (inline container-child-get-property))
(defun container-child-get-property (container child property value)
  (%container-child-get-property container child property value))

(declaim (inline container-get-child-meta))
(defun container-get-child-meta (container actor)
  (%container-get-child-meta container actor))

(declaim (inline child-meta-get-container))
(defun child-meta-get-container (data)
  (%child-meta-get-container data))

(declaim (inline child-meta-get-actor))
(defun child-meta-get-actor (data)
  (%child-meta-get-actor data))

(declaim (inline media-set-uri))
(defun media-set-uri (media uri)
  (%media-set-uri media uri))

(declaim (inline media-get-uri))
(defun media-get-uri (media)
  (%media-get-uri media))

(declaim (inline media-set-playing))
(defun media-set-playing (media playing)
  (%media-set-playing media playing))

(declaim (inline media-get-playing))
(defun media-get-playing (media)
  (%media-get-playing media))

(declaim (inline media-set-progress))
(defun media-set-progress (media progress)
  (%media-set-progress media progress))

(declaim (inline media-get-progress))
(defun media-get-progress (media)
  (%media-get-progress media))

(declaim (inline media-set-audio-volume))
(defun media-set-audio-volume (media volume)
  (%media-set-audio-volume media volume))

(declaim (inline media-get-audio-volume))
(defun media-get-audio-volume (media)
  (%media-get-audio-volume media))

(declaim (inline media-get-can-seek))
(defun media-get-can-seek (media)
  (%media-get-can-seek media))

(declaim (inline media-get-buffer-fill))
(defun media-get-buffer-fill (media)
  (%media-get-buffer-fill media))

(declaim (inline media-get-duration))
(defun media-get-duration (media)
  (%media-get-duration media))

(declaim (inline media-set-filename))
(defun media-set-filename (media filename)
  (%media-set-filename media filename))

(declaim (inline rectangle-new))
(defun rectangle-new ()
  (%rectangle-new))

(declaim (inline rectangle-new-with-color))
(defun rectangle-new-with-color (color)
  (%rectangle-new-with-color color))

(declaim (inline rectangle-get-color))
(defun rectangle-get-color (rectangle color)
  (%rectangle-get-color rectangle color))

(declaim (inline rectangle-set-color))
(defun rectangle-set-color (rectangle color)
  (%rectangle-set-color rectangle color))

(declaim (inline rectangle-get-border-color))
(defun rectangle-get-border-color (rectangle color)
  (%rectangle-get-border-color rectangle color))

(declaim (inline rectangle-set-border-color))
(defun rectangle-set-border-color (rectangle color)
  (%rectangle-set-border-color rectangle color))

(declaim (inline rectangle-get-border-width))
(defun rectangle-get-border-width (rectangle)
  (%rectangle-get-border-width rectangle))

(declaim (inline rectangle-set-border-width))
(defun rectangle-set-border-width (rectangle width)
  (%rectangle-set-border-width rectangle width))

(declaim (inline texture-new))
(defun texture-new ()
  (%texture-new))

(declaim (inline texture-new-from-file))
(defun texture-new-from-file (filename error)
  (%texture-new-from-file filename error))

(declaim (inline texture-new-from-actor))
(defun texture-new-from-actor (actor)
  (%texture-new-from-actor actor))

(declaim (inline texture-set-from-file))
(defun texture-set-from-file (texture filename error)
  (%texture-set-from-file texture filename error))

(declaim (inline texture-set-from-rgb-data))
(defun texture-set-from-rgb-data (texture data has-alpha width height rowstride bpp flags error)
  (%texture-set-from-rgb-data texture data has-alpha width height rowstride bpp flags error))

(declaim (inline texture-set-from-yuv-data))
(defun texture-set-from-yuv-data (texture data width height flags error)
  (%texture-set-from-yuv-data texture data width height flags error))

(declaim (inline texture-set-area-from-rgb-data))
(defun texture-set-area-from-rgb-data (texture data has-alpha x y width height rowstride bpp flags error)
  (%texture-set-area-from-rgb-data texture data has-alpha x y width height rowstride bpp flags error))

(declaim (inline texture-get-base-size))
(defun texture-get-base-size (texture width height)
  (%texture-get-base-size texture width height))

(declaim (inline texture-get-pixel-format))
(defun texture-get-pixel-format (texture)
  (%texture-get-pixel-format texture))

(declaim (inline texture-get-max-tile-waste))
(defun texture-get-max-tile-waste (texture)
  (%texture-get-max-tile-waste texture))

(declaim (inline texture-get-filter-quality))
(defun texture-get-filter-quality (texture)
  (%texture-get-filter-quality texture))

(declaim (inline texture-set-filter-quality))
(defun texture-set-filter-quality (texture filter-quality)
  (%texture-set-filter-quality texture filter-quality))

(declaim (inline texture-get-cogl-texture))
(defun texture-get-cogl-texture (texture)
  (%texture-get-cogl-texture texture))

(declaim (inline texture-set-cogl-texture))
(defun texture-set-cogl-texture (texture cogl-tex)
  (%texture-set-cogl-texture texture cogl-tex))

(declaim (inline texture-get-cogl-material))
(defun texture-get-cogl-material (texture)
  (%texture-get-cogl-material texture))

(declaim (inline texture-set-cogl-material))
(defun texture-set-cogl-material (texture cogl-material)
  (%texture-set-cogl-material texture cogl-material))

(declaim (inline texture-get-sync-size))
(defun texture-get-sync-size (texture)
  (%texture-get-sync-size texture))

(declaim (inline texture-set-sync-size))
(defun texture-set-sync-size (texture sync-size)
  (%texture-set-sync-size texture sync-size))

(declaim (inline texture-get-repeat))
(defun texture-get-repeat (texture repeat-x repeat-y)
  (%texture-get-repeat texture repeat-x repeat-y))

(declaim (inline texture-set-repeat))
(defun texture-set-repeat (texture repeat-x repeat-y)
  (%texture-set-repeat texture repeat-x repeat-y))

(declaim (inline texture-get-keep-aspect-ratio))
(defun texture-get-keep-aspect-ratio (texture)
  (%texture-get-keep-aspect-ratio texture))

(declaim (inline texture-set-keep-aspect-ratio))
(defun texture-set-keep-aspect-ratio (texture keep-aspect)
  (%texture-set-keep-aspect-ratio texture keep-aspect))

(declaim (inline texture-get-load-async))
(defun texture-get-load-async (texture)
  (%texture-get-load-async texture))

(declaim (inline texture-set-load-async))
(defun texture-set-load-async (texture load-async)
  (%texture-set-load-async texture load-async))

(declaim (inline texture-get-load-data-async))
(defun texture-get-load-data-async (texture)
  (%texture-get-load-data-async texture))

(declaim (inline texture-set-load-data-async))
(defun texture-set-load-data-async (texture load-async)
  (%texture-set-load-data-async texture load-async))

(declaim (inline clone-new))
(defun clone-new (source)
  (%clone-new source))

(declaim (inline clone-set-source))
(defun clone-set-source (clone source)
  (%clone-set-source clone source))

(declaim (inline clone-get-source))
(defun clone-get-source (clone)
  (%clone-get-source clone))

(declaim (inline text-new))
(defun text-new ()
  (%text-new))

(declaim (inline text-new-full))
(defun text-new-full (font-name text color)
  (%text-new-full font-name text color))

(declaim (inline text-new-with-text))
(defun text-new-with-text (font-name text)
  (%text-new-with-text font-name text))

(declaim (inline text-set-text))
(defun text-set-text (self text)
  (%text-set-text self text))

(declaim (inline text-set-markup))
(defun text-set-markup (self markup)
  (%text-set-markup self markup))

(declaim (inline text-get-text))
(defun text-get-text (self)
  (%text-get-text self))

(declaim (inline text-set-activatable))
(defun text-set-activatable (self activatable)
  (%text-set-activatable self activatable))

(declaim (inline text-get-activatable))
(defun text-get-activatable (self)
  (%text-get-activatable self))

(declaim (inline text-set-attributes))
(defun text-set-attributes (self attrs)
  (%text-set-attributes self attrs))

(declaim (inline text-get-attributes))
(defun text-get-attributes (self)
  (%text-get-attributes self))

(declaim (inline text-set-color))
(defun text-set-color (self color)
  (%text-set-color self color))

(declaim (inline text-get-color))
(defun text-get-color (self color)
  (%text-get-color self color))

(declaim (inline text-set-ellipsize))
(defun text-set-ellipsize (self mode)
  (%text-set-ellipsize self mode))

(declaim (inline text-get-ellipsize))
(defun text-get-ellipsize (self)
  (%text-get-ellipsize self))

(declaim (inline text-set-font-name))
(defun text-set-font-name (self font-name)
  (%text-set-font-name self font-name))

(declaim (inline text-get-font-name))
(defun text-get-font-name (self)
  (%text-get-font-name self))

(declaim (inline text-set-password-char))
(defun text-set-password-char (self wc)
  (%text-set-password-char self wc))

(declaim (inline text-get-password-char))
(defun text-get-password-char (self)
  (%text-get-password-char self))

(declaim (inline text-set-justify))
(defun text-set-justify (self justify)
  (%text-set-justify self justify))

(declaim (inline text-get-justify))
(defun text-get-justify (self)
  (%text-get-justify self))

(declaim (inline text-get-layout))
(defun text-get-layout (self)
  (%text-get-layout self))

(declaim (inline text-set-line-alignment))
(defun text-set-line-alignment (self alignment)
  (%text-set-line-alignment self alignment))

(declaim (inline text-get-line-alignment))
(defun text-get-line-alignment (self)
  (%text-get-line-alignment self))

(declaim (inline text-set-line-wrap))
(defun text-set-line-wrap (self line-wrap)
  (%text-set-line-wrap self line-wrap))

(declaim (inline text-get-line-wrap))
(defun text-get-line-wrap (self)
  (%text-get-line-wrap self))

(declaim (inline text-set-line-wrap-mode))
(defun text-set-line-wrap-mode (self wrap-mode)
  (%text-set-line-wrap-mode self wrap-mode))

(declaim (inline text-get-line-wrap-mode))
(defun text-get-line-wrap-mode (self)
  (%text-get-line-wrap-mode self))

(declaim (inline text-set-max-length))
(defun text-set-max-length (self max)
  (%text-set-max-length self max))

(declaim (inline text-get-max-length))
(defun text-get-max-length (self)
  (%text-get-max-length self))

(declaim (inline text-set-selectable))
(defun text-set-selectable (self selectable)
  (%text-set-selectable self selectable))

(declaim (inline text-get-selectable))
(defun text-get-selectable (self)
  (%text-get-selectable self))

(declaim (inline text-set-selection))
(defun text-set-selection (self start-pos end-pos)
  (%text-set-selection self start-pos end-pos))

(declaim (inline text-get-selection))
(defun text-get-selection (self)
  (%text-get-selection self))

(declaim (inline text-set-selection-bound))
(defun text-set-selection-bound (self selection-bound)
  (%text-set-selection-bound self selection-bound))

(declaim (inline text-get-selection-bound))
(defun text-get-selection-bound (self)
  (%text-get-selection-bound self))

(declaim (inline text-set-single-line-mode))
(defun text-set-single-line-mode (self single-line)
  (%text-set-single-line-mode self single-line))

(declaim (inline text-get-single-line-mode))
(defun text-get-single-line-mode (self)
  (%text-get-single-line-mode self))

(declaim (inline text-set-use-markup))
(defun text-set-use-markup (self setting)
  (%text-set-use-markup self setting))

(declaim (inline text-get-use-markup))
(defun text-get-use-markup (self)
  (%text-get-use-markup self))

(declaim (inline text-set-editable))
(defun text-set-editable (self editable)
  (%text-set-editable self editable))

(declaim (inline text-get-editable))
(defun text-get-editable (self)
  (%text-get-editable self))

(declaim (inline text-insert-text))
(defun text-insert-text (self text position)
  (%text-insert-text self text position))

(declaim (inline text-insert-unichar))
(defun text-insert-unichar (self wc)
  (%text-insert-unichar self wc))

(declaim (inline text-delete-chars))
(defun text-delete-chars (self n-chars)
  (%text-delete-chars self n-chars))

(declaim (inline text-delete-text))
(defun text-delete-text (self start-pos end-pos)
  (%text-delete-text self start-pos end-pos))

(declaim (inline text-delete-selection))
(defun text-delete-selection (self)
  (%text-delete-selection self))

(declaim (inline text-get-chars))
(defun text-get-chars (self start-pos end-pos)
  (%text-get-chars self start-pos end-pos))

(declaim (inline text-set-cursor-color))
(defun text-set-cursor-color (self color)
  (%text-set-cursor-color self color))

(declaim (inline text-get-cursor-color))
(defun text-get-cursor-color (self color)
  (%text-get-cursor-color self color))

(declaim (inline text-set-selection-color))
(defun text-set-selection-color (self color)
  (%text-set-selection-color self color))

(declaim (inline text-get-selection-color))
(defun text-get-selection-color (self color)
  (%text-get-selection-color self color))

(declaim (inline text-set-cursor-position))
(defun text-set-cursor-position (self position)
  (%text-set-cursor-position self position))

(declaim (inline text-get-cursor-position))
(defun text-get-cursor-position (self)
  (%text-get-cursor-position self))

(declaim (inline text-set-cursor-visible))
(defun text-set-cursor-visible (self cursor-visible)
  (%text-set-cursor-visible self cursor-visible))

(declaim (inline text-get-cursor-visible))
(defun text-get-cursor-visible (self)
  (%text-get-cursor-visible self))

(declaim (inline text-set-cursor-size))
(defun text-set-cursor-size (self size)
  (%text-set-cursor-size self size))

(declaim (inline text-get-cursor-size))
(defun text-get-cursor-size (self)
  (%text-get-cursor-size self))

(declaim (inline text-activate))
(defun text-activate (self)
  (%text-activate self))

(declaim (inline text-position-to-coords))
(defun text-position-to-coords (self position x y line-height)
  (%text-position-to-coords self position x y line-height))

(declaim (inline cairo-texture-new))
(defun cairo-texture-new (width height)
  (%cairo-texture-new width height))

(declaim (inline cairo-texture-set-surface-size))
(defun cairo-texture-set-surface-size (self width height)
  (%cairo-texture-set-surface-size self width height))

(declaim (inline cairo-texture-get-surface-size))
(defun cairo-texture-get-surface-size (self width height)
  (%cairo-texture-get-surface-size self width height))

(declaim (inline cairo-texture-create))
(defun cairo-texture-create (self)
  (%cairo-texture-create self))

(declaim (inline cairo-texture-create-region))
(defun cairo-texture-create-region (self x-offset y-offset width height)
  (%cairo-texture-create-region self x-offset y-offset width height))

(declaim (inline cairo-texture-clear))
(defun cairo-texture-clear (self)
  (%cairo-texture-clear self))

(declaim (inline cairo-set-source-color))
(defun cairo-set-source-color (cr color)
  (%cairo-set-source-color cr color))

(declaim (inline group-new))
(defun group-new ()
  (%group-new))

(declaim (inline group-remove-all))
(defun group-remove-all (group)
  (%group-remove-all group))

(declaim (inline group-get-n-children))
(defun group-get-n-children (self)
  (%group-get-n-children self))

(declaim (inline group-get-nth-child))
(defun group-get-nth-child (self index-)
  (%group-get-nth-child self index-))

(declaim (inline stage-get-default))
(defun stage-get-default ()
  (%stage-get-default))

(declaim (inline stage-new))
(defun stage-new ()
  (%stage-new))

(declaim (inline stage-is-default))
(defun stage-is-default (stage)
  (%stage-is-default stage))

(declaim (inline stage-set-color))
(defun stage-set-color (stage color)
  (%stage-set-color stage color))

(declaim (inline stage-get-color))
(defun stage-get-color (stage color)
  (%stage-get-color stage color))

(declaim (inline stage-set-fullscreen))
(defun stage-set-fullscreen (stage fullscreen)
  (%stage-set-fullscreen stage fullscreen))

(declaim (inline stage-get-fullscreen))
(defun stage-get-fullscreen (stage)
  (%stage-get-fullscreen stage))

(declaim (inline stage-show-cursor))
(defun stage-show-cursor (stage)
  (%stage-show-cursor stage))

(declaim (inline stage-hide-cursor))
(defun stage-hide-cursor (stage)
  (%stage-hide-cursor stage))

(declaim (inline stage-ensure-current))
(defun stage-ensure-current (stage)
  (%stage-ensure-current stage))

(declaim (inline stage-ensure-viewport))
(defun stage-ensure-viewport (stage)
  (%stage-ensure-viewport stage))

(declaim (inline stage-ensure-redraw))
(defun stage-ensure-redraw (stage)
  (%stage-ensure-redraw stage))

(declaim (inline stage-queue-redraw))
(defun stage-queue-redraw (stage)
  (%stage-queue-redraw stage))

(declaim (inline stage-event))
(defun stage-event (stage event)
  (%stage-event stage event))

(declaim (inline stage-set-key-focus))
(defun stage-set-key-focus (stage actor)
  (%stage-set-key-focus stage actor))

(declaim (inline stage-get-key-focus))
(defun stage-get-key-focus (stage)
  (%stage-get-key-focus stage))

(declaim (inline stage-read-pixels))
(defun stage-read-pixels (stage x y width height)
  (%stage-read-pixels stage x y width height))

(declaim (inline stage-set-perspective))
(defun stage-set-perspective (stage perspective)
  (%stage-set-perspective stage perspective))

(declaim (inline stage-get-perspective))
(defun stage-get-perspective (stage perspective)
  (%stage-get-perspective stage perspective))

(declaim (inline stage-set-title))
(defun stage-set-title (stage title)
  (%stage-set-title stage title))

(declaim (inline stage-get-title))
(defun stage-get-title (stage)
  (%stage-get-title stage))

(declaim (inline stage-set-user-resizable))
(defun stage-set-user-resizable (stage resizable)
  (%stage-set-user-resizable stage resizable))

(declaim (inline stage-get-user-resizable))
(defun stage-get-user-resizable (stage)
  (%stage-get-user-resizable stage))

(declaim (inline stage-set-use-fog))
(defun stage-set-use-fog (stage fog)
  (%stage-set-use-fog stage fog))

(declaim (inline stage-get-use-fog))
(defun stage-get-use-fog (stage)
  (%stage-get-use-fog stage))

(declaim (inline stage-set-fog))
(defun stage-set-fog (stage fog)
  (%stage-set-fog stage fog))

(declaim (inline stage-get-fog))
(defun stage-get-fog (stage fog)
  (%stage-get-fog stage fog))

(declaim (inline timeline-new))
(defun timeline-new (msecs)
  (%timeline-new msecs))

(declaim (inline timeline-clone))
(defun timeline-clone (timeline)
  (%timeline-clone timeline))

(declaim (inline timeline-set-duration))
(defun timeline-set-duration (timeline msecs)
  (%timeline-set-duration timeline msecs))

(declaim (inline timeline-get-duration))
(defun timeline-get-duration (timeline)
  (%timeline-get-duration timeline))

(declaim (inline timeline-set-loop))
(defun timeline-set-loop (timeline loop)
  (%timeline-set-loop timeline loop))

(declaim (inline timeline-get-loop))
(defun timeline-get-loop (timeline)
  (%timeline-get-loop timeline))

(declaim (inline timeline-set-delay))
(defun timeline-set-delay (timeline msecs)
  (%timeline-set-delay timeline msecs))

(declaim (inline timeline-get-delay))
(defun timeline-get-delay (timeline)
  (%timeline-get-delay timeline))

(declaim (inline timeline-set-direction))
(defun timeline-set-direction (timeline direction)
  (%timeline-set-direction timeline direction))

(declaim (inline timeline-get-direction))
(defun timeline-get-direction (timeline)
  (%timeline-get-direction timeline))

(declaim (inline timeline-start))
(defun timeline-start (timeline)
  (%timeline-start timeline))

(declaim (inline timeline-pause))
(defun timeline-pause (timeline)
  (%timeline-pause timeline))

(declaim (inline timeline-stop))
(defun timeline-stop (timeline)
  (%timeline-stop timeline))

(declaim (inline timeline-rewind))
(defun timeline-rewind (timeline)
  (%timeline-rewind timeline))

(declaim (inline timeline-skip))
(defun timeline-skip (timeline msecs)
  (%timeline-skip timeline msecs))

(declaim (inline timeline-advance))
(defun timeline-advance (timeline msecs)
  (%timeline-advance timeline msecs))

(declaim (inline timeline-get-elapsed-time))
(defun timeline-get-elapsed-time (timeline)
  (%timeline-get-elapsed-time timeline))

(declaim (inline timeline-get-delta))
(defun timeline-get-delta (timeline)
  (%timeline-get-delta timeline))

(declaim (inline timeline-get-progress))
(defun timeline-get-progress (timeline)
  (%timeline-get-progress timeline))

(declaim (inline timeline-is-playing))
(defun timeline-is-playing (timeline)
  (%timeline-is-playing timeline))

(declaim (inline timeline-add-marker-at-time))
(defun timeline-add-marker-at-time (timeline marker-name msecs)
  (%timeline-add-marker-at-time timeline marker-name msecs))

(declaim (inline timeline-has-marker))
(defun timeline-has-marker (timeline marker-name)
  (%timeline-has-marker timeline marker-name))

(declaim (inline timeline-list-markers))
(defun timeline-list-markers (timeline msecs n-markers)
  (%timeline-list-markers timeline msecs n-markers))

(declaim (inline timeline-remove-marker))
(defun timeline-remove-marker (timeline marker-name)
  (%timeline-remove-marker timeline marker-name))

(declaim (inline timeline-advance-to-marker))
(defun timeline-advance-to-marker (timeline marker-name)
  (%timeline-advance-to-marker timeline marker-name))

(declaim (inline score-new))
(defun score-new ()
  (%score-new))

(declaim (inline score-set-loop))
(defun score-set-loop (score loop)
  (%score-set-loop score loop))

(declaim (inline score-get-loop))
(defun score-get-loop (score)
  (%score-get-loop score))

(declaim (inline score-append-at-marker))
(defun score-append-at-marker (score parent marker-name timeline)
  (%score-append-at-marker score parent marker-name timeline))

(declaim (inline score-remove))
(defun score-remove (score id)
  (%score-remove score id))

(declaim (inline score-remove-all))
(defun score-remove-all (score)
  (%score-remove-all score))

(declaim (inline score-get-timeline))
(defun score-get-timeline (score id)
  (%score-get-timeline score id))

(declaim (inline score-list-timelines))
(defun score-list-timelines (score)
  (%score-list-timelines score))

(declaim (inline score-start))
(defun score-start (score)
  (%score-start score))

(declaim (inline score-pause))
(defun score-pause (score)
  (%score-pause score))

(declaim (inline score-stop))
(defun score-stop (score)
  (%score-stop score))

(declaim (inline score-is-playing))
(defun score-is-playing (score)
  (%score-is-playing score))

(declaim (inline score-rewind))
(defun score-rewind (score)
  (%score-rewind score))

(declaim (inline alpha-new))
(defun alpha-new ()
  (%alpha-new))

(declaim (inline alpha-new-full))
(defun alpha-new-full (timeline mode)
  (%alpha-new-full timeline mode))

(declaim (inline alpha-new-with-func))
(defun alpha-new-with-func (timeline func data destroy)
  (%alpha-new-with-func timeline func data destroy))

(declaim (inline alpha-set-timeline))
(defun alpha-set-timeline (alpha timeline)
  (%alpha-set-timeline alpha timeline))

(declaim (inline alpha-get-timeline))
(defun alpha-get-timeline (alpha)
  (%alpha-get-timeline alpha))

(declaim (inline alpha-get-mode))
(defun alpha-get-mode (alpha)
  (%alpha-get-mode alpha))

(declaim (inline alpha-get-alpha))
(defun alpha-get-alpha (alpha)
  (%alpha-get-alpha alpha))

(declaim (inline alpha-set-func))
(defun alpha-set-func (alpha func data destroy)
  (%alpha-set-func alpha func data destroy))

(declaim (inline alpha-set-closure))
(defun alpha-set-closure (alpha closure)
  (%alpha-set-closure alpha closure))

(declaim (inline alpha-register-closure))
(defun alpha-register-closure (closure)
  (%alpha-register-closure closure))

(declaim (inline alpha-register-func))
(defun alpha-register-func (func data)
  (%alpha-register-func func data))

(declaim (inline behaviour-apply))
(defun behaviour-apply (behave actor)
  (%behaviour-apply behave actor))

(declaim (inline behaviour-remove))
(defun behaviour-remove (behave actor)
  (%behaviour-remove behave actor))

(declaim (inline behaviour-remove-all))
(defun behaviour-remove-all (behave)
  (%behaviour-remove-all behave))

(declaim (inline behaviour-is-applied))
(defun behaviour-is-applied (behave actor)
  (%behaviour-is-applied behave actor))

(declaim (inline behaviour-actors-foreach))
(defun behaviour-actors-foreach (behave func data)
  (%behaviour-actors-foreach behave func data))

(declaim (inline behaviour-get-actors))
(defun behaviour-get-actors (behave)
  (%behaviour-get-actors behave))

(declaim (inline behaviour-get-n-actors))
(defun behaviour-get-n-actors (behave)
  (%behaviour-get-n-actors behave))

(declaim (inline behaviour-get-nth-actor))
(defun behaviour-get-nth-actor (behave index-)
  (%behaviour-get-nth-actor behave index-))

(declaim (inline behaviour-get-alpha))
(defun behaviour-get-alpha (behave)
  (%behaviour-get-alpha behave))

(declaim (inline behaviour-set-alpha))
(defun behaviour-set-alpha (behave alpha)
  (%behaviour-set-alpha behave alpha))

(declaim (inline behaviour-depth-new))
(defun behaviour-depth-new (alpha depth-start depth-end)
  (%behaviour-depth-new alpha depth-start depth-end))

(declaim (inline behaviour-depth-set-bounds))
(defun behaviour-depth-set-bounds (behaviour depth-start depth-end)
  (%behaviour-depth-set-bounds behaviour depth-start depth-end))

(declaim (inline behaviour-depth-get-bounds))
(defun behaviour-depth-get-bounds (behaviour depth-start depth-end)
  (%behaviour-depth-get-bounds behaviour depth-start depth-end))

(declaim (inline behaviour-ellipse-new))
(defun behaviour-ellipse-new (alpha x y width height direction start end)
  (%behaviour-ellipse-new alpha x y width height direction start end))

(declaim (inline behaviour-ellipse-set-center))
(defun behaviour-ellipse-set-center (self x y)
  (%behaviour-ellipse-set-center self x y))

(declaim (inline behaviour-ellipse-get-center))
(defun behaviour-ellipse-get-center (self x y)
  (%behaviour-ellipse-get-center self x y))

(declaim (inline behaviour-ellipse-set-angle-start))
(defun behaviour-ellipse-set-angle-start (self angle-start)
  (%behaviour-ellipse-set-angle-start self angle-start))

(declaim (inline behaviour-ellipse-get-angle-start))
(defun behaviour-ellipse-get-angle-start (self)
  (%behaviour-ellipse-get-angle-start self))

(declaim (inline behaviour-ellipse-set-angle-end))
(defun behaviour-ellipse-set-angle-end (self angle-end)
  (%behaviour-ellipse-set-angle-end self angle-end))

(declaim (inline behaviour-ellipse-get-angle-end))
(defun behaviour-ellipse-get-angle-end (self)
  (%behaviour-ellipse-get-angle-end self))

(declaim (inline behaviour-ellipse-set-angle-tilt))
(defun behaviour-ellipse-set-angle-tilt (self axis angle-tilt)
  (%behaviour-ellipse-set-angle-tilt self axis angle-tilt))

(declaim (inline behaviour-ellipse-get-angle-tilt))
(defun behaviour-ellipse-get-angle-tilt (self axis)
  (%behaviour-ellipse-get-angle-tilt self axis))

(declaim (inline behaviour-ellipse-set-height))
(defun behaviour-ellipse-set-height (self height)
  (%behaviour-ellipse-set-height self height))

(declaim (inline behaviour-ellipse-get-height))
(defun behaviour-ellipse-get-height (self)
  (%behaviour-ellipse-get-height self))

(declaim (inline behaviour-ellipse-set-width))
(defun behaviour-ellipse-set-width (self width)
  (%behaviour-ellipse-set-width self width))

(declaim (inline behaviour-ellipse-get-width))
(defun behaviour-ellipse-get-width (self)
  (%behaviour-ellipse-get-width self))

(declaim (inline behaviour-ellipse-set-tilt))
(defun behaviour-ellipse-set-tilt (self angle-tilt-x angle-tilt-y angle-tilt-z)
  (%behaviour-ellipse-set-tilt self angle-tilt-x angle-tilt-y angle-tilt-z))

(declaim (inline behaviour-ellipse-get-tilt))
(defun behaviour-ellipse-get-tilt (self angle-tilt-x angle-tilt-y angle-tilt-z)
  (%behaviour-ellipse-get-tilt self angle-tilt-x angle-tilt-y angle-tilt-z))

(declaim (inline behaviour-ellipse-set-direction))
(defun behaviour-ellipse-set-direction (self direction)
  (%behaviour-ellipse-set-direction self direction))

(declaim (inline behaviour-ellipse-get-direction))
(defun behaviour-ellipse-get-direction (self)
  (%behaviour-ellipse-get-direction self))

(declaim (inline behaviour-opacity-new))
(defun behaviour-opacity-new (alpha opacity-start opacity-end)
  (%behaviour-opacity-new alpha opacity-start opacity-end))

(declaim (inline behaviour-opacity-set-bounds))
(defun behaviour-opacity-set-bounds (behaviour opacity-start opacity-end)
  (%behaviour-opacity-set-bounds behaviour opacity-start opacity-end))

(declaim (inline behaviour-opacity-get-bounds))
(defun behaviour-opacity-get-bounds (behaviour opacity-start opacity-end)
  (%behaviour-opacity-get-bounds behaviour opacity-start opacity-end))

(declaim (inline behaviour-path-new))
(defun behaviour-path-new (alpha path)
  (%behaviour-path-new alpha path))

(declaim (inline behaviour-path-new-with-description))
(defun behaviour-path-new-with-description (alpha desc)
  (%behaviour-path-new-with-description alpha desc))

(declaim (inline behaviour-path-new-with-knots))
(defun behaviour-path-new-with-knots (alpha knots n-knots)
  (%behaviour-path-new-with-knots alpha knots n-knots))

(declaim (inline behaviour-path-set-path))
(defun behaviour-path-set-path (pathb path)
  (%behaviour-path-set-path pathb path))

(declaim (inline behaviour-path-get-path))
(defun behaviour-path-get-path (pathb)
  (%behaviour-path-get-path pathb))

(declaim (inline knot-copy))
(defun knot-copy (knot)
  (%knot-copy knot))

(declaim (inline knot-free))
(defun knot-free (knot)
  (%knot-free knot))

(declaim (inline knot-equal))
(defun knot-equal (knot-a knot-b)
  (%knot-equal knot-a knot-b))

(declaim (inline path-new))
(defun path-new ()
  (%path-new))

(declaim (inline path-new-with-description))
(defun path-new-with-description (desc)
  (%path-new-with-description desc))

(declaim (inline path-add-move-to))
(defun path-add-move-to (path x y)
  (%path-add-move-to path x y))

(declaim (inline path-add-rel-move-to))
(defun path-add-rel-move-to (path x y)
  (%path-add-rel-move-to path x y))

(declaim (inline path-add-line-to))
(defun path-add-line-to (path x y)
  (%path-add-line-to path x y))

(declaim (inline path-add-rel-line-to))
(defun path-add-rel-line-to (path x y)
  (%path-add-rel-line-to path x y))

(declaim (inline path-add-curve-to))
(defun path-add-curve-to (path x-1 y-1 x-2 y-2 x-3 y-3)
  (%path-add-curve-to path x-1 y-1 x-2 y-2 x-3 y-3))

(declaim (inline path-add-rel-curve-to))
(defun path-add-rel-curve-to (path x-1 y-1 x-2 y-2 x-3 y-3)
  (%path-add-rel-curve-to path x-1 y-1 x-2 y-2 x-3 y-3))

(declaim (inline path-add-close))
(defun path-add-close (path)
  (%path-add-close path))

(declaim (inline path-add-string))
(defun path-add-string (path str)
  (%path-add-string path str))

(declaim (inline path-add-node))
(defun path-add-node (path node)
  (%path-add-node path node))

(declaim (inline path-add-cairo-path))
(defun path-add-cairo-path (path cpath)
  (%path-add-cairo-path path cpath))

(declaim (inline path-get-n-nodes))
(defun path-get-n-nodes (path)
  (%path-get-n-nodes path))

(declaim (inline path-get-node))
(defun path-get-node (path index- node)
  (%path-get-node path index- node))

(declaim (inline path-get-nodes))
(defun path-get-nodes (path)
  (%path-get-nodes path))

(declaim (inline path-foreach))
(defun path-foreach (path callback user-data)
  (%path-foreach path callback user-data))

(declaim (inline path-insert-node))
(defun path-insert-node (path index- node)
  (%path-insert-node path index- node))

(declaim (inline path-remove-node))
(defun path-remove-node (path index-)
  (%path-remove-node path index-))

(declaim (inline path-replace-node))
(defun path-replace-node (path index- node)
  (%path-replace-node path index- node))

(declaim (inline path-get-description))
(defun path-get-description (path)
  (%path-get-description path))

(declaim (inline path-set-description))
(defun path-set-description (path str)
  (%path-set-description path str))

(declaim (inline path-to-cairo-path))
(defun path-to-cairo-path (path cr)
  (%path-to-cairo-path path cr))

(declaim (inline path-clear))
(defun path-clear (path)
  (%path-clear path))

(declaim (inline path-get-position))
(defun path-get-position (path progress position)
  (%path-get-position path progress position))

(declaim (inline path-get-length))
(defun path-get-length (path)
  (%path-get-length path))

(declaim (inline path-node-copy))
(defun path-node-copy (node)
  (%path-node-copy node))

(declaim (inline path-node-free))
(defun path-node-free (node)
  (%path-node-free node))

(declaim (inline path-node-equal))
(defun path-node-equal (node-a node-b)
  (%path-node-equal node-a node-b))

(declaim (inline behaviour-rotate-new))
(defun behaviour-rotate-new (alpha axis direction angle-start angle-end)
  (%behaviour-rotate-new alpha axis direction angle-start angle-end))

(declaim (inline behaviour-rotate-set-axis))
(defun behaviour-rotate-set-axis (rotate axis)
  (%behaviour-rotate-set-axis rotate axis))

(declaim (inline behaviour-rotate-get-axis))
(defun behaviour-rotate-get-axis (rotate)
  (%behaviour-rotate-get-axis rotate))

(declaim (inline behaviour-rotate-set-direction))
(defun behaviour-rotate-set-direction (rotate direction)
  (%behaviour-rotate-set-direction rotate direction))

(declaim (inline behaviour-rotate-get-direction))
(defun behaviour-rotate-get-direction (rotate)
  (%behaviour-rotate-get-direction rotate))

(declaim (inline behaviour-rotate-set-bounds))
(defun behaviour-rotate-set-bounds (rotate angle-start angle-end)
  (%behaviour-rotate-set-bounds rotate angle-start angle-end))

(declaim (inline behaviour-rotate-get-bounds))
(defun behaviour-rotate-get-bounds (rotate angle-start angle-end)
  (%behaviour-rotate-get-bounds rotate angle-start angle-end))

(declaim (inline behaviour-rotate-set-center))
(defun behaviour-rotate-set-center (rotate x y z)
  (%behaviour-rotate-set-center rotate x y z))

(declaim (inline behaviour-rotate-get-center))
(defun behaviour-rotate-get-center (rotate x y z)
  (%behaviour-rotate-get-center rotate x y z))

(declaim (inline behaviour-scale-new))
(defun behaviour-scale-new (alpha x-scale-start y-scale-start x-scale-end y-scale-end)
  (%behaviour-scale-new alpha x-scale-start y-scale-start x-scale-end y-scale-end))

(declaim (inline behaviour-scale-set-bounds))
(defun behaviour-scale-set-bounds (scale x-scale-start y-scale-start x-scale-end y-scale-end)
  (%behaviour-scale-set-bounds scale x-scale-start y-scale-start x-scale-end y-scale-end))

(declaim (inline behaviour-scale-get-bounds))
(defun behaviour-scale-get-bounds (scale x-scale-start y-scale-start x-scale-end y-scale-end)
  (%behaviour-scale-get-bounds scale x-scale-start y-scale-start x-scale-end y-scale-end))

(declaim (inline interval-new-with-values))
(defun interval-new-with-values (gtype initial final)
  (%interval-new-with-values gtype initial final))

(declaim (inline interval-clone))
(defun interval-clone (interval)
  (%interval-clone interval))

(declaim (inline interval-get-value-type))
(defun interval-get-value-type (interval)
  (%interval-get-value-type interval))

(declaim (inline interval-set-initial-value))
(defun interval-set-initial-value (interval value)
  (%interval-set-initial-value interval value))

(declaim (inline interval-get-initial-value))
(defun interval-get-initial-value (interval value)
  (%interval-get-initial-value interval value))

(declaim (inline interval-peek-initial-value))
(defun interval-peek-initial-value (interval)
  (%interval-peek-initial-value interval))

(declaim (inline interval-set-final-value))
(defun interval-set-final-value (interval value)
  (%interval-set-final-value interval value))

(declaim (inline interval-get-final-value))
(defun interval-get-final-value (interval value)
  (%interval-get-final-value interval value))

(declaim (inline interval-peek-final-value))
(defun interval-peek-final-value (interval)
  (%interval-peek-final-value interval))

(declaim (inline interval-compute-value))
(defun interval-compute-value (interval factor value)
  (%interval-compute-value interval factor value))

(declaim (inline interval-validate))
(defun interval-validate (interval pspec)
  (%interval-validate interval pspec))

(declaim (inline interval-register-progress-func))
(defun interval-register-progress-func (value-type func)
  (%interval-register-progress-func value-type func))

(declaim (inline animation-new))
(defun animation-new ()
  (%animation-new))

(declaim (inline animation-set-object))
(defun animation-set-object (animation object)
  (%animation-set-object animation object))

(declaim (inline animation-get-object))
(defun animation-get-object (animation)
  (%animation-get-object animation))

(declaim (inline animation-set-mode))
(defun animation-set-mode (animation mode)
  (%animation-set-mode animation mode))

(declaim (inline animation-get-mode))
(defun animation-get-mode (animation)
  (%animation-get-mode animation))

(declaim (inline animation-set-duration))
(defun animation-set-duration (animation msecs)
  (%animation-set-duration animation msecs))

(declaim (inline animation-get-duration))
(defun animation-get-duration (animation)
  (%animation-get-duration animation))

(declaim (inline animation-set-loop))
(defun animation-set-loop (animation loop)
  (%animation-set-loop animation loop))

(declaim (inline animation-get-loop))
(defun animation-get-loop (animation)
  (%animation-get-loop animation))

(declaim (inline animation-set-timeline))
(defun animation-set-timeline (animation timeline)
  (%animation-set-timeline animation timeline))

(declaim (inline animation-get-timeline))
(defun animation-get-timeline (animation)
  (%animation-get-timeline animation))

(declaim (inline animation-set-alpha))
(defun animation-set-alpha (animation alpha)
  (%animation-set-alpha animation alpha))

(declaim (inline animation-get-alpha))
(defun animation-get-alpha (animation)
  (%animation-get-alpha animation))

(declaim (inline animation-completed))
(defun animation-completed (animation)
  (%animation-completed animation))

(declaim (inline animation-bind))
(defun animation-bind (animation property-name final)
  (%animation-bind animation property-name final))

(declaim (inline animation-bind-interval))
(defun animation-bind-interval (animation property-name interval)
  (%animation-bind-interval animation property-name interval))

(declaim (inline animation-update-interval))
(defun animation-update-interval (animation property-name interval)
  (%animation-update-interval animation property-name interval))

(declaim (inline animation-has-property))
(defun animation-has-property (animation property-name)
  (%animation-has-property animation property-name))

(declaim (inline animation-unbind-property))
(defun animation-unbind-property (animation property-name)
  (%animation-unbind-property animation property-name))

(declaim (inline animation-get-interval))
(defun animation-get-interval (animation property-name)
  (%animation-get-interval animation property-name))

(declaim (inline actor-animatev))
(defun actor-animatev (actor mode duration n-properties properties values)
  (%actor-animatev actor mode duration n-properties properties values))

(declaim (inline actor-animate-with-timelinev))
(defun actor-animate-with-timelinev (actor mode timeline n-properties properties values)
  (%actor-animate-with-timelinev actor mode timeline n-properties properties values))

(declaim (inline actor-animate-with-alphav))
(defun actor-animate-with-alphav (actor alpha n-properties properties values)
  (%actor-animate-with-alphav actor alpha n-properties properties values))

(declaim (inline actor-get-animation))
(defun actor-get-animation (actor)
  (%actor-get-animation actor))

(declaim (inline animatable-animate-property))
(defun animatable-animate-property (animatable animation property-name initial-value final-value progress value)
  (%animatable-animate-property animatable animation property-name initial-value final-value progress value))

(declaim (inline color-new))
(defun color-new (red green blue alpha)
  (%color-new red green blue alpha))

(declaim (inline color-copy))
(defun color-copy (color)
  (%color-copy color))

(declaim (inline color-free))
(defun color-free (color)
  (%color-free color))

(declaim (inline color-equal))
(defun color-equal (v1 v2)
  (%color-equal v1 v2))

(declaim (inline color-hash))
(defun color-hash (v)
  (%color-hash v))

(declaim (inline color-from-string))
(defun color-from-string (color str)
  (%color-from-string color str))

(declaim (inline color-to-string))
(defun color-to-string (color)
  (%color-to-string color))

(declaim (inline color-from-hls))
(defun color-from-hls (color hue luminance saturation)
  (%color-from-hls color hue luminance saturation))

(declaim (inline color-to-hls))
(defun color-to-hls (color hue luminance saturation)
  (%color-to-hls color hue luminance saturation))

(declaim (inline color-from-pixel))
(defun color-from-pixel (color pixel)
  (%color-from-pixel color pixel))

(declaim (inline color-to-pixel))
(defun color-to-pixel (color)
  (%color-to-pixel color))

(declaim (inline color-add))
(defun color-add (a b result)
  (%color-add a b result))

(declaim (inline color-subtract))
(defun color-subtract (a b result)
  (%color-subtract a b result))

(declaim (inline color-lighten))
(defun color-lighten (color result)
  (%color-lighten color result))

(declaim (inline color-darken))
(defun color-darken (color result)
  (%color-darken color result))

(declaim (inline color-shade))
(defun color-shade (color factor result)
  (%color-shade color factor result))

(declaim (inline param-spec-color))
(defun param-spec-color (name nick blurb default-value flags)
  (%param-spec-color name nick blurb default-value flags))

(declaim (inline value-set-color))
(defun value-set-color (value color)
  (%value-set-color value color))

(declaim (inline value-get-color))
(defun value-get-color (value)
  (%value-get-color value))

(declaim (inline binding-pool-new))
(defun binding-pool-new (name)
  (%binding-pool-new name))

(declaim (inline binding-pool-get-for-class))
(defun binding-pool-get-for-class (klass)
  (%binding-pool-get-for-class klass))

(declaim (inline binding-pool-find))
(defun binding-pool-find (name)
  (%binding-pool-find name))

(declaim (inline binding-pool-install-action))
(defun binding-pool-install-action (pool action-name key-val modifiers callback data notify)
  (%binding-pool-install-action pool action-name key-val modifiers callback data notify))

(declaim (inline binding-pool-install-closure))
(defun binding-pool-install-closure (pool action-name key-val modifiers closure)
  (%binding-pool-install-closure pool action-name key-val modifiers closure))

(declaim (inline binding-pool-override-action))
(defun binding-pool-override-action (pool key-val modifiers callback data notify)
  (%binding-pool-override-action pool key-val modifiers callback data notify))

(declaim (inline binding-pool-override-closure))
(defun binding-pool-override-closure (pool key-val modifiers closure)
  (%binding-pool-override-closure pool key-val modifiers closure))

(declaim (inline binding-pool-find-action))
(defun binding-pool-find-action (pool key-val modifiers)
  (%binding-pool-find-action pool key-val modifiers))

(declaim (inline binding-pool-remove-action))
(defun binding-pool-remove-action (pool key-val modifiers)
  (%binding-pool-remove-action pool key-val modifiers))

(declaim (inline binding-pool-block-action))
(defun binding-pool-block-action (pool action-name)
  (%binding-pool-block-action pool action-name))

(declaim (inline binding-pool-unblock-action))
(defun binding-pool-unblock-action (pool action-name)
  (%binding-pool-unblock-action pool action-name))

(declaim (inline binding-pool-activate))
(defun binding-pool-activate (pool key-val modifiers gobject)
  (%binding-pool-activate pool key-val modifiers gobject))

(declaim (inline event-new))
(defun event-new (type)
  (%event-new type))

(declaim (inline event-copy))
(defun event-copy (event)
  (%event-copy event))

(declaim (inline event-free))
(defun event-free (event)
  (%event-free event))

(declaim (inline event-type))
(defun event-type (event)
  (%event-type event))

(declaim (inline event-get-state))
(defun event-get-state (event)
  (%event-get-state event))

(declaim (inline event-get-time))
(defun event-get-time (event)
  (%event-get-time event))

(declaim (inline event-get-source))
(defun event-get-source (event)
  (%event-get-source event))

(declaim (inline event-get-stage))
(defun event-get-stage (event)
  (%event-get-stage event))

(declaim (inline event-get-flags))
(defun event-get-flags (event)
  (%event-get-flags event))

(declaim (inline event-get))
(defun event-get ()
  (%event-get))

(declaim (inline event-peek))
(defun event-peek ()
  (%event-peek))

(declaim (inline event-put))
(defun event-put (event)
  (%event-put event))

(declaim (inline events-pending))
(defun events-pending ()
  (%events-pending))

(declaim (inline event-get-button))
(defun event-get-button (event)
  (%event-get-button event))

(declaim (inline event-get-click-count))
(defun event-get-click-count (event)
  (%event-get-click-count event))

(declaim (inline event-get-key-symbol))
(defun event-get-key-symbol (event)
  (%event-get-key-symbol event))

(declaim (inline event-get-key-code))
(defun event-get-key-code (event)
  (%event-get-key-code event))

(declaim (inline event-get-key-unicode))
(defun event-get-key-unicode (event)
  (%event-get-key-unicode event))

(declaim (inline keysym-to-unicode))
(defun keysym-to-unicode (keyval)
  (%keysym-to-unicode keyval))

(declaim (inline event-get-related))
(defun event-get-related (event)
  (%event-get-related event))

(declaim (inline event-get-scroll-direction))
(defun event-get-scroll-direction (event)
  (%event-get-scroll-direction event))

(declaim (inline event-get-device))
(defun event-get-device (event)
  (%event-get-device event))

(declaim (inline event-get-device-id))
(defun event-get-device-id (event)
  (%event-get-device-id event))

(declaim (inline event-get-device-type))
(defun event-get-device-type (event)
  (%event-get-device-type event))

(declaim (inline get-input-device-for-id))
(defun get-input-device-for-id (id)
  (%get-input-device-for-id id))

(declaim (inline input-device-get-device-id))
(defun input-device-get-device-id (device)
  (%input-device-get-device-id device))

(declaim (inline input-device-get-device-type))
(defun input-device-get-device-type (device)
  (%input-device-get-device-type device))

(declaim (inline get-current-event-time))
(defun get-current-event-time ()
  (%get-current-event-time))

(declaim (inline init-with-args))
(defun init-with-args (argc argv parameter-string entries translation-domain error)
  (%init-with-args argc argv parameter-string entries translation-domain error))

(declaim (inline get-option-group))
(defun get-option-group ()
  (%get-option-group))

(declaim (inline get-option-group-without-init))
(defun get-option-group-without-init ()
  (%get-option-group-without-init))

(declaim (inline main))
(defun main ()
  (%main))

(declaim (inline main-quit))
(defun main-quit ()
  (%main-quit))

(declaim (inline main-level))
(defun main-level ()
  (%main-level))

(declaim (inline get-debug-enabled))
(defun get-debug-enabled ()
  (%get-debug-enabled))

(declaim (inline get-show-fps))
(defun get-show-fps ()
  (%get-show-fps))

(declaim (inline get-timestamp))
(defun get-timestamp ()
  (%get-timestamp))

(declaim (inline get-actor-by-gid))
(defun get-actor-by-gid (id)
  (%get-actor-by-gid id))

(declaim (inline set-default-frame-rate))
(defun set-default-frame-rate (frames-per-sec)
  (%set-default-frame-rate frames-per-sec))

(declaim (inline get-default-frame-rate))
(defun get-default-frame-rate ()
  (%get-default-frame-rate))

(declaim (inline set-motion-events-enabled))
(defun set-motion-events-enabled (enable)
  (%set-motion-events-enabled enable))

(declaim (inline get-motion-events-enabled))
(defun get-motion-events-enabled ()
  (%get-motion-events-enabled))

(declaim (inline clear-glyph-cache))
(defun clear-glyph-cache ()
  (%clear-glyph-cache))

(declaim (inline set-font-flags))
(defun set-font-flags (flags)
  (%set-font-flags flags))

(declaim (inline get-font-flags))
(defun get-font-flags ()
  (%get-font-flags))

(declaim (inline get-font-map))
(defun get-font-map ()
  (%get-font-map))

(declaim (inline threads-set-lock-functions))
(defun threads-set-lock-functions (enter-fn leave-fn)
  (%threads-set-lock-functions enter-fn leave-fn))

(declaim (inline threads-init))
(defun threads-init ()
  (%threads-init))

(declaim (inline threads-enter))
(defun threads-enter ()
  (%threads-enter))

(declaim (inline threads-leave))
(defun threads-leave ()
  (%threads-leave))

(declaim (inline threads-add-idle))
(defun threads-add-idle (func data)
  (%threads-add-idle func data))

(declaim (inline threads-add-idle-full))
(defun threads-add-idle-full (priority func data notify)
  (%threads-add-idle-full priority func data notify))

(declaim (inline threads-add-timeout))
(defun threads-add-timeout (interval func data)
  (%threads-add-timeout interval func data))

(declaim (inline threads-add-timeout-full))
(defun threads-add-timeout-full (priority interval func data notify)
  (%threads-add-timeout-full priority interval func data notify))

(declaim (inline threads-add-frame-source))
(defun threads-add-frame-source (fps func data)
  (%threads-add-frame-source fps func data))

(declaim (inline threads-add-frame-source-full))
(defun threads-add-frame-source-full (priority fps func data notify)
  (%threads-add-frame-source-full priority fps func data notify))

(declaim (inline threads-add-repaint-func))
(defun threads-add-repaint-func (func data notify)
  (%threads-add-repaint-func func data notify))

(declaim (inline threads-remove-repaint-func))
(defun threads-remove-repaint-func (handle-id)
  (%threads-remove-repaint-func handle-id))

(declaim (inline get-keyboard-grab))
(defun get-keyboard-grab ()
  (%get-keyboard-grab))

(declaim (inline get-pointer-grab))
(defun get-pointer-grab ()
  (%get-pointer-grab))

(declaim (inline grab-keyboard))
(defun grab-keyboard (actor)
  (%grab-keyboard actor))

(declaim (inline grab-pointer))
(defun grab-pointer (actor)
  (%grab-pointer actor))

(declaim (inline ungrab-keyboard))
(defun ungrab-keyboard ()
  (%ungrab-keyboard))

(declaim (inline ungrab-pointer))
(defun ungrab-pointer ()
  (%ungrab-pointer))

(declaim (inline grab-pointer-for-device))
(defun grab-pointer-for-device (actor id)
  (%grab-pointer-for-device actor id))

(declaim (inline ungrab-pointer-for-device))
(defun ungrab-pointer-for-device (id)
  (%ungrab-pointer-for-device id))

(declaim (inline do-event))
(defun do-event (event)
  (%do-event event))

(declaim (inline shader-new))
(defun shader-new ()
  (%shader-new))

(declaim (inline shader-set-vertex-source))
(defun shader-set-vertex-source (shader data length)
  (%shader-set-vertex-source shader data length))

(declaim (inline shader-get-vertex-source))
(defun shader-get-vertex-source (shader)
  (%shader-get-vertex-source shader))

(declaim (inline shader-set-fragment-source))
(defun shader-set-fragment-source (shader data length)
  (%shader-set-fragment-source shader data length))

(declaim (inline shader-get-fragment-source))
(defun shader-get-fragment-source (shader)
  (%shader-get-fragment-source shader))

(declaim (inline shader-compile))
(defun shader-compile (shader error)
  (%shader-compile shader error))

(declaim (inline shader-release))
(defun shader-release (shader)
  (%shader-release shader))

(declaim (inline shader-is-compiled))
(defun shader-is-compiled (shader)
  (%shader-is-compiled shader))

(declaim (inline shader-set-is-enabled))
(defun shader-set-is-enabled (shader enabled)
  (%shader-set-is-enabled shader enabled))

(declaim (inline shader-get-is-enabled))
(defun shader-get-is-enabled (shader)
  (%shader-get-is-enabled shader))

(declaim (inline shader-set-uniform))
(defun shader-set-uniform (shader name value)
  (%shader-set-uniform shader name value))

(declaim (inline shader-get-cogl-program))
(defun shader-get-cogl-program (shader)
  (%shader-get-cogl-program shader))

(declaim (inline shader-get-cogl-fragment-shader))
(defun shader-get-cogl-fragment-shader (shader)
  (%shader-get-cogl-fragment-shader shader))

(declaim (inline shader-get-cogl-vertex-shader))
(defun shader-get-cogl-vertex-shader (shader)
  (%shader-get-cogl-vertex-shader shader))

(declaim (inline value-set-shader-float))
(defun value-set-shader-float (value size floats)
  (%value-set-shader-float value size floats))

(declaim (inline value-get-shader-float))
(defun value-get-shader-float (value length)
  (%value-get-shader-float value length))

(declaim (inline value-set-shader-int))
(defun value-set-shader-int (value size ints)
  (%value-set-shader-int value size ints))

(declaim (inline value-get-shader-int))
(defun value-get-shader-int (value length)
  (%value-get-shader-int value length))

(declaim (inline value-set-shader-matrix))
(defun value-set-shader-matrix (value size matrix)
  (%value-set-shader-matrix value size matrix))

(declaim (inline value-get-shader-matrix))
(defun value-get-shader-matrix (value length)
  (%value-get-shader-matrix value length))

(declaim (inline units-mm))
(defun units-mm (units mm)
  (%units-mm units mm))

(declaim (inline units-pt))
(defun units-pt (units pt)
  (%units-pt units pt))

(declaim (inline units-em))
(defun units-em (units em)
  (%units-em units em))

(declaim (inline units-em-for-font))
(defun units-em-for-font (units font-name em)
  (%units-em-for-font units font-name em))

(declaim (inline units-pixels))
(defun units-pixels (units px)
  (%units-pixels units px))

(declaim (inline units-to-pixels))
(defun units-to-pixels (units)
  (%units-to-pixels units))

(declaim (inline units-copy))
(defun units-copy (units)
  (%units-copy units))

(declaim (inline units-free))
(defun units-free (units)
  (%units-free units))

(declaim (inline units-get-unit-type))
(defun units-get-unit-type (units)
  (%units-get-unit-type units))

(declaim (inline units-get-unit-value))
(defun units-get-unit-value (units)
  (%units-get-unit-value units))

(declaim (inline units-from-string))
(defun units-from-string (units str)
  (%units-from-string units str))

(declaim (inline units-to-string))
(defun units-to-string (units)
  (%units-to-string units))

(declaim (inline param-spec-units))
(defun param-spec-units (name nick blurb default-type minimum maximum default-value flags)
  (%param-spec-units name nick blurb default-type minimum maximum default-value flags))

(declaim (inline value-set-units))
(defun value-set-units (value units)
  (%value-set-units value units))

(declaim (inline value-get-units))
(defun value-get-units (value)
  (%value-get-units value))

(declaim (inline util-next-p2))
(defun util-next-p2 (a)
  (%util-next-p2 a))

(declaim (inline timeout-pool-new))
(defun timeout-pool-new (priority)
  (%timeout-pool-new priority))

(declaim (inline timeout-pool-add))
(defun timeout-pool-add (pool fps func data notify)
  (%timeout-pool-add pool fps func data notify))

(declaim (inline timeout-pool-remove))
(defun timeout-pool-remove (pool id)
  (%timeout-pool-remove pool id))

(declaim (inline frame-source-add))
(defun frame-source-add (fps func data)
  (%frame-source-add fps func data))

(declaim (inline frame-source-add-full))
(defun frame-source-add-full (priority fps func data notify)
  (%frame-source-add-full priority fps func data notify))

(declaim (inline param-spec-fixed))
(defun param-spec-fixed (name nick blurb minimum maximum default-value flags)
  (%param-spec-fixed name nick blurb minimum maximum default-value flags))

(declaim (inline value-set-fixed))
(defun value-set-fixed (value fixed-)
  (%value-set-fixed value fixed-))

(declaim (inline value-get-fixed))
(defun value-get-fixed (value)
  (%value-get-fixed value))

(declaim (inline script-new))
(defun script-new ()
  (%script-new))

(declaim (inline script-load-from-data))
(defun script-load-from-data (script data length error)
  (%script-load-from-data script data length error))

(declaim (inline script-load-from-file))
(defun script-load-from-file (script filename error)
  (%script-load-from-file script filename error))

(declaim (inline script-add-search-paths))
(defun script-add-search-paths (script paths n-paths)
  (%script-add-search-paths script paths n-paths))

(declaim (inline script-lookup-filename))
(defun script-lookup-filename (script filename)
  (%script-lookup-filename script filename))

(declaim (inline script-get-object))
(defun script-get-object (script name)
  (%script-get-object script name))

(declaim (inline script-unmerge-objects))
(defun script-unmerge-objects (script merge-id)
  (%script-unmerge-objects script merge-id))

(declaim (inline script-ensure-objects))
(defun script-ensure-objects (script)
  (%script-ensure-objects script))

(declaim (inline script-list-objects))
(defun script-list-objects (script)
  (%script-list-objects script))

(declaim (inline script-connect-signals))
(defun script-connect-signals (script user-data)
  (%script-connect-signals script user-data))

(declaim (inline script-connect-signals-full))
(defun script-connect-signals-full (script func user-data)
  (%script-connect-signals-full script func user-data))

(declaim (inline script-get-type-from-name))
(defun script-get-type-from-name (script type-name)
  (%script-get-type-from-name script type-name))

(declaim (inline get-script-id))
(defun get-script-id (gobject)
  (%get-script-id gobject))

(declaim (inline scriptable-set-id))
(defun scriptable-set-id (scriptable id)
  (%scriptable-set-id scriptable id))

(declaim (inline scriptable-get-id))
(defun scriptable-get-id (scriptable)
  (%scriptable-get-id scriptable))

(declaim (inline scriptable-parse-custom-node))
(defun scriptable-parse-custom-node (scriptable script value name node)
  (%scriptable-parse-custom-node scriptable script value name node))

(declaim (inline scriptable-set-custom-property))
(defun scriptable-set-custom-property (scriptable script name value)
  (%scriptable-set-custom-property scriptable script name value))

(declaim (inline model-set-names))
(defun model-set-names (model n-columns names)
  (%model-set-names model n-columns names))

(declaim (inline model-set-types))
(defun model-set-types (model n-columns types)
  (%model-set-types model n-columns types))

(declaim (inline model-get-column-name))
(defun model-get-column-name (model column)
  (%model-get-column-name model column))

(declaim (inline model-get-column-type))
(defun model-get-column-type (model column)
  (%model-get-column-type model column))

(declaim (inline model-get-n-columns))
(defun model-get-n-columns (model)
  (%model-get-n-columns model))

(declaim (inline model-get-n-rows))
(defun model-get-n-rows (model)
  (%model-get-n-rows model))

(declaim (inline model-appendv))
(defun model-appendv (model n-columns columns values)
  (%model-appendv model n-columns columns values))

(declaim (inline model-prependv))
(defun model-prependv (model n-columns columns values)
  (%model-prependv model n-columns columns values))

(declaim (inline model-insertv))
(defun model-insertv (model row n-columns columns values)
  (%model-insertv model row n-columns columns values))

(declaim (inline model-insert-value))
(defun model-insert-value (model row column value)
  (%model-insert-value model row column value))

(declaim (inline model-remove))
(defun model-remove (model row)
  (%model-remove model row))

(declaim (inline model-foreach))
(defun model-foreach (model func user-data)
  (%model-foreach model func user-data))

(declaim (inline model-set-sorting-column))
(defun model-set-sorting-column (model column)
  (%model-set-sorting-column model column))

(declaim (inline model-get-sorting-column))
(defun model-get-sorting-column (model)
  (%model-get-sorting-column model))

(declaim (inline model-set-sort))
(defun model-set-sort (model column func user-data notify)
  (%model-set-sort model column func user-data notify))

(declaim (inline model-resort))
(defun model-resort (model)
  (%model-resort model))

(declaim (inline model-set-filter))
(defun model-set-filter (model func user-data notify)
  (%model-set-filter model func user-data notify))

(declaim (inline model-get-filter-set))
(defun model-get-filter-set (model)
  (%model-get-filter-set model))

(declaim (inline model-filter-iter))
(defun model-filter-iter (model iter)
  (%model-filter-iter model iter))

(declaim (inline model-filter-row))
(defun model-filter-row (model row)
  (%model-filter-row model row))

(declaim (inline model-get-first-iter))
(defun model-get-first-iter (model)
  (%model-get-first-iter model))

(declaim (inline model-get-last-iter))
(defun model-get-last-iter (model)
  (%model-get-last-iter model))

(declaim (inline model-get-iter-at-row))
(defun model-get-iter-at-row (model row)
  (%model-get-iter-at-row model row))

(declaim (inline model-iter-copy))
(defun model-iter-copy (iter)
  (%model-iter-copy iter))

(declaim (inline model-iter-get-valist))
(defun model-iter-get-valist (iter args)
  (%model-iter-get-valist iter args))

(declaim (inline model-iter-get-value))
(defun model-iter-get-value (iter column value)
  (%model-iter-get-value iter column value))

(declaim (inline model-iter-set-valist))
(defun model-iter-set-valist (iter args)
  (%model-iter-set-valist iter args))

(declaim (inline model-iter-set-value))
(defun model-iter-set-value (iter column value)
  (%model-iter-set-value iter column value))

(declaim (inline model-iter-is-first))
(defun model-iter-is-first (iter)
  (%model-iter-is-first iter))

(declaim (inline model-iter-is-last))
(defun model-iter-is-last (iter)
  (%model-iter-is-last iter))

(declaim (inline model-iter-next))
(defun model-iter-next (iter)
  (%model-iter-next iter))

(declaim (inline model-iter-prev))
(defun model-iter-prev (iter)
  (%model-iter-prev iter))

(declaim (inline model-iter-get-model))
(defun model-iter-get-model (iter)
  (%model-iter-get-model iter))

(declaim (inline model-iter-get-row))
(defun model-iter-get-row (iter)
  (%model-iter-get-row iter))

(declaim (inline list-model-newv))
(defun list-model-newv (n-columns types names)
  (%list-model-newv n-columns types names))

(declaim (inline get-default-backend))
(defun get-default-backend ()
  (%get-default-backend))

(declaim (inline backend-set-resolution))
(defun backend-set-resolution (backend dpi)
  (%backend-set-resolution backend dpi))

(declaim (inline backend-get-resolution))
(defun backend-get-resolution (backend)
  (%backend-get-resolution backend))

(declaim (inline backend-set-double-click-time))
(defun backend-set-double-click-time (backend msec)
  (%backend-set-double-click-time backend msec))

(declaim (inline backend-get-double-click-time))
(defun backend-get-double-click-time (backend)
  (%backend-get-double-click-time backend))

(declaim (inline backend-set-double-click-distance))
(defun backend-set-double-click-distance (backend distance)
  (%backend-set-double-click-distance backend distance))

(declaim (inline backend-get-double-click-distance))
(defun backend-get-double-click-distance (backend)
  (%backend-get-double-click-distance backend))

(declaim (inline backend-set-font-options))
(defun backend-set-font-options (backend options)
  (%backend-set-font-options backend options))

(declaim (inline backend-get-font-options))
(defun backend-get-font-options (backend)
  (%backend-get-font-options backend))

(declaim (inline backend-set-font-name))
(defun backend-set-font-name (backend font-name)
  (%backend-set-font-name backend font-name))

(declaim (inline backend-get-font-name))
(defun backend-get-font-name (backend)
  (%backend-get-font-name backend))

(declaim (inline cogl-handle-ref))
(defun cogl-handle-ref (handle)
  (%cogl-handle-ref handle))

(declaim (inline cogl-handle-unref))
(defun cogl-handle-unref (handle)
  (%cogl-handle-unref handle))

(declaim (inline cogl-get-features))
(defun cogl-get-features ()
  (%cogl-get-features))

(declaim (inline cogl-features-available))
(defun cogl-features-available (features)
  (%cogl-features-available features))

(declaim (inline cogl-check-extension))
(defun cogl-check-extension (name ext)
  (%cogl-check-extension name ext))

(declaim (inline cogl-get-proc-address))
(defun cogl-get-proc-address (name)
  (%cogl-get-proc-address name))

(declaim (inline cogl-get-option-group))
(defun cogl-get-option-group ()
  (%cogl-get-option-group))

(declaim (inline cogl-gl-error-to-string))
(defun cogl-gl-error-to-string (error-code)
  (%cogl-gl-error-to-string error-code))

(declaim (inline cogl-push-matrix))
(defun cogl-push-matrix ()
  (%cogl-push-matrix))

(declaim (inline cogl-pop-matrix))
(defun cogl-pop-matrix ()
  (%cogl-pop-matrix))

(declaim (inline cogl-scale))
(defun cogl-scale (x y z)
  (%cogl-scale x y z))

(declaim (inline cogl-translate))
(defun cogl-translate (x y z)
  (%cogl-translate x y z))

(declaim (inline cogl-rotate))
(defun cogl-rotate (angle x y z)
  (%cogl-rotate angle x y z))

(declaim (inline cogl-frustum))
(defun cogl-frustum (left right bottom top z-near z-far)
  (%cogl-frustum left right bottom top z-near z-far))

(declaim (inline cogl-perspective))
(defun cogl-perspective (fovy aspect z-near z-far)
  (%cogl-perspective fovy aspect z-near z-far))

(declaim (inline cogl-ortho))
(defun cogl-ortho (left right bottom top near far)
  (%cogl-ortho left right bottom top near far))

(declaim (inline cogl-get-modelview-matrix))
(defun cogl-get-modelview-matrix (matrix)
  (%cogl-get-modelview-matrix matrix))

(declaim (inline cogl-set-modelview-matrix))
(defun cogl-set-modelview-matrix (matrix)
  (%cogl-set-modelview-matrix matrix))

(declaim (inline cogl-get-projection-matrix))
(defun cogl-get-projection-matrix (matrix)
  (%cogl-get-projection-matrix matrix))

(declaim (inline cogl-set-projection-matrix))
(defun cogl-set-projection-matrix (matrix)
  (%cogl-set-projection-matrix matrix))

(declaim (inline cogl-viewport))
(defun cogl-viewport (width height)
  (%cogl-viewport width height))

(declaim (inline cogl-get-viewport))
(defun cogl-get-viewport (v[4])
  (%cogl-get-viewport v[4]))

(declaim (inline cogl-clear))
(defun cogl-clear (color buffers)
  (%cogl-clear color buffers))

(declaim (inline cogl-get-bitmasks))
(defun cogl-get-bitmasks (red green blue alpha)
  (%cogl-get-bitmasks red green blue alpha))

(declaim (inline cogl-set-depth-test-enabled))
(defun cogl-set-depth-test-enabled (setting)
  (%cogl-set-depth-test-enabled setting))

(declaim (inline cogl-get-depth-test-enabled))
(defun cogl-get-depth-test-enabled ()
  (%cogl-get-depth-test-enabled))

(declaim (inline cogl-set-backface-culling-enabled))
(defun cogl-set-backface-culling-enabled (setting)
  (%cogl-set-backface-culling-enabled setting))

(declaim (inline cogl-get-backface-culling-enabled))
(defun cogl-get-backface-culling-enabled ()
  (%cogl-get-backface-culling-enabled))

(declaim (inline cogl-set-fog))
(defun cogl-set-fog (fog-color mode density z-near z-far)
  (%cogl-set-fog fog-color mode density z-near z-far))

(declaim (inline cogl-disable-fog))
(defun cogl-disable-fog ()
  (%cogl-disable-fog))

(declaim (inline cogl-set-source))
(defun cogl-set-source (material)
  (%cogl-set-source material))

(declaim (inline cogl-set-source-color))
(defun cogl-set-source-color (color)
  (%cogl-set-source-color color))

(declaim (inline cogl-set-source-color4ub))
(defun cogl-set-source-color4ub (red green blue alpha)
  (%cogl-set-source-color4ub red green blue alpha))

(declaim (inline cogl-set-source-color4f))
(defun cogl-set-source-color4f (red green blue alpha)
  (%cogl-set-source-color4f red green blue alpha))

(declaim (inline cogl-set-source-texture))
(defun cogl-set-source-texture (texture-handle)
  (%cogl-set-source-texture texture-handle))

(declaim (inline cogl-read-pixels))
(defun cogl-read-pixels (x y width height source format pixels)
  (%cogl-read-pixels x y width height source format pixels))

(declaim (inline cogl-flush))
(defun cogl-flush ()
  (%cogl-flush))

(declaim (inline cogl-begin-gl))
(defun cogl-begin-gl ()
  (%cogl-begin-gl))

(declaim (inline cogl-end-gl))
(defun cogl-end-gl ()
  (%cogl-end-gl))

(declaim (inline cogl-color-new))
(defun cogl-color-new ()
  (%cogl-color-new))

(declaim (inline cogl-color-copy))
(defun cogl-color-copy (color)
  (%cogl-color-copy color))

(declaim (inline cogl-color-free))
(defun cogl-color-free (color)
  (%cogl-color-free color))

(declaim (inline cogl-color-set-from-4ub))
(defun cogl-color-set-from-4ub (dest red green blue alpha)
  (%cogl-color-set-from-4ub dest red green blue alpha))

(declaim (inline cogl-color-set-from-4f))
(defun cogl-color-set-from-4f (dest red green blue alpha)
  (%cogl-color-set-from-4f dest red green blue alpha))

(declaim (inline cogl-color-get-red))
(defun cogl-color-get-red (color)
  (%cogl-color-get-red color))

(declaim (inline cogl-color-get-green))
(defun cogl-color-get-green (color)
  (%cogl-color-get-green color))

(declaim (inline cogl-color-get-blue))
(defun cogl-color-get-blue (color)
  (%cogl-color-get-blue color))

(declaim (inline cogl-color-get-alpha))
(defun cogl-color-get-alpha (color)
  (%cogl-color-get-alpha color))

(declaim (inline cogl-color-get-red-byte))
(defun cogl-color-get-red-byte (color)
  (%cogl-color-get-red-byte color))

(declaim (inline cogl-color-get-green-byte))
(defun cogl-color-get-green-byte (color)
  (%cogl-color-get-green-byte color))

(declaim (inline cogl-color-get-blue-byte))
(defun cogl-color-get-blue-byte (color)
  (%cogl-color-get-blue-byte color))

(declaim (inline cogl-color-get-alpha-byte))
(defun cogl-color-get-alpha-byte (color)
  (%cogl-color-get-alpha-byte color))

(declaim (inline cogl-color-get-red-float))
(defun cogl-color-get-red-float (color)
  (%cogl-color-get-red-float color))

(declaim (inline cogl-color-get-green-float))
(defun cogl-color-get-green-float (color)
  (%cogl-color-get-green-float color))

(declaim (inline cogl-color-get-blue-float))
(defun cogl-color-get-blue-float (color)
  (%cogl-color-get-blue-float color))

(declaim (inline cogl-color-get-alpha-float))
(defun cogl-color-get-alpha-float (color)
  (%cogl-color-get-alpha-float color))

(declaim (inline cogl-texture-new-with-size))
(defun cogl-texture-new-with-size (width height flags internal-format)
  (%cogl-texture-new-with-size width height flags internal-format))

(declaim (inline cogl-texture-new-from-file))
(defun cogl-texture-new-from-file (filename flags internal-format error)
  (%cogl-texture-new-from-file filename flags internal-format error))

(declaim (inline cogl-texture-new-from-data))
(defun cogl-texture-new-from-data (width height flags format internal-format rowstride data)
  (%cogl-texture-new-from-data width height flags format internal-format rowstride data))

(declaim (inline cogl-texture-new-from-foreign))
(defun cogl-texture-new-from-foreign (gl-handle gl-target width height x-pot-waste y-pot-waste format)
  (%cogl-texture-new-from-foreign gl-handle gl-target width height x-pot-waste y-pot-waste format))

(declaim (inline cogl-texture-new-from-bitmap))
(defun cogl-texture-new-from-bitmap (bmp-handle flags internal-format)
  (%cogl-texture-new-from-bitmap bmp-handle flags internal-format))

(declaim (inline cogl-is-texture))
(defun cogl-is-texture (handle)
  (%cogl-is-texture handle))

(declaim (inline cogl-texture-ref))
(defun cogl-texture-ref (handle)
  (%cogl-texture-ref handle))

(declaim (inline cogl-texture-unref))
(defun cogl-texture-unref (handle)
  (%cogl-texture-unref handle))

(declaim (inline cogl-texture-get-width))
(defun cogl-texture-get-width (handle)
  (%cogl-texture-get-width handle))

(declaim (inline cogl-texture-get-height))
(defun cogl-texture-get-height (handle)
  (%cogl-texture-get-height handle))

(declaim (inline cogl-texture-get-format))
(defun cogl-texture-get-format (handle)
  (%cogl-texture-get-format handle))

(declaim (inline cogl-texture-get-rowstride))
(defun cogl-texture-get-rowstride (handle)
  (%cogl-texture-get-rowstride handle))

(declaim (inline cogl-texture-get-max-waste))
(defun cogl-texture-get-max-waste (handle)
  (%cogl-texture-get-max-waste handle))

(declaim (inline cogl-texture-is-sliced))
(defun cogl-texture-is-sliced (handle)
  (%cogl-texture-is-sliced handle))

(declaim (inline cogl-texture-get-gl-texture))
(defun cogl-texture-get-gl-texture (handle out-gl-handle out-gl-target)
  (%cogl-texture-get-gl-texture handle out-gl-handle out-gl-target))

(declaim (inline cogl-texture-get-data))
(defun cogl-texture-get-data (handle format rowstride data)
  (%cogl-texture-get-data handle format rowstride data))

(declaim (inline cogl-texture-set-region))
(defun cogl-texture-set-region (handle src-x src-y dst-x dst-y dst-width dst-height width height format rowstride data)
  (%cogl-texture-set-region handle src-x src-y dst-x dst-y dst-width dst-height width height format rowstride data))

(declaim (inline cogl-material-new))
(defun cogl-material-new ()
  (%cogl-material-new))

(declaim (inline cogl-material-ref))
(defun cogl-material-ref (handle)
  (%cogl-material-ref handle))

(declaim (inline cogl-material-unref))
(defun cogl-material-unref (handle)
  (%cogl-material-unref handle))

(declaim (inline cogl-is-material))
(defun cogl-is-material (handle)
  (%cogl-is-material handle))

(declaim (inline cogl-material-set-color))
(defun cogl-material-set-color (material color)
  (%cogl-material-set-color material color))

(declaim (inline cogl-material-set-color4ub))
(defun cogl-material-set-color4ub (material red green blue alpha)
  (%cogl-material-set-color4ub material red green blue alpha))

(declaim (inline cogl-material-set-color4f))
(defun cogl-material-set-color4f (material red green blue alpha)
  (%cogl-material-set-color4f material red green blue alpha))

(declaim (inline cogl-material-get-color))
(defun cogl-material-get-color (material color)
  (%cogl-material-get-color material color))

(declaim (inline cogl-material-set-ambient))
(defun cogl-material-set-ambient (material ambient)
  (%cogl-material-set-ambient material ambient))

(declaim (inline cogl-material-get-ambient))
(defun cogl-material-get-ambient (material ambient)
  (%cogl-material-get-ambient material ambient))

(declaim (inline cogl-material-set-diffuse))
(defun cogl-material-set-diffuse (material diffuse)
  (%cogl-material-set-diffuse material diffuse))

(declaim (inline cogl-material-get-diffuse))
(defun cogl-material-get-diffuse (material diffuse)
  (%cogl-material-get-diffuse material diffuse))

(declaim (inline cogl-material-set-ambient-and-diffuse))
(defun cogl-material-set-ambient-and-diffuse (material color)
  (%cogl-material-set-ambient-and-diffuse material color))

(declaim (inline cogl-material-set-emission))
(defun cogl-material-set-emission (material emission)
  (%cogl-material-set-emission material emission))

(declaim (inline cogl-material-get-emission))
(defun cogl-material-get-emission (material emission)
  (%cogl-material-get-emission material emission))

(declaim (inline cogl-material-set-specular))
(defun cogl-material-set-specular (material specular)
  (%cogl-material-set-specular material specular))

(declaim (inline cogl-material-get-specular))
(defun cogl-material-get-specular (material specular)
  (%cogl-material-get-specular material specular))

(declaim (inline cogl-material-set-shininess))
(defun cogl-material-set-shininess (material shininess)
  (%cogl-material-set-shininess material shininess))

(declaim (inline cogl-material-get-shininess))
(defun cogl-material-get-shininess (material)
  (%cogl-material-get-shininess material))

(declaim (inline cogl-material-set-alpha-test-function))
(defun cogl-material-set-alpha-test-function (material alpha-func alpha-reference)
  (%cogl-material-set-alpha-test-function material alpha-func alpha-reference))

(declaim (inline cogl-material-set-blend))
(defun cogl-material-set-blend (material blend-string error)
  (%cogl-material-set-blend material blend-string error))

(declaim (inline cogl-material-set-blend-constant))
(defun cogl-material-set-blend-constant (material constant-color)
  (%cogl-material-set-blend-constant material constant-color))

(declaim (inline cogl-material-set-layer))
(defun cogl-material-set-layer (material layer-index texture)
  (%cogl-material-set-layer material layer-index texture))

(declaim (inline cogl-material-remove-layer))
(defun cogl-material-remove-layer (material layer-index)
  (%cogl-material-remove-layer material layer-index))

(declaim (inline cogl-material-set-layer-combine))
(defun cogl-material-set-layer-combine (material layer-index blend-string error)
  (%cogl-material-set-layer-combine material layer-index blend-string error))

(declaim (inline cogl-material-set-layer-combine-constant))
(defun cogl-material-set-layer-combine-constant (material layer-index constant)
  (%cogl-material-set-layer-combine-constant material layer-index constant))

(declaim (inline cogl-material-set-layer-matrix))
(defun cogl-material-set-layer-matrix (material layer-index matrix)
  (%cogl-material-set-layer-matrix material layer-index matrix))

(declaim (inline cogl-material-get-layers))
(defun cogl-material-get-layers (material)
  (%cogl-material-get-layers material))

(declaim (inline cogl-material-set-layer-filters))
(defun cogl-material-set-layer-filters (handle layer-index min-filter mag-filter)
  (%cogl-material-set-layer-filters handle layer-index min-filter mag-filter))

(declaim (inline cogl-material-layer-get-type))
(defun cogl-material-layer-get-type (layer-handle)
  (%cogl-material-layer-get-type layer-handle))

(declaim (inline cogl-material-layer-get-texture))
(defun cogl-material-layer-get-texture (layer-handle)
  (%cogl-material-layer-get-texture layer-handle))

(declaim (inline cogl-material-layer-get-min-filter))
(defun cogl-material-layer-get-min-filter (layer-handle)
  (%cogl-material-layer-get-min-filter layer-handle))

(declaim (inline cogl-material-layer-get-mag-filter))
(defun cogl-material-layer-get-mag-filter (layer-handle)
  (%cogl-material-layer-get-mag-filter layer-handle))

(declaim (inline cogl-rectangle))
(defun cogl-rectangle (x-1 y-1 x-2 y-2)
  (%cogl-rectangle x-1 y-1 x-2 y-2))

(declaim (inline cogl-rectangles))
(defun cogl-rectangles (verts n-rects)
  (%cogl-rectangles verts n-rects))

(declaim (inline cogl-rectangle-with-texture-coords))
(defun cogl-rectangle-with-texture-coords (x1 y1 x2 y2 tx1 ty1 tx2 ty2)
  (%cogl-rectangle-with-texture-coords x1 y1 x2 y2 tx1 ty1 tx2 ty2))

(declaim (inline cogl-rectangles-with-texture-coords))
(defun cogl-rectangles-with-texture-coords (verts n-rects)
  (%cogl-rectangles-with-texture-coords verts n-rects))

(declaim (inline cogl-rectangle-with-multitexture-coords))
(defun cogl-rectangle-with-multitexture-coords (x1 y1 x2 y2 tex-coords tex-coords-len)
  (%cogl-rectangle-with-multitexture-coords x1 y1 x2 y2 tex-coords tex-coords-len))

(declaim (inline cogl-polygon))
(defun cogl-polygon (vertices n-vertices use-color)
  (%cogl-polygon vertices n-vertices use-color))

(declaim (inline cogl-path-new))
(defun cogl-path-new ()
  (%cogl-path-new))

(declaim (inline cogl-path-move-to))
(defun cogl-path-move-to (x y)
  (%cogl-path-move-to x y))

(declaim (inline cogl-path-close))
(defun cogl-path-close ()
  (%cogl-path-close))

(declaim (inline cogl-path-line-to))
(defun cogl-path-line-to (x y)
  (%cogl-path-line-to x y))

(declaim (inline cogl-path-curve-to))
(defun cogl-path-curve-to (x-1 y-1 x-2 y-2 x-3 y-3)
  (%cogl-path-curve-to x-1 y-1 x-2 y-2 x-3 y-3))

(declaim (inline cogl-path-arc))
(defun cogl-path-arc (center-x center-y radius-x radius-y angle-1 angle-2)
  (%cogl-path-arc center-x center-y radius-x radius-y angle-1 angle-2))

(declaim (inline cogl-path-rel-move-to))
(defun cogl-path-rel-move-to (x y)
  (%cogl-path-rel-move-to x y))

(declaim (inline cogl-path-rel-line-to))
(defun cogl-path-rel-line-to (x y)
  (%cogl-path-rel-line-to x y))

(declaim (inline cogl-path-rel-curve-to))
(defun cogl-path-rel-curve-to (x-1 y-1 x-2 y-2 x-3 y-3)
  (%cogl-path-rel-curve-to x-1 y-1 x-2 y-2 x-3 y-3))

(declaim (inline cogl-path-line))
(defun cogl-path-line (x-1 y-1 x-2 y-2)
  (%cogl-path-line x-1 y-1 x-2 y-2))

(declaim (inline cogl-path-polyline))
(defun cogl-path-polyline (coords num-points)
  (%cogl-path-polyline coords num-points))

(declaim (inline cogl-path-polygon))
(defun cogl-path-polygon (coords num-points)
  (%cogl-path-polygon coords num-points))

(declaim (inline cogl-path-rectangle))
(defun cogl-path-rectangle (x-1 y-1 x-2 y-2)
  (%cogl-path-rectangle x-1 y-1 x-2 y-2))

(declaim (inline cogl-path-round-rectangle))
(defun cogl-path-round-rectangle (x-1 y-1 x-2 y-2 radius arc-step)
  (%cogl-path-round-rectangle x-1 y-1 x-2 y-2 radius arc-step))

(declaim (inline cogl-path-ellipse))
(defun cogl-path-ellipse (center-x center-y radius-x radius-y)
  (%cogl-path-ellipse center-x center-y radius-x radius-y))

(declaim (inline cogl-path-fill))
(defun cogl-path-fill ()
  (%cogl-path-fill))

(declaim (inline cogl-path-fill-preserve))
(defun cogl-path-fill-preserve ()
  (%cogl-path-fill-preserve))

(declaim (inline cogl-path-stroke))
(defun cogl-path-stroke ()
  (%cogl-path-stroke))

(declaim (inline cogl-path-stroke-preserve))
(defun cogl-path-stroke-preserve ()
  (%cogl-path-stroke-preserve))

(declaim (inline cogl-vertex-buffer-new))
(defun cogl-vertex-buffer-new (n-vertices)
  (%cogl-vertex-buffer-new n-vertices))

(declaim (inline cogl-vertex-buffer-get-n-vertices))
(defun cogl-vertex-buffer-get-n-vertices (handle)
  (%cogl-vertex-buffer-get-n-vertices handle))

(declaim (inline cogl-vertex-buffer-ref))
(defun cogl-vertex-buffer-ref (handle)
  (%cogl-vertex-buffer-ref handle))

(declaim (inline cogl-vertex-buffer-unref))
(defun cogl-vertex-buffer-unref (handle)
  (%cogl-vertex-buffer-unref handle))

(declaim (inline cogl-vertex-buffer-add))
(defun cogl-vertex-buffer-add (handle attribute-name n-components type normalized stride pointer)
  (%cogl-vertex-buffer-add handle attribute-name n-components type normalized stride pointer))

(declaim (inline cogl-vertex-buffer-delete))
(defun cogl-vertex-buffer-delete (handle attribute-name)
  (%cogl-vertex-buffer-delete handle attribute-name))

(declaim (inline cogl-vertex-buffer-submit))
(defun cogl-vertex-buffer-submit (handle)
  (%cogl-vertex-buffer-submit handle))

(declaim (inline cogl-vertex-buffer-disable))
(defun cogl-vertex-buffer-disable (handle attribute-name)
  (%cogl-vertex-buffer-disable handle attribute-name))

(declaim (inline cogl-vertex-buffer-enable))
(defun cogl-vertex-buffer-enable (handle attribute-name)
  (%cogl-vertex-buffer-enable handle attribute-name))

(declaim (inline cogl-vertex-buffer-draw))
(defun cogl-vertex-buffer-draw (handle mode first count)
  (%cogl-vertex-buffer-draw handle mode first count))

(declaim (inline cogl-vertex-buffer-indices-new))
(defun cogl-vertex-buffer-indices-new (indices-type indices-array indices-len)
  (%cogl-vertex-buffer-indices-new indices-type indices-array indices-len))

(declaim (inline cogl-vertex-buffer-delete-indices))
(defun cogl-vertex-buffer-delete-indices (handle indices-id)
  (%cogl-vertex-buffer-delete-indices handle indices-id))

(declaim (inline cogl-vertex-buffer-draw-elements))
(defun cogl-vertex-buffer-draw-elements (handle mode indices min-index max-index indices-offset count)
  (%cogl-vertex-buffer-draw-elements handle mode indices min-index max-index indices-offset count))

(declaim (inline cogl-vertex-buffer-indices-get-for-quads))
(defun cogl-vertex-buffer-indices-get-for-quads (n-indices)
  (%cogl-vertex-buffer-indices-get-for-quads n-indices))

(declaim (inline cogl-matrix-init-identity))
(defun cogl-matrix-init-identity (matrix)
  (%cogl-matrix-init-identity matrix))

(declaim (inline cogl-matrix-frustum))
(defun cogl-matrix-frustum (matrix left right bottom top z-near z-far)
  (%cogl-matrix-frustum matrix left right bottom top z-near z-far))

(declaim (inline cogl-matrix-ortho))
(defun cogl-matrix-ortho (matrix left right bottom top z-near z-far)
  (%cogl-matrix-ortho matrix left right bottom top z-near z-far))

(declaim (inline cogl-matrix-perspective))
(defun cogl-matrix-perspective (matrix fov-y aspect z-near z-far)
  (%cogl-matrix-perspective matrix fov-y aspect z-near z-far))

(declaim (inline cogl-matrix-transform-point))
(defun cogl-matrix-transform-point (matrix x y z w)
  (%cogl-matrix-transform-point matrix x y z w))

(declaim (inline cogl-matrix-multiply))
(defun cogl-matrix-multiply (result a b)
  (%cogl-matrix-multiply result a b))

(declaim (inline cogl-matrix-rotate))
(defun cogl-matrix-rotate (matrix angle x y z)
  (%cogl-matrix-rotate matrix angle x y z))

(declaim (inline cogl-matrix-translate))
(defun cogl-matrix-translate (matrix x y z)
  (%cogl-matrix-translate matrix x y z))

(declaim (inline cogl-matrix-scale))
(defun cogl-matrix-scale (matrix sx sy sz)
  (%cogl-matrix-scale matrix sx sy sz))

(declaim (inline cogl-matrix-init-from-array))
(defun cogl-matrix-init-from-array (matrix array)
  (%cogl-matrix-init-from-array matrix array))

(declaim (inline cogl-matrix-get-array))
(defun cogl-matrix-get-array (matrix)
  (%cogl-matrix-get-array matrix))

(declaim (inline cogl-create-shader))
(defun cogl-create-shader (shader-type)
  (%cogl-create-shader shader-type))

(declaim (inline cogl-shader-ref))
(defun cogl-shader-ref (handle)
  (%cogl-shader-ref handle))

(declaim (inline cogl-shader-unref))
(defun cogl-shader-unref (handle)
  (%cogl-shader-unref handle))

(declaim (inline cogl-is-shader))
(defun cogl-is-shader (handle)
  (%cogl-is-shader handle))

(declaim (inline cogl-shader-source))
(defun cogl-shader-source (shader source)
  (%cogl-shader-source shader source))

(declaim (inline cogl-shader-compile))
(defun cogl-shader-compile (handle)
  (%cogl-shader-compile handle))

(declaim (inline cogl-shader-get-info-log))
(defun cogl-shader-get-info-log (handle)
  (%cogl-shader-get-info-log handle))

(declaim (inline cogl-shader-get-type))
(defun cogl-shader-get-type (handle)
  (%cogl-shader-get-type handle))

(declaim (inline cogl-shader-is-compiled))
(defun cogl-shader-is-compiled (handle)
  (%cogl-shader-is-compiled handle))

(declaim (inline cogl-create-program))
(defun cogl-create-program ()
  (%cogl-create-program))

(declaim (inline cogl-program-ref))
(defun cogl-program-ref (handle)
  (%cogl-program-ref handle))

(declaim (inline cogl-program-unref))
(defun cogl-program-unref (handle)
  (%cogl-program-unref handle))

(declaim (inline cogl-is-program))
(defun cogl-is-program (handle)
  (%cogl-is-program handle))

(declaim (inline cogl-program-attach-shader))
(defun cogl-program-attach-shader (program-handle shader-handle)
  (%cogl-program-attach-shader program-handle shader-handle))

(declaim (inline cogl-program-link))
(defun cogl-program-link (handle)
  (%cogl-program-link handle))

(declaim (inline cogl-program-use))
(defun cogl-program-use (handle)
  (%cogl-program-use handle))

(declaim (inline cogl-program-get-uniform-location))
(defun cogl-program-get-uniform-location (handle uniform-name)
  (%cogl-program-get-uniform-location handle uniform-name))

(declaim (inline cogl-program-uniform-1f))
(defun cogl-program-uniform-1f (uniform-no value)
  (%cogl-program-uniform-1f uniform-no value))

(declaim (inline cogl-program-uniform-1i))
(defun cogl-program-uniform-1i (uniform-no value)
  (%cogl-program-uniform-1i uniform-no value))

(declaim (inline cogl-program-uniform-float))
(defun cogl-program-uniform-float (uniform-no size count value)
  (%cogl-program-uniform-float uniform-no size count value))

(declaim (inline cogl-program-uniform-int))
(defun cogl-program-uniform-int (uniform-no size count value)
  (%cogl-program-uniform-int uniform-no size count value))

(declaim (inline cogl-program-uniform-matrix))
(defun cogl-program-uniform-matrix (uniform-no size count transpose value)
  (%cogl-program-uniform-matrix uniform-no size count transpose value))

(declaim (inline cogl-offscreen-new-to-texture))
(defun cogl-offscreen-new-to-texture (handle)
  (%cogl-offscreen-new-to-texture handle))

(declaim (inline cogl-offscreen-ref))
(defun cogl-offscreen-ref (handle)
  (%cogl-offscreen-ref handle))

(declaim (inline cogl-offscreen-unref))
(defun cogl-offscreen-unref (handle)
  (%cogl-offscreen-unref handle))

(declaim (inline cogl-is-offscreen))
(defun cogl-is-offscreen (handle)
  (%cogl-is-offscreen handle))

(declaim (inline cogl-set-draw-buffer))
(defun cogl-set-draw-buffer (target offscreen)
  (%cogl-set-draw-buffer target offscreen))

(declaim (inline cogl-pop-draw-buffer))
(defun cogl-pop-draw-buffer ()
  (%cogl-pop-draw-buffer))

(declaim (inline cogl-push-draw-buffer))
(defun cogl-push-draw-buffer ()
  (%cogl-push-draw-buffer))

(declaim (inline cogl-sqrti))
(defun cogl-sqrti (x)
  (%cogl-sqrti x))

(declaim (inline cogl-fixed-atan2))
(defun cogl-fixed-atan2 (a b)
  (%cogl-fixed-atan2 a b))

(declaim (inline cogl-fixed-atani))
(defun cogl-fixed-atani (a)
  (%cogl-fixed-atani a))

(declaim (inline cogl-fixed-cos))
(defun cogl-fixed-cos (angle)
  (%cogl-fixed-cos angle))

(declaim (inline cogl-fixed-log2))
(defun cogl-fixed-log2 (x)
  (%cogl-fixed-log2 x))

(declaim (inline cogl-fixed-pow))
(defun cogl-fixed-pow (x y)
  (%cogl-fixed-pow x y))

(declaim (inline cogl-fixed-pow2))
(defun cogl-fixed-pow2 (x)
  (%cogl-fixed-pow2 x))

(declaim (inline cogl-fixed-sin))
(defun cogl-fixed-sin (angle)
  (%cogl-fixed-sin angle))

(declaim (inline cogl-fixed-sqrt))
(defun cogl-fixed-sqrt (x)
  (%cogl-fixed-sqrt x))

(declaim (inline cogl-fixed-tan))
(defun cogl-fixed-tan (angle)
  (%cogl-fixed-tan angle))

(declaim (inline cogl-angle-cos))
(defun cogl-angle-cos (angle)
  (%cogl-angle-cos angle))

(declaim (inline cogl-angle-sin))
(defun cogl-angle-sin (angle)
  (%cogl-angle-sin angle))

(declaim (inline cogl-angle-tan))
(defun cogl-angle-tan (angle)
  (%cogl-angle-tan angle))

(declaim (inline g-thread-init))
(defun g-thread-init (vtable)
  (%g-thread-init vtable))

(declaim (inline g-object-set-property))
(defun g-object-set-property (object property-name value)
  (%g-object-set-property object property-name value))

(declaim (inline g-object-get-property))
(defun g-object-get-property (object property-name value)
  (%g-object-get-property object property-name value))

(declaim (inline g-signal-newv))
(defun g-signal-newv (signal-name itype signal-flags class-closure accumulator accu-data c-marshaller return-type n-params param-types)
  (%g-signal-newv signal-name itype signal-flags class-closure accumulator accu-data c-marshaller return-type n-params param-types))

(declaim (inline g-signal-new-valist))
(defun g-signal-new-valist (signal-name itype signal-flags class-closure accumulator accu-data c-marshaller return-type n-params args)
  (%g-signal-new-valist signal-name itype signal-flags class-closure accumulator accu-data c-marshaller return-type n-params args))

(declaim (inline g-signal-query))
(defun g-signal-query (signal-id query)
  (%g-signal-query signal-id query))

(declaim (inline g-signal-lookup))
(defun g-signal-lookup (name itype)
  (%g-signal-lookup name itype))

(declaim (inline g-signal-name))
(defun g-signal-name (signal-id)
  (%g-signal-name signal-id))

(declaim (inline g-signal-list-ids))
(defun g-signal-list-ids (itype n-ids)
  (%g-signal-list-ids itype n-ids))

(declaim (inline g-signal-emitv))
(defun g-signal-emitv (instance-and-params signal-id detail return-value)
  (%g-signal-emitv instance-and-params signal-id detail return-value))

(declaim (inline g-signal-emit-valist))
(defun g-signal-emit-valist (instance signal-id detail var-args)
  (%g-signal-emit-valist instance signal-id detail var-args))

(declaim (inline g-signal-connect-object))
(defun g-signal-connect-object (instance detailed-signal c-handler gobject connect-flags)
  (%g-signal-connect-object instance detailed-signal c-handler gobject connect-flags))

(declaim (inline g-signal-connect-data))
(defun g-signal-connect-data (instance detailed-signal c-handler data destroy-data connect-flags)
  (%g-signal-connect-data instance detailed-signal c-handler data destroy-data connect-flags))

(declaim (inline g-signal-connect-closure))
(defun g-signal-connect-closure (instance detailed-signal closure after)
  (%g-signal-connect-closure instance detailed-signal closure after))

(declaim (inline g-signal-connect-closure-by-id))
(defun g-signal-connect-closure-by-id (instance signal-id detail closure after)
  (%g-signal-connect-closure-by-id instance signal-id detail closure after))

(declaim (inline g-signal-handler-block))
(defun g-signal-handler-block (instance handler-id)
  (%g-signal-handler-block instance handler-id))

(declaim (inline g-signal-handler-unblock))
(defun g-signal-handler-unblock (instance handler-id)
  (%g-signal-handler-unblock instance handler-id))

(declaim (inline g-signal-handler-disconnect))
(defun g-signal-handler-disconnect (instance handler-id)
  (%g-signal-handler-disconnect instance handler-id))

(declaim (inline g-signal-handler-find))
(defun g-signal-handler-find (instance mask signal-id detail closure func data)
  (%g-signal-handler-find instance mask signal-id detail closure func data))

(declaim (inline g-signal-handlers-block-matched))
(defun g-signal-handlers-block-matched (instance mask signal-id detail closure func data)
  (%g-signal-handlers-block-matched instance mask signal-id detail closure func data))

(declaim (inline g-signal-handlers-unblock-matched))
(defun g-signal-handlers-unblock-matched (instance mask signal-id detail closure func data)
  (%g-signal-handlers-unblock-matched instance mask signal-id detail closure func data))

(declaim (inline g-signal-handlers-disconnect-matched))
(defun g-signal-handlers-disconnect-matched (instance mask signal-id detail closure func data)
  (%g-signal-handlers-disconnect-matched instance mask signal-id detail closure func data))

(declaim (inline g-signal-handler-is-connected))
(defun g-signal-handler-is-connected (instance handler-id)
  (%g-signal-handler-is-connected instance handler-id))

(declaim (inline g-signal-has-handler-pending))
(defun g-signal-has-handler-pending (instance signal-id detail may-be-blocked)
  (%g-signal-has-handler-pending instance signal-id detail may-be-blocked))

(declaim (inline g-signal-stop-emission))
(defun g-signal-stop-emission (instance signal-id detail)
  (%g-signal-stop-emission instance signal-id detail))

(declaim (inline g-signal-stop-emission-by-name))
(defun g-signal-stop-emission-by-name (instance detailed-signal)
  (%g-signal-stop-emission-by-name instance detailed-signal))

(declaim (inline g-signal-override-class-closure))
(defun g-signal-override-class-closure (signal-id instance-type class-closure)
  (%g-signal-override-class-closure signal-id instance-type class-closure))

(declaim (inline g-signal-chain-from-overridden))
(defun g-signal-chain-from-overridden (instance-and-params return-value)
  (%g-signal-chain-from-overridden instance-and-params return-value))

(declaim (inline g-signal-override-class-handler))
(defun g-signal-override-class-handler (signal-name instance-type class-handler)
  (%g-signal-override-class-handler signal-name instance-type class-handler))

(declaim (inline g-signal-add-emission-hook))
(defun g-signal-add-emission-hook (signal-id detail hook-func hook-data data-destroy)
  (%g-signal-add-emission-hook signal-id detail hook-func hook-data data-destroy))

(declaim (inline g-signal-remove-emission-hook))
(defun g-signal-remove-emission-hook (signal-id hook-id)
  (%g-signal-remove-emission-hook signal-id hook-id))

(declaim (inline g-signal-parse-name))
(defun g-signal-parse-name (detailed-signal itype signal-id-p detail-p force-detail-quark)
  (%g-signal-parse-name detailed-signal itype signal-id-p detail-p force-detail-quark))

(declaim (inline g-signal-get-invocation-hint))
(defun g-signal-get-invocation-hint (instance)
  (%g-signal-get-invocation-hint instance))

(declaim (inline g-signal-type-cclosure-new))
(defun g-signal-type-cclosure-new (itype struct-offset)
  (%g-signal-type-cclosure-new itype struct-offset))

(declaim (inline g-signal-accumulator-true-handled))
(defun g-signal-accumulator-true-handled (ihint return-accu handler-return dummy)
  (%g-signal-accumulator-true-handled ihint return-accu handler-return dummy))

(declaim (inline g-value-init))
(defun g-value-init (value g-type)
  (%g-value-init value g-type))

(declaim (inline g-value-copy))
(defun g-value-copy (src-value dest-value)
  (%g-value-copy src-value dest-value))

(declaim (inline g-value-reset))
(defun g-value-reset (value)
  (%g-value-reset value))

(declaim (inline g-value-unset))
(defun g-value-unset (value)
  (%g-value-unset value))

(declaim (inline g-value-set-instance))
(defun g-value-set-instance (value instance)
  (%g-value-set-instance value instance))

(declaim (inline g-value-fits-pointer))
(defun g-value-fits-pointer (value)
  (%g-value-fits-pointer value))

(declaim (inline g-value-peek-pointer))
(defun g-value-peek-pointer (value)
  (%g-value-peek-pointer value))

(declaim (inline g-value-type-compatible))
(defun g-value-type-compatible (src-type dest-type)
  (%g-value-type-compatible src-type dest-type))

(declaim (inline g-value-type-transformable))
(defun g-value-type-transformable (src-type dest-type)
  (%g-value-type-transformable src-type dest-type))

(declaim (inline g-value-transform))
(defun g-value-transform (src-value dest-value)
  (%g-value-transform src-value dest-value))

(declaim (inline g-value-register-transform-func))
(defun g-value-register-transform-func (src-type dest-type transform-func)
  (%g-value-register-transform-func src-type dest-type transform-func))

(declaim (inline g-strdup-value-contents))
(defun g-strdup-value-contents (value)
  (%g-strdup-value-contents value))

(declaim (inline g-param-spec-boolean))
(defun g-param-spec-boolean (name nick blurb default-value flags)
  (%g-param-spec-boolean name nick blurb default-value flags))

(declaim (inline g-param-spec-char))
(defun g-param-spec-char (name nick blurb minimum maximum default-value flags)
  (%g-param-spec-char name nick blurb minimum maximum default-value flags))

(declaim (inline g-param-spec-uchar))
(defun g-param-spec-uchar (name nick blurb minimum maximum default-value flags)
  (%g-param-spec-uchar name nick blurb minimum maximum default-value flags))

(declaim (inline g-param-spec-int))
(defun g-param-spec-int (name nick blurb minimum maximum default-value flags)
  (%g-param-spec-int name nick blurb minimum maximum default-value flags))

(declaim (inline g-param-spec-uint))
(defun g-param-spec-uint (name nick blurb minimum maximum default-value flags)
  (%g-param-spec-uint name nick blurb minimum maximum default-value flags))

(declaim (inline g-param-spec-long))
(defun g-param-spec-long (name nick blurb minimum maximum default-value flags)
  (%g-param-spec-long name nick blurb minimum maximum default-value flags))

(declaim (inline g-param-spec-ulong))
(defun g-param-spec-ulong (name nick blurb minimum maximum default-value flags)
  (%g-param-spec-ulong name nick blurb minimum maximum default-value flags))

(declaim (inline g-param-spec-int64))
(defun g-param-spec-int64 (name nick blurb minimum maximum default-value flags)
  (%g-param-spec-int64 name nick blurb minimum maximum default-value flags))

(declaim (inline g-param-spec-uint64))
(defun g-param-spec-uint64 (name nick blurb minimum maximum default-value flags)
  (%g-param-spec-uint64 name nick blurb minimum maximum default-value flags))

(declaim (inline g-param-spec-float))
(defun g-param-spec-float (name nick blurb minimum maximum default-value flags)
  (%g-param-spec-float name nick blurb minimum maximum default-value flags))

(declaim (inline g-param-spec-double))
(defun g-param-spec-double (name nick blurb minimum maximum default-value flags)
  (%g-param-spec-double name nick blurb minimum maximum default-value flags))

(declaim (inline g-param-spec-enum))
(defun g-param-spec-enum (name nick blurb enum-type default-value flags)
  (%g-param-spec-enum name nick blurb enum-type default-value flags))

(declaim (inline g-param-spec-flags))
(defun g-param-spec-flags (name nick blurb flags-type default-value flags)
  (%g-param-spec-flags name nick blurb flags-type default-value flags))

(declaim (inline g-param-spec-string))
(defun g-param-spec-string (name nick blurb default-value flags)
  (%g-param-spec-string name nick blurb default-value flags))

(declaim (inline g-param-spec-param))
(defun g-param-spec-param (name nick blurb param-type flags)
  (%g-param-spec-param name nick blurb param-type flags))

(declaim (inline g-param-spec-boxed))
(defun g-param-spec-boxed (name nick blurb boxed-type flags)
  (%g-param-spec-boxed name nick blurb boxed-type flags))

(declaim (inline g-param-spec-pointer))
(defun g-param-spec-pointer (name nick blurb flags)
  (%g-param-spec-pointer name nick blurb flags))

(declaim (inline g-param-spec-object))
(defun g-param-spec-object (name nick blurb object-type flags)
  (%g-param-spec-object name nick blurb object-type flags))

(declaim (inline g-param-spec-unichar))
(defun g-param-spec-unichar (name nick blurb default-value flags)
  (%g-param-spec-unichar name nick blurb default-value flags))

(declaim (inline g-param-spec-gtype))
(defun g-param-spec-gtype (name nick blurb is-a-type flags)
  (%g-param-spec-gtype name nick blurb is-a-type flags))

(declaim (inline g-value-set-boolean))
(defun g-value-set-boolean (value v-boolean)
  (%g-value-set-boolean value v-boolean))

(declaim (inline g-value-get-boolean))
(defun g-value-get-boolean (value)
  (%g-value-get-boolean value))

(declaim (inline g-value-set-char))
(defun g-value-set-char (value v-char)
  (%g-value-set-char value v-char))

(declaim (inline g-value-get-char))
(defun g-value-get-char (value)
  (%g-value-get-char value))

(declaim (inline g-value-set-uchar))
(defun g-value-set-uchar (value v-uchar)
  (%g-value-set-uchar value v-uchar))

(declaim (inline g-value-get-uchar))
(defun g-value-get-uchar (value)
  (%g-value-get-uchar value))

(declaim (inline g-value-set-int))
(defun g-value-set-int (value v-int)
  (%g-value-set-int value v-int))

(declaim (inline g-value-get-int))
(defun g-value-get-int (value)
  (%g-value-get-int value))

(declaim (inline g-value-set-uint))
(defun g-value-set-uint (value v-uint)
  (%g-value-set-uint value v-uint))

(declaim (inline g-value-get-uint))
(defun g-value-get-uint (value)
  (%g-value-get-uint value))

(declaim (inline g-value-set-long))
(defun g-value-set-long (value v-long)
  (%g-value-set-long value v-long))

(declaim (inline g-value-get-long))
(defun g-value-get-long (value)
  (%g-value-get-long value))

(declaim (inline g-value-set-ulong))
(defun g-value-set-ulong (value v-ulong)
  (%g-value-set-ulong value v-ulong))

(declaim (inline g-value-get-ulong))
(defun g-value-get-ulong (value)
  (%g-value-get-ulong value))

(declaim (inline g-value-set-int64))
(defun g-value-set-int64 (value v-int64)
  (%g-value-set-int64 value v-int64))

(declaim (inline g-value-get-int64))
(defun g-value-get-int64 (value)
  (%g-value-get-int64 value))

(declaim (inline g-value-set-uint64))
(defun g-value-set-uint64 (value v-uint64)
  (%g-value-set-uint64 value v-uint64))

(declaim (inline g-value-get-uint64))
(defun g-value-get-uint64 (value)
  (%g-value-get-uint64 value))

(declaim (inline g-value-set-float))
(defun g-value-set-float (value v-float)
  (%g-value-set-float value v-float))

(declaim (inline g-value-get-float))
(defun g-value-get-float (value)
  (%g-value-get-float value))

(declaim (inline g-value-set-double))
(defun g-value-set-double (value v-double)
  (%g-value-set-double value v-double))

(declaim (inline g-value-get-double))
(defun g-value-get-double (value)
  (%g-value-get-double value))

(declaim (inline g-value-set-enum))
(defun g-value-set-enum (value v-enum)
  (%g-value-set-enum value v-enum))

(declaim (inline g-value-get-enum))
(defun g-value-get-enum (value)
  (%g-value-get-enum value))

(declaim (inline g-value-set-flags))
(defun g-value-set-flags (value v-flags)
  (%g-value-set-flags value v-flags))

(declaim (inline g-value-get-flags))
(defun g-value-get-flags (value)
  (%g-value-get-flags value))

(declaim (inline g-value-set-string))
(defun g-value-set-string (value v-string)
  (%g-value-set-string value v-string))

(declaim (inline g-value-set-static-string))
(defun g-value-set-static-string (value v-string)
  (%g-value-set-static-string value v-string))

(declaim (inline g-value-take-string))
(defun g-value-take-string (value v-string)
  (%g-value-take-string value v-string))

(declaim (inline g-value-set-string-take-ownership))
(defun g-value-set-string-take-ownership (value v-string)
  (%g-value-set-string-take-ownership value v-string))

(declaim (inline g-value-get-string))
(defun g-value-get-string (value)
  (%g-value-get-string value))

(declaim (inline g-value-dup-string))
(defun g-value-dup-string (value)
  (%g-value-dup-string value))

(declaim (inline g-value-set-param))
(defun g-value-set-param (value param)
  (%g-value-set-param value param))

(declaim (inline g-value-take-param))
(defun g-value-take-param (value param)
  (%g-value-take-param value param))

(declaim (inline g-value-get-param))
(defun g-value-get-param (value)
  (%g-value-get-param value))

(declaim (inline g-value-dup-param))
(defun g-value-dup-param (value)
  (%g-value-dup-param value))

(declaim (inline g-value-set-boxed))
(defun g-value-set-boxed (value v-boxed)
  (%g-value-set-boxed value v-boxed))

(declaim (inline g-value-set-static-boxed))
(defun g-value-set-static-boxed (value v-boxed)
  (%g-value-set-static-boxed value v-boxed))

(declaim (inline g-value-take-boxed))
(defun g-value-take-boxed (value v-boxed)
  (%g-value-take-boxed value v-boxed))

(declaim (inline g-value-set-boxed-take-ownership))
(defun g-value-set-boxed-take-ownership (value v-boxed)
  (%g-value-set-boxed-take-ownership value v-boxed))

(declaim (inline g-value-get-boxed))
(defun g-value-get-boxed (value)
  (%g-value-get-boxed value))

(declaim (inline g-value-dup-boxed))
(defun g-value-dup-boxed (value)
  (%g-value-dup-boxed value))

(declaim (inline g-value-set-pointer))
(defun g-value-set-pointer (value v-pointer)
  (%g-value-set-pointer value v-pointer))

(declaim (inline g-value-get-pointer))
(defun g-value-get-pointer (value)
  (%g-value-get-pointer value))

(declaim (inline g-value-set-object))
(defun g-value-set-object (value v-object)
  (%g-value-set-object value v-object))

(declaim (inline g-value-take-object))
(defun g-value-take-object (value v-object)
  (%g-value-take-object value v-object))

(declaim (inline g-value-set-object-take-ownership))
(defun g-value-set-object-take-ownership (value v-object)
  (%g-value-set-object-take-ownership value v-object))

(declaim (inline g-value-get-object))
(defun g-value-get-object (value)
  (%g-value-get-object value))

(declaim (inline g-value-dup-object))
(defun g-value-dup-object (value)
  (%g-value-dup-object value))

(declaim (inline g-param-spec-value-array))
(defun g-param-spec-value-array (name nick blurb element-spec flags)
  (%g-param-spec-value-array name nick blurb element-spec flags))

(declaim (inline g-value-get-gtype))
(defun g-value-get-gtype (value)
  (%g-value-get-gtype value))

(declaim (inline g-value-set-gtype))
(defun g-value-set-gtype (value v-gtype)
  (%g-value-set-gtype value v-gtype))

(declaim (inline g-type-from-name))
(defun g-type-from-name (name)
  (%g-type-from-name name))

(declaim (inline g-type-name))
(defun g-type-name (type)
  (%g-type-name type))

(declaim (inline g-object-ref))
(defun g-object-ref (object)
  (%g-object-ref object))

(declaim (inline g-object-unref))
(defun g-object-unref (object)
  (%g-object-unref object))

(declaim (inline g-object-ref-sink))
(defun g-object-ref-sink (object)
  (%g-object-ref-sink object))

(declaim (inline g-object-is-floating))
(defun g-object-is-floating (object)
  (%g-object-is-floating object))

(declaim (inline g-object-force-floating))
(defun g-object-force-floating (object)
  (%g-object-force-floating object))

(declaim (inline g-object-weak-ref))
(defun g-object-weak-ref (object notify data)
  (%g-object-weak-ref object notify data))

(declaim (inline g-object-weak-unref))
(defun g-object-weak-unref (object notify data)
  (%g-object-weak-unref object notify data))

(declaim (inline g-object-add-weak-pointer))
(defun g-object-add-weak-pointer (object weak-pointer-location)
  (%g-object-add-weak-pointer object weak-pointer-location))

(declaim (inline g-object-remove-weak-pointer))
(defun g-object-remove-weak-pointer (object weak-pointer-location)
  (%g-object-remove-weak-pointer object weak-pointer-location))

(declaim (inline g-object-add-toggle-ref))
(defun g-object-add-toggle-ref (object notify data)
  (%g-object-add-toggle-ref object notify data))

(declaim (inline g-object-remove-toggle-ref))
(defun g-object-remove-toggle-ref (object notify data)
  (%g-object-remove-toggle-ref object notify data))

(declaim (inline g-object-notify))
(defun g-object-notify (object property-name)
  (%g-object-notify object property-name))

(declaim (inline g-object-freeze-notify))
(defun g-object-freeze-notify (object)
  (%g-object-freeze-notify object))

(declaim (inline g-object-thaw-notify))
(defun g-object-thaw-notify (object)
  (%g-object-thaw-notify object))

(declaim (inline g-type-register-static))
(defun g-type-register-static (parent-type type-name info flags)
  (%g-type-register-static parent-type type-name info flags))

(declaim (inline g-type-register-static-simple))
(defun g-type-register-static-simple (parent-type type-name class-size class-init instance-size instance-init flags)
  (%g-type-register-static-simple parent-type type-name class-size class-init instance-size instance-init flags))

(declaim (inline g-type-qname))
(defun g-type-qname (type)
  (%g-type-qname type))

(declaim (inline g-type-parent))
(defun g-type-parent (type)
  (%g-type-parent type))

(declaim (inline g-type-depth))
(defun g-type-depth (type)
  (%g-type-depth type))

(declaim (inline g-type-next-base))
(defun g-type-next-base (leaf-type root-type)
  (%g-type-next-base leaf-type root-type))

(declaim (inline g-type-is-a))
(defun g-type-is-a (type is-a-type)
  (%g-type-is-a type is-a-type))

(declaim (inline g-type-class-ref))
(defun g-type-class-ref (type)
  (%g-type-class-ref type))

(declaim (inline g-type-class-peek))
(defun g-type-class-peek (type)
  (%g-type-class-peek type))

(declaim (inline g-type-class-peek-static))
(defun g-type-class-peek-static (type)
  (%g-type-class-peek-static type))

(declaim (inline g-type-class-unref))
(defun g-type-class-unref (g-class)
  (%g-type-class-unref g-class))

(declaim (inline g-type-class-peek-parent))
(defun g-type-class-peek-parent (g-class)
  (%g-type-class-peek-parent g-class))

(declaim (inline g-type-class-add-private))
(defun g-type-class-add-private (g-class private-size)
  (%g-type-class-add-private g-class private-size))

(declaim (inline g-type-interface-peek))
(defun g-type-interface-peek (instance-class iface-type)
  (%g-type-interface-peek instance-class iface-type))

(declaim (inline g-type-interface-peek-parent))
(defun g-type-interface-peek-parent (g-iface)
  (%g-type-interface-peek-parent g-iface))

(declaim (inline g-type-default-interface-ref))
(defun g-type-default-interface-ref (g-type)
  (%g-type-default-interface-ref g-type))

(declaim (inline g-type-default-interface-peek))
(defun g-type-default-interface-peek (g-type)
  (%g-type-default-interface-peek g-type))

(declaim (inline g-type-default-interface-unref))
(defun g-type-default-interface-unref (g-iface)
  (%g-type-default-interface-unref g-iface))

(declaim (inline g-type-children))
(defun g-type-children (type n-children)
  (%g-type-children type n-children))

(declaim (inline g-type-interfaces))
(defun g-type-interfaces (type n-interfaces)
  (%g-type-interfaces type n-interfaces))

(declaim (inline g-type-interface-prerequisites))
(defun g-type-interface-prerequisites (interface-type n-prerequisites)
  (%g-type-interface-prerequisites interface-type n-prerequisites))

(declaim (inline g-type-set-qdata))
(defun g-type-set-qdata (type quark data)
  (%g-type-set-qdata type quark data))

(declaim (inline g-type-get-qdata))
(defun g-type-get-qdata (type quark)
  (%g-type-get-qdata type quark))

(declaim (inline g-type-query))
(defun g-type-query (type query)
  (%g-type-query type query))

(declaim (inline g-type-add-interface-static))
(defun g-type-add-interface-static (instance-type interface-type info)
  (%g-type-add-interface-static instance-type interface-type info))

(declaim (inline g-type-interface-add-prerequisite))
(defun g-type-interface-add-prerequisite (interface-type prerequisite-type)
  (%g-type-interface-add-prerequisite interface-type prerequisite-type))

(declaim (inline g-object-class-install-property))
(defun g-object-class-install-property (oclass property-id pspec)
  (%g-object-class-install-property oclass property-id pspec))

(declaim (inline g-object-class-find-property))
(defun g-object-class-find-property (oclass property-name)
  (%g-object-class-find-property oclass property-name))

(declaim (inline g-object-class-list-properties))
(defun g-object-class-list-properties (oclass n-properties)
  (%g-object-class-list-properties oclass n-properties))

(declaim (inline g-object-class-override-property))
(defun g-object-class-override-property (oclass property-id name)
  (%g-object-class-override-property oclass property-id name))

(declaim (inline g-object-interface-install-property))
(defun g-object-interface-install-property (g-iface pspec)
  (%g-object-interface-install-property g-iface pspec))

(declaim (inline g-object-interface-find-property))
(defun g-object-interface-find-property (g-iface property-name)
  (%g-object-interface-find-property g-iface property-name))

(declaim (inline g-object-interface-list-properties))
(defun g-object-interface-list-properties (g-iface n-properties-p)
  (%g-object-interface-list-properties g-iface n-properties-p))

(declaim (inline g-object-newv))
(defun g-object-newv (object-type n-parameters parameters)
  (%g-object-newv object-type n-parameters parameters))

