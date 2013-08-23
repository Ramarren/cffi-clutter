(in-package :cffi-clutter)

(define-foreign-library clutter
  (:unix
   (:or #+x86-64 "/usr/lib64/libclutter-glx-1.0.so"
        #+x86    "/usr/lib/libclutter-glx-1.0.so"
        "/home/ramarren/C/Clutter/clutter-1.0.0/clutter/.libs/libclutter-glx-1.0.so")))

(define-foreign-library glib
  (:unix
   (:or #+x86-64 "/usr/lib64/libglib-2.0.so"
        #+x86    "/usr/lib/libglib-2.0.so"
        "/usr/lib/libglib.so")))

(define-foreign-library gobject
  (:unix #+x86-64 "/usr/lib64/libgobject-2.0.so"
         #+x86    "/usr/lib/libgobject-2.0.so"))

(use-foreign-library clutter)
(use-foreign-library glib)
(use-foreign-library gobject)

(declaim (inline g-type-from-class g-type-from-instance))
(defun g-type-from-class (class)
  (foreign-slot-value
   class
   'g-type-class 'g-type))

(defun g-type-from-instance (instance)
  (g-type-from-class (foreign-slot-value instance 'g-type-instance 'g-class)))

(defctype function-pointer :pointer)

;; composite enum construction/deconstruction
;; not using bitfields because it seems that they can't be grovelled for

(defun cenum-collect-values (keyword-list type)
  (cond ((null keyword-list) 0)
        ((atom keyword-list) (foreign-enum-value type keyword-list))
        (t (reduce #'+
                   (mapcar (curry #'foreign-enum-value type)
                           keyword-list)))))

(defun cenum-deconstruct-value (value type)
  (let ((accum nil)
        (k 1))
    (dotimes (i (integer-length value) (if (length= 1 accum)
                                           (car accum)
                                           accum))
      (let ((bit (plusp (logand value 1))))
        (when bit
          (let ((value (foreign-enum-keyword type k :errorp nil)))
            (when value
              (push value accum)))))
      (setf k (ash k 1)
            value (ash value -1)))));; composite enum translations

(define-foreign-type modifier-type-composite-enum ()
   ()
   (:actual-type modifier-type-composite)
   (:simple-parser modifier-type-composite-enum))

(define-parse-method modifier-type-composite-enum ()
   (make-instance 'modifier-type-composite-enum))

(defmethod translate-to-foreign (value (type modifier-type-composite-enum))
   (cenum-collect-values value 'modifier-type))

(defmethod translate-from-foreign (value (type modifier-type-composite-enum))
   (cenum-deconstruct-value value 'modifier-type))

(define-foreign-type texture-flags-composite-enum ()
   ()
   (:actual-type texture-flags-composite)
   (:simple-parser texture-flags-composite-enum))

(define-parse-method texture-flags-composite-enum ()
   (make-instance 'texture-flags-composite-enum))

(defmethod translate-to-foreign (value (type texture-flags-composite-enum))
   (cenum-collect-values value 'texture-flags))

(defmethod translate-from-foreign (value (type texture-flags-composite-enum))
   (cenum-deconstruct-value value 'texture-flags))

(define-foreign-type g-param-flags-composite-enum ()
   ()
   (:actual-type g-param-flags-composite)
   (:simple-parser g-param-flags-composite-enum))

(define-parse-method g-param-flags-composite-enum ()
   (make-instance 'g-param-flags-composite-enum))

(defmethod translate-to-foreign (value (type g-param-flags-composite-enum))
   (cenum-collect-values value 'g-param-flags))

(defmethod translate-from-foreign (value (type g-param-flags-composite-enum))
   (cenum-deconstruct-value value 'g-param-flags))

(define-foreign-type g-connect-flags-composite-enum ()
   ()
   (:actual-type g-connect-flags-composite)
   (:simple-parser g-connect-flags-composite-enum))

(define-parse-method g-connect-flags-composite-enum ()
   (make-instance 'g-connect-flags-composite-enum))

(defmethod translate-to-foreign (value (type g-connect-flags-composite-enum))
   (cenum-collect-values value 'g-connect-flags))

(defmethod translate-from-foreign (value (type g-connect-flags-composite-enum))
   (cenum-deconstruct-value value 'g-connect-flags))

(define-foreign-type event-flags-composite-enum ()
   ()
   (:actual-type event-flags-composite)
   (:simple-parser event-flags-composite-enum))

(define-parse-method event-flags-composite-enum ()
   (make-instance 'event-flags-composite-enum))

(defmethod translate-to-foreign (value (type event-flags-composite-enum))
   (cenum-collect-values value 'event-flags))

(defmethod translate-from-foreign (value (type event-flags-composite-enum))
   (cenum-deconstruct-value value 'event-flags))

(define-foreign-type stage-state-composite-enum ()
   ()
   (:actual-type stage-state-composite)
   (:simple-parser stage-state-composite-enum))

(define-parse-method stage-state-composite-enum ()
   (make-instance 'stage-state-composite-enum))

(defmethod translate-to-foreign (value (type stage-state-composite-enum))
   (cenum-collect-values value 'stage-state))

(defmethod translate-from-foreign (value (type stage-state-composite-enum))
   (cenum-deconstruct-value value 'stage-state))

(define-foreign-type font-flags-composite-enum ()
   ()
   (:actual-type font-flags-composite)
   (:simple-parser font-flags-composite-enum))

(define-parse-method font-flags-composite-enum ()
   (make-instance 'font-flags-composite-enum))

(defmethod translate-to-foreign (value (type font-flags-composite-enum))
   (cenum-collect-values value 'font-flags))

(defmethod translate-from-foreign (value (type font-flags-composite-enum))
   (cenum-deconstruct-value value 'font-flags))

(define-foreign-type allocation-flags-composite-enum ()
   ()
   (:actual-type allocation-flags-composite)
   (:simple-parser allocation-flags-composite-enum))

(define-parse-method allocation-flags-composite-enum ()
   (make-instance 'allocation-flags-composite-enum))

(defmethod translate-to-foreign (value (type allocation-flags-composite-enum))
   (cenum-collect-values value 'allocation-flags))

(defmethod translate-from-foreign (value (type allocation-flags-composite-enum))
   (cenum-deconstruct-value value 'allocation-flags))

(define-foreign-type actor-flags-composite-enum ()
   ()
   (:actual-type actor-flags-composite)
   (:simple-parser actor-flags-composite-enum))

(define-parse-method actor-flags-composite-enum ()
   (make-instance 'actor-flags-composite-enum))

(defmethod translate-to-foreign (value (type actor-flags-composite-enum))
   (cenum-collect-values value 'actor-flags))

(defmethod translate-from-foreign (value (type actor-flags-composite-enum))
   (cenum-deconstruct-value value 'actor-flags))

(define-foreign-type g-signal-match-type-composite-enum ()
   ()
   (:actual-type g-signal-match-type-composite)
   (:simple-parser g-signal-match-type-composite-enum))

(define-parse-method g-signal-match-type-composite-enum ()
   (make-instance 'g-signal-match-type-composite-enum))

(defmethod translate-to-foreign (value (type g-signal-match-type-composite-enum))
   (cenum-collect-values value 'g-signal-match-type))

(defmethod translate-from-foreign (value (type g-signal-match-type-composite-enum))
   (cenum-deconstruct-value value 'g-signal-match-type))

(define-foreign-type cogl-texture-flags-composite-enum ()
   ()
   (:actual-type cogl-texture-flags-composite)
   (:simple-parser cogl-texture-flags-composite-enum))

(define-parse-method cogl-texture-flags-composite-enum ()
   (make-instance 'cogl-texture-flags-composite-enum))

(defmethod translate-to-foreign (value (type cogl-texture-flags-composite-enum))
   (cenum-collect-values value 'cogl-texture-flags))

(defmethod translate-from-foreign (value (type cogl-texture-flags-composite-enum))
   (cenum-deconstruct-value value 'cogl-texture-flags))

(define-foreign-type cogl-feature-flags-composite-enum ()
   ()
   (:actual-type cogl-feature-flags-composite)
   (:simple-parser cogl-feature-flags-composite-enum))

(define-parse-method cogl-feature-flags-composite-enum ()
   (make-instance 'cogl-feature-flags-composite-enum))

(defmethod translate-to-foreign (value (type cogl-feature-flags-composite-enum))
   (cenum-collect-values value 'cogl-feature-flags))

(defmethod translate-from-foreign (value (type cogl-feature-flags-composite-enum))
   (cenum-deconstruct-value value 'cogl-feature-flags))

(define-foreign-type cogl-read-pixels-flags-composite-enum ()
   ()
   (:actual-type cogl-read-pixels-flags-composite)
   (:simple-parser cogl-read-pixels-flags-composite-enum))

(define-parse-method cogl-read-pixels-flags-composite-enum ()
   (make-instance 'cogl-read-pixels-flags-composite-enum))

(defmethod translate-to-foreign (value (type cogl-read-pixels-flags-composite-enum))
   (cenum-collect-values value 'cogl-read-pixels-flags))

(defmethod translate-from-foreign (value (type cogl-read-pixels-flags-composite-enum))
   (cenum-deconstruct-value value 'cogl-read-pixels-flags))

(define-foreign-type cogl-buffer-target-composite-enum ()
   ()
   (:actual-type cogl-buffer-target-composite)
   (:simple-parser cogl-buffer-target-composite-enum))

(define-parse-method cogl-buffer-target-composite-enum ()
   (make-instance 'cogl-buffer-target-composite-enum))

(defmethod translate-to-foreign (value (type cogl-buffer-target-composite-enum))
   (cenum-collect-values value 'cogl-buffer-target))

(defmethod translate-from-foreign (value (type cogl-buffer-target-composite-enum))
   (cenum-deconstruct-value value 'cogl-buffer-target))

(define-foreign-type g-type-flags-composite-enum ()
   ()
   (:actual-type g-type-flags-composite)
   (:simple-parser g-type-flags-composite-enum))

(define-parse-method g-type-flags-composite-enum ()
   (make-instance 'g-type-flags-composite-enum))

(defmethod translate-to-foreign (value (type g-type-flags-composite-enum))
   (cenum-collect-values value 'g-type-flags))

(defmethod translate-from-foreign (value (type g-type-flags-composite-enum))
   (cenum-deconstruct-value value 'g-type-flags))

(define-foreign-type g-signal-flags-composite-enum ()
   ()
   (:actual-type g-signal-flags-composite)
   (:simple-parser g-signal-flags-composite-enum))

(define-parse-method g-signal-flags-composite-enum ()
   (make-instance 'g-signal-flags-composite-enum))

(defmethod translate-to-foreign (value (type g-signal-flags-composite-enum))
   (cenum-collect-values value 'g-signal-flags))

(defmethod translate-from-foreign (value (type g-signal-flags-composite-enum))
   (cenum-deconstruct-value value 'g-signal-flags))

;; function definitions

(defcfun (%actor-set-flags "clutter_actor_set_flags") :void
    (self (:pointer actor))
    (flags actor-flags-composite-enum))

(defcfun (%actor-unset-flags "clutter_actor_unset_flags") :void
    (self (:pointer actor))
    (flags actor-flags-composite-enum))

(defcfun (%actor-get-flags "clutter_actor_get_flags") actor-flags-composite-enum
    (self (:pointer actor)))

(defcfun (%actor-show "clutter_actor_show") :void
    (self (:pointer actor)))

(defcfun (%actor-show-all "clutter_actor_show_all") :void
    (self (:pointer actor)))

(defcfun (%actor-hide "clutter_actor_hide") :void
    (self (:pointer actor)))

(defcfun (%actor-hide-all "clutter_actor_hide_all") :void
    (self (:pointer actor)))

(defcfun (%actor-realize "clutter_actor_realize") :void
    (self (:pointer actor)))

(defcfun (%actor-unrealize "clutter_actor_unrealize") :void
    (self (:pointer actor)))

(defcfun (%actor-paint "clutter_actor_paint") :void
    (self (:pointer actor)))

(defcfun (%actor-queue-redraw "clutter_actor_queue_redraw") :void
    (self (:pointer actor)))

(defcfun (%actor-queue-relayout "clutter_actor_queue_relayout") :void
    (self (:pointer actor)))

(defcfun (%actor-destroy "clutter_actor_destroy") :void
    (self (:pointer actor)))

(defcfun (%actor-event "clutter_actor_event") gboolean
    (actor (:pointer actor))
    (event :pointer)
    (capture gboolean))

(defcfun (%actor-should-pick-paint "clutter_actor_should_pick_paint") gboolean
    (self (:pointer actor)))

(defcfun (%actor-map "clutter_actor_map") :void
    (self (:pointer actor)))

(defcfun (%actor-unmap "clutter_actor_unmap") :void
    (self (:pointer actor)))

(defcfun (%actor-allocate "clutter_actor_allocate") :void
    (self (:pointer actor))
    (box (:pointer actor-box))
    (flags allocation-flags-composite-enum))

(defcfun (%actor-allocate-preferred-size "clutter_actor_allocate_preferred_size") :void
    (self (:pointer actor))
    (flags allocation-flags-composite-enum))

(defcfun (%actor-allocate-available-size "clutter_actor_allocate_available_size") :void
    (self (:pointer actor))
    (x :float)
    (y :float)
    (available-width :float)
    (available-height :float)
    (flags allocation-flags-composite-enum))

(defcfun (%actor-get-allocation-box "clutter_actor_get_allocation_box") :void
    (self (:pointer actor))
    (box (:pointer actor-box)))

(defcfun (%actor-get-allocation-geometry "clutter_actor_get_allocation_geometry") :void
    (self (:pointer actor))
    (geom (:pointer geometry)))

(defcfun (%actor-get-allocation-vertices "clutter_actor_get_allocation_vertices") :void
    (self (:pointer actor))
    (ancestor (:pointer actor))
    (verts[4] vertex))

(defcfun (%actor-get-preferred-size "clutter_actor_get_preferred_size") :void
    (self (:pointer actor))
    (min-width-p (:pointer :float))
    (min-height-p (:pointer :float))
    (natural-width-p (:pointer :float))
    (natural-height-p (:pointer :float)))

(defcfun (%actor-get-preferred-width "clutter_actor_get_preferred_width") :void
    (self (:pointer actor))
    (for-height :float)
    (min-width-p (:pointer :float))
    (natural-width-p (:pointer :float)))

(defcfun (%actor-get-preferred-height "clutter_actor_get_preferred_height") :void
    (self (:pointer actor))
    (for-width :float)
    (min-height-p (:pointer :float))
    (natural-height-p (:pointer :float)))

(defcfun (%actor-set-fixed-position-set "clutter_actor_set_fixed_position_set") :void
    (self (:pointer actor))
    (is-set gboolean))

(defcfun (%actor-get-fixed-position-set "clutter_actor_get_fixed_position_set") gboolean
    (self (:pointer actor)))

(defcfun (%actor-set-geometry "clutter_actor_set_geometry") :void
    (self (:pointer actor))
    (geometry (:pointer geometry)))

(defcfun (%actor-get-geometry "clutter_actor_get_geometry") :void
    (self (:pointer actor))
    (geometry (:pointer geometry)))

(defcfun (%actor-set-size "clutter_actor_set_size") :void
    (self (:pointer actor))
    (width :float)
    (height :float))

(defcfun (%actor-get-size "clutter_actor_get_size") :void
    (self (:pointer actor))
    (width (:pointer :float))
    (height (:pointer :float)))

(defcfun (%actor-set-position "clutter_actor_set_position") :void
    (self (:pointer actor))
    (x :float)
    (y :float))

(defcfun (%actor-get-position "clutter_actor_get_position") :void
    (self (:pointer actor))
    (x (:pointer :float))
    (y (:pointer :float)))

(defcfun (%actor-set-width "clutter_actor_set_width") :void
    (self (:pointer actor))
    (width :float))

(defcfun (%actor-get-width "clutter_actor_get_width") :float
    (self (:pointer actor)))

(defcfun (%actor-set-height "clutter_actor_set_height") :void
    (self (:pointer actor))
    (height :float))

(defcfun (%actor-get-height "clutter_actor_get_height") :float
    (self (:pointer actor)))

(defcfun (%actor-set-x "clutter_actor_set_x") :void
    (self (:pointer actor))
    (x :float))

(defcfun (%actor-get-x "clutter_actor_get_x") :float
    (self (:pointer actor)))

(defcfun (%actor-set-y "clutter_actor_set_y") :void
    (self (:pointer actor))
    (y :float))

(defcfun (%actor-get-y "clutter_actor_get_y") :float
    (self (:pointer actor)))

(defcfun (%actor-move-by "clutter_actor_move_by") :void
    (self (:pointer actor))
    (dx :float)
    (dy :float))

(defcfun (%actor-set-rotation "clutter_actor_set_rotation") :void
    (self (:pointer actor))
    (axis rotate-axis)
    (angle :double)
    (x :float)
    (y :float)
    (z :float))

(defcfun (%actor-set-z-rotation-from-gravity "clutter_actor_set_z_rotation_from_gravity") :void
    (self (:pointer actor))
    (angle :double)
    (gravity gravity))

(defcfun (%actor-get-rotation "clutter_actor_get_rotation") :double
    (self (:pointer actor))
    (axis rotate-axis)
    (x (:pointer :float))
    (y (:pointer :float))
    (z (:pointer :float)))

(defcfun (%actor-get-z-rotation-gravity "clutter_actor_get_z_rotation_gravity") gravity
    (self (:pointer actor)))

(defcfun (%actor-is-rotated "clutter_actor_is_rotated") gboolean
    (self (:pointer actor)))

(defcfun (%actor-set-opacity "clutter_actor_set_opacity") :void
    (self (:pointer actor))
    (opacity guint8))

(defcfun (%actor-get-opacity "clutter_actor_get_opacity") guint8
    (self (:pointer actor)))

(defcfun (%actor-set-name "clutter_actor_set_name") :void
    (self (:pointer actor))
    (name :string))

(defcfun (%actor-get-name "clutter_actor_get_name") :string
    (self (:pointer actor)))

(defcfun (%actor-get-gid "clutter_actor_get_gid") guint32
    (self (:pointer actor)))

(defcfun (%actor-set-clip "clutter_actor_set_clip") :void
    (self (:pointer actor))
    (xoff :float)
    (yoff :float)
    (width :float)
    (height :float))

(defcfun (%actor-remove-clip "clutter_actor_remove_clip") :void
    (self (:pointer actor)))

(defcfun (%actor-has-clip "clutter_actor_has_clip") gboolean
    (self (:pointer actor)))

(defcfun (%actor-get-clip "clutter_actor_get_clip") :void
    (self (:pointer actor))
    (xoff (:pointer :float))
    (yoff (:pointer :float))
    (width (:pointer :float))
    (height (:pointer :float)))

(defcfun (%actor-set-parent "clutter_actor_set_parent") :void
    (self (:pointer actor))
    (parent (:pointer actor)))

(defcfun (%actor-get-parent "clutter_actor_get_parent") (:pointer actor)
    (self (:pointer actor)))

(defcfun (%actor-reparent "clutter_actor_reparent") :void
    (self (:pointer actor))
    (new-parent (:pointer actor)))

(defcfun (%actor-unparent "clutter_actor_unparent") :void
    (self (:pointer actor)))

(defcfun (%actor-raise "clutter_actor_raise") :void
    (self (:pointer actor))
    (below (:pointer actor)))

(defcfun (%actor-lower "clutter_actor_lower") :void
    (self (:pointer actor))
    (above (:pointer actor)))

(defcfun (%actor-raise-top "clutter_actor_raise_top") :void
    (self (:pointer actor)))

(defcfun (%actor-lower-bottom "clutter_actor_lower_bottom") :void
    (self (:pointer actor)))

(defcfun (%actor-get-stage "clutter_actor_get_stage") (:pointer actor)
    (actor (:pointer actor)))

(defcfun (%actor-set-depth "clutter_actor_set_depth") :void
    (self (:pointer actor))
    (depth :float))

(defcfun (%actor-get-depth "clutter_actor_get_depth") :float
    (self (:pointer actor)))

(defcfun (%actor-set-scale "clutter_actor_set_scale") :void
    (self (:pointer actor))
    (scale-x :double)
    (scale-y :double))

(defcfun (%actor-set-scale-full "clutter_actor_set_scale_full") :void
    (self (:pointer actor))
    (scale-x :double)
    (scale-y :double)
    (center-x :float)
    (center-y :float))

(defcfun (%actor-set-scale-with-gravity "clutter_actor_set_scale_with_gravity") :void
    (self (:pointer actor))
    (scale-x :double)
    (scale-y :double)
    (gravity gravity))

(defcfun (%actor-get-scale "clutter_actor_get_scale") :void
    (self (:pointer actor))
    (scale-x (:pointer :double))
    (scale-y (:pointer :double)))

(defcfun (%actor-get-scale-center "clutter_actor_get_scale_center") :void
    (self (:pointer actor))
    (center-x (:pointer :float))
    (center-y (:pointer :float)))

(defcfun (%actor-get-scale-gravity "clutter_actor_get_scale_gravity") gravity
    (self (:pointer actor)))

(defcfun (%actor-is-scaled "clutter_actor_is_scaled") gboolean
    (self (:pointer actor)))

(defcfun (%actor-apply-transform-to-point "clutter_actor_apply_transform_to_point") :void
    (self (:pointer actor))
    (point (:pointer vertex))
    (vertex (:pointer vertex)))

(defcfun (%actor-transform-stage-point "clutter_actor_transform_stage_point") gboolean
    (self (:pointer actor))
    (x :float)
    (y :float)
    (x-out (:pointer :float))
    (y-out (:pointer :float)))

(defcfun (%actor-apply-relative-transform-to-point "clutter_actor_apply_relative_transform_to_point") :void
    (self (:pointer actor))
    (ancestor (:pointer actor))
    (point (:pointer vertex))
    (vertex (:pointer vertex)))

(defcfun (%actor-get-transformed-position "clutter_actor_get_transformed_position") :void
    (self (:pointer actor))
    (x (:pointer :float))
    (y (:pointer :float)))

(defcfun (%actor-get-transformed-size "clutter_actor_get_transformed_size") :void
    (self (:pointer actor))
    (width (:pointer :float))
    (height (:pointer :float)))

(defcfun (%actor-get-paint-opacity "clutter_actor_get_paint_opacity") guint8
    (self (:pointer actor)))

(defcfun (%actor-get-paint-visibility "clutter_actor_get_paint_visibility") gboolean
    (self (:pointer actor)))

(defcfun (%actor-get-abs-allocation-vertices "clutter_actor_get_abs_allocation_vertices") :void
    (self (:pointer actor))
    (verts[4] vertex))

(defcfun (%actor-get-transformation-matrix "clutter_actor_get_transformation_matrix") :void
    (self (:pointer actor))
    (matrix :pointer))

(defcfun (%actor-set-anchor-point "clutter_actor_set_anchor_point") :void
    (self (:pointer actor))
    (anchor-x :float)
    (anchor-y :float))

(defcfun (%actor-get-anchor-point "clutter_actor_get_anchor_point") :void
    (self (:pointer actor))
    (anchor-x (:pointer :float))
    (anchor-y (:pointer :float)))

(defcfun (%actor-set-anchor-point-from-gravity "clutter_actor_set_anchor_point_from_gravity") :void
    (self (:pointer actor))
    (gravity gravity))

(defcfun (%actor-get-anchor-point-gravity "clutter_actor_get_anchor_point_gravity") gravity
    (self (:pointer actor)))

(defcfun (%actor-move-anchor-point "clutter_actor_move_anchor_point") :void
    (self (:pointer actor))
    (anchor-x :float)
    (anchor-y :float))

(defcfun (%actor-move-anchor-point-from-gravity "clutter_actor_move_anchor_point_from_gravity") :void
    (self (:pointer actor))
    (gravity gravity))

(defcfun (%actor-set-reactive "clutter_actor_set_reactive") :void
    (actor (:pointer actor))
    (reactive gboolean))

(defcfun (%actor-get-reactive "clutter_actor_get_reactive") gboolean
    (actor (:pointer actor)))

(defcfun (%actor-set-shader "clutter_actor_set_shader") gboolean
    (self (:pointer actor))
    (shader :pointer))

(defcfun (%actor-get-shader "clutter_actor_get_shader") :pointer
    (self (:pointer actor)))

(defcfun (%actor-set-shader-param "clutter_actor_set_shader_param") :void
    (self (:pointer actor))
    (param :string)
    (value (:pointer g-value)))

(defcfun (%actor-set-shader-param-float "clutter_actor_set_shader_param_float") :void
    (self (:pointer actor))
    (param :string)
    (value :float))

(defcfun (%actor-set-shader-param-int "clutter_actor_set_shader_param_int") :void
    (self (:pointer actor))
    (param :string)
    (value gint))

(defcfun (%actor-grab-key-focus "clutter_actor_grab_key_focus") :void
    (self (:pointer actor)))

(defcfun (%actor-get-pango-context "clutter_actor_get_pango_context") :pointer
    (self (:pointer actor)))

(defcfun (%actor-create-pango-context "clutter_actor_create_pango_context") :pointer
    (self (:pointer actor)))

(defcfun (%actor-create-pango-layout "clutter_actor_create_pango_layout") :pointer
    (self (:pointer actor))
    (text :string))

(defcfun (%actor-box-new "clutter_actor_box_new") (:pointer actor-box)
    (x-1 :float)
    (y-1 :float)
    (x-2 :float)
    (y-2 :float))

(defcfun (%actor-box-copy "clutter_actor_box_copy") (:pointer actor-box)
    (box (:pointer actor-box)))

(defcfun (%actor-box-free "clutter_actor_box_free") :void
    (box (:pointer actor-box)))

(defcfun (%actor-box-equal "clutter_actor_box_equal") gboolean
    (box-a (:pointer actor-box))
    (box-b (:pointer actor-box)))

(defcfun (%actor-box-get-x "clutter_actor_box_get_x") :float
    (box (:pointer actor-box)))

(defcfun (%actor-box-get-y "clutter_actor_box_get_y") :float
    (box (:pointer actor-box)))

(defcfun (%actor-box-get-width "clutter_actor_box_get_width") :float
    (box (:pointer actor-box)))

(defcfun (%actor-box-get-height "clutter_actor_box_get_height") :float
    (box (:pointer actor-box)))

(defcfun (%actor-box-get-origin "clutter_actor_box_get_origin") :void
    (box (:pointer actor-box))
    (x (:pointer :float))
    (y (:pointer :float)))

(defcfun (%actor-box-get-size "clutter_actor_box_get_size") :void
    (box (:pointer actor-box))
    (width (:pointer :float))
    (height (:pointer :float)))

(defcfun (%actor-box-get-area "clutter_actor_box_get_area") :float
    (box (:pointer actor-box)))

(defcfun (%actor-box-contains "clutter_actor_box_contains") gboolean
    (box (:pointer actor-box))
    (x :float)
    (y :float))

(defcfun (%actor-box-from-vertices "clutter_actor_box_from_vertices") :void
    (box (:pointer actor-box))
    (verts (:pointer vertex)))

(defcfun (%vertex-new "clutter_vertex_new") (:pointer vertex)
    (x :float)
    (y :float)
    (z :float))

(defcfun (%vertex-copy "clutter_vertex_copy") (:pointer vertex)
    (vertex (:pointer vertex)))

(defcfun (%vertex-free "clutter_vertex_free") :void
    (vertex (:pointer vertex)))

(defcfun (%vertex-equal "clutter_vertex_equal") gboolean
    (vertex-a (:pointer vertex))
    (vertex-b (:pointer vertex)))

(defcfun (%container-add-actor "clutter_container_add_actor") :void
    (container :pointer)
    (actor (:pointer actor)))

(defcfun (%container-remove-actor "clutter_container_remove_actor") :void
    (container :pointer)
    (actor (:pointer actor)))

(defcfun (%container-get-children "clutter_container_get_children") :pointer
    (container :pointer))

(defcfun (%container-foreach "clutter_container_foreach") :void
    (container :pointer)
    (callback function-pointer)
    (user-data :pointer))

(defcfun (%container-foreach-with-internals "clutter_container_foreach_with_internals") :void
    (container :pointer)
    (callback function-pointer)
    (user-data :pointer))

(defcfun (%container-find-child-by-name "clutter_container_find_child_by_name") (:pointer actor)
    (container :pointer)
    (child-name :string))

(defcfun (%container-raise-child "clutter_container_raise_child") :void
    (container :pointer)
    (actor (:pointer actor))
    (sibling (:pointer actor)))

(defcfun (%container-lower-child "clutter_container_lower_child") :void
    (container :pointer)
    (actor (:pointer actor))
    (sibling (:pointer actor)))

(defcfun (%container-sort-depth-order "clutter_container_sort_depth_order") :void
    (container :pointer))

(defcfun (%container-class-find-child-property "clutter_container_class_find_child_property") (:pointer g-param-spec)
    (klass (:pointer g-object-class))
    (property-name :string))

(defcfun (%container-class-list-child-properties "clutter_container_class_list_child_properties") :pointer
    (klass (:pointer g-object-class))
    (n-properties (:pointer guint)))

(defcfun (%container-child-set-property "clutter_container_child_set_property") :void
    (container :pointer)
    (child (:pointer actor))
    (property :string)
    (value (:pointer g-value)))

(defcfun (%container-child-get-property "clutter_container_child_get_property") :void
    (container :pointer)
    (child (:pointer actor))
    (property :string)
    (value (:pointer g-value)))

(defcfun (%container-get-child-meta "clutter_container_get_child_meta") :pointer
    (container :pointer)
    (actor (:pointer actor)))

(defcfun (%child-meta-get-container "clutter_child_meta_get_container") :pointer
    (data :pointer))

(defcfun (%child-meta-get-actor "clutter_child_meta_get_actor") (:pointer actor)
    (data :pointer))

(defcfun (%media-set-uri "clutter_media_set_uri") :void
    (media :pointer)
    (uri :string))

(defcfun (%media-get-uri "clutter_media_get_uri") :string
    (media :pointer))

(defcfun (%media-set-playing "clutter_media_set_playing") :void
    (media :pointer)
    (playing gboolean))

(defcfun (%media-get-playing "clutter_media_get_playing") gboolean
    (media :pointer))

(defcfun (%media-set-progress "clutter_media_set_progress") :void
    (media :pointer)
    (progress :double))

(defcfun (%media-get-progress "clutter_media_get_progress") :double
    (media :pointer))

(defcfun (%media-set-audio-volume "clutter_media_set_audio_volume") :void
    (media :pointer)
    (volume :double))

(defcfun (%media-get-audio-volume "clutter_media_get_audio_volume") :double
    (media :pointer))

(defcfun (%media-get-can-seek "clutter_media_get_can_seek") gboolean
    (media :pointer))

(defcfun (%media-get-buffer-fill "clutter_media_get_buffer_fill") :double
    (media :pointer))

(defcfun (%media-get-duration "clutter_media_get_duration") :double
    (media :pointer))

(defcfun (%media-set-filename "clutter_media_set_filename") :void
    (media :pointer)
    (filename :string))

(defcfun (%rectangle-new "clutter_rectangle_new") (:pointer actor))

(defcfun (%rectangle-new-with-color "clutter_rectangle_new_with_color") (:pointer actor)
    (color (:pointer color)))

(defcfun (%rectangle-get-color "clutter_rectangle_get_color") :void
    (rectangle :pointer)
    (color (:pointer color)))

(defcfun (%rectangle-set-color "clutter_rectangle_set_color") :void
    (rectangle :pointer)
    (color (:pointer color)))

(defcfun (%rectangle-get-border-color "clutter_rectangle_get_border_color") :void
    (rectangle :pointer)
    (color (:pointer color)))

(defcfun (%rectangle-set-border-color "clutter_rectangle_set_border_color") :void
    (rectangle :pointer)
    (color (:pointer color)))

(defcfun (%rectangle-get-border-width "clutter_rectangle_get_border_width") guint
    (rectangle :pointer))

(defcfun (%rectangle-set-border-width "clutter_rectangle_set_border_width") :void
    (rectangle :pointer)
    (width guint))

(defcfun (%texture-new "clutter_texture_new") (:pointer actor))

(defcfun (%texture-new-from-file "clutter_texture_new_from_file") (:pointer actor)
    (filename :string)
    (error :pointer))

(defcfun (%texture-new-from-actor "clutter_texture_new_from_actor") (:pointer actor)
    (actor (:pointer actor)))

(defcfun (%texture-set-from-file "clutter_texture_set_from_file") gboolean
    (texture :pointer)
    (filename :string)
    (error :pointer))

(defcfun (%texture-set-from-rgb-data "clutter_texture_set_from_rgb_data") gboolean
    (texture :pointer)
    (data (:pointer guchar))
    (has-alpha gboolean)
    (width gint)
    (height gint)
    (rowstride gint)
    (bpp gint)
    (flags texture-flags-composite-enum)
    (error :pointer))

(defcfun (%texture-set-from-yuv-data "clutter_texture_set_from_yuv_data") gboolean
    (texture :pointer)
    (data (:pointer guchar))
    (width gint)
    (height gint)
    (flags texture-flags-composite-enum)
    (error :pointer))

(defcfun (%texture-set-area-from-rgb-data "clutter_texture_set_area_from_rgb_data") gboolean
    (texture :pointer)
    (data (:pointer guchar))
    (has-alpha gboolean)
    (x gint)
    (y gint)
    (width gint)
    (height gint)
    (rowstride gint)
    (bpp gint)
    (flags texture-flags-composite-enum)
    (error :pointer))

(defcfun (%texture-get-base-size "clutter_texture_get_base_size") :void
    (texture :pointer)
    (width (:pointer gint))
    (height (:pointer gint)))

(defcfun (%texture-get-pixel-format "clutter_texture_get_pixel_format") cogl-pixel-format
    (texture :pointer))

(defcfun (%texture-get-max-tile-waste "clutter_texture_get_max_tile_waste") gint
    (texture :pointer))

(defcfun (%texture-get-filter-quality "clutter_texture_get_filter_quality") texture-quality
    (texture :pointer))

(defcfun (%texture-set-filter-quality "clutter_texture_set_filter_quality") :void
    (texture :pointer)
    (filter-quality texture-quality))

(defcfun (%texture-get-cogl-texture "clutter_texture_get_cogl_texture") cogl-handle
    (texture :pointer))

(defcfun (%texture-set-cogl-texture "clutter_texture_set_cogl_texture") :void
    (texture :pointer)
    (cogl-tex cogl-handle))

(defcfun (%texture-get-cogl-material "clutter_texture_get_cogl_material") cogl-handle
    (texture :pointer))

(defcfun (%texture-set-cogl-material "clutter_texture_set_cogl_material") :void
    (texture :pointer)
    (cogl-material cogl-handle))

(defcfun (%texture-get-sync-size "clutter_texture_get_sync_size") gboolean
    (texture :pointer))

(defcfun (%texture-set-sync-size "clutter_texture_set_sync_size") :void
    (texture :pointer)
    (sync-size gboolean))

(defcfun (%texture-get-repeat "clutter_texture_get_repeat") :void
    (texture :pointer)
    (repeat-x (:pointer gboolean))
    (repeat-y (:pointer gboolean)))

(defcfun (%texture-set-repeat "clutter_texture_set_repeat") :void
    (texture :pointer)
    (repeat-x gboolean)
    (repeat-y gboolean))

(defcfun (%texture-get-keep-aspect-ratio "clutter_texture_get_keep_aspect_ratio") gboolean
    (texture :pointer))

(defcfun (%texture-set-keep-aspect-ratio "clutter_texture_set_keep_aspect_ratio") :void
    (texture :pointer)
    (keep-aspect gboolean))

(defcfun (%texture-get-load-async "clutter_texture_get_load_async") gboolean
    (texture :pointer))

(defcfun (%texture-set-load-async "clutter_texture_set_load_async") :void
    (texture :pointer)
    (load-async gboolean))

(defcfun (%texture-get-load-data-async "clutter_texture_get_load_data_async") gboolean
    (texture :pointer))

(defcfun (%texture-set-load-data-async "clutter_texture_set_load_data_async") :void
    (texture :pointer)
    (load-async gboolean))

(defcfun (%clone-new "clutter_clone_new") (:pointer actor)
    (source (:pointer actor)))

(defcfun (%clone-set-source "clutter_clone_set_source") :void
    (clone :pointer)
    (source (:pointer actor)))

(defcfun (%clone-get-source "clutter_clone_get_source") (:pointer actor)
    (clone :pointer))

(defcfun (%text-new "clutter_text_new") (:pointer actor))

(defcfun (%text-new-full "clutter_text_new_full") (:pointer actor)
    (font-name :string)
    (text :string)
    (color (:pointer color)))

(defcfun (%text-new-with-text "clutter_text_new_with_text") (:pointer actor)
    (font-name :string)
    (text :string))

(defcfun (%text-set-text "clutter_text_set_text") :void
    (self :pointer)
    (text :string))

(defcfun (%text-set-markup "clutter_text_set_markup") :void
    (self :pointer)
    (markup :string))

(defcfun (%text-get-text "clutter_text_get_text") :string
    (self :pointer))

(defcfun (%text-set-activatable "clutter_text_set_activatable") :void
    (self :pointer)
    (activatable gboolean))

(defcfun (%text-get-activatable "clutter_text_get_activatable") gboolean
    (self :pointer))

(defcfun (%text-set-attributes "clutter_text_set_attributes") :void
    (self :pointer)
    (attrs :pointer))

(defcfun (%text-get-attributes "clutter_text_get_attributes") :pointer
    (self :pointer))

(defcfun (%text-set-color "clutter_text_set_color") :void
    (self :pointer)
    (color (:pointer color)))

(defcfun (%text-get-color "clutter_text_get_color") :void
    (self :pointer)
    (color (:pointer color)))

(defcfun (%text-set-ellipsize "clutter_text_set_ellipsize") :void
    (self :pointer)
    (mode pango-ellipsize-mode))

(defcfun (%text-get-ellipsize "clutter_text_get_ellipsize") pango-ellipsize-mode
    (self :pointer))

(defcfun (%text-set-font-name "clutter_text_set_font_name") :void
    (self :pointer)
    (font-name :string))

(defcfun (%text-get-font-name "clutter_text_get_font_name") :string
    (self :pointer))

(defcfun (%text-set-password-char "clutter_text_set_password_char") :void
    (self :pointer)
    (wc gunichar))

(defcfun (%text-get-password-char "clutter_text_get_password_char") gunichar
    (self :pointer))

(defcfun (%text-set-justify "clutter_text_set_justify") :void
    (self :pointer)
    (justify gboolean))

(defcfun (%text-get-justify "clutter_text_get_justify") gboolean
    (self :pointer))

(defcfun (%text-get-layout "clutter_text_get_layout") :pointer
    (self :pointer))

(defcfun (%text-set-line-alignment "clutter_text_set_line_alignment") :void
    (self :pointer)
    (alignment pango-alignment))

(defcfun (%text-get-line-alignment "clutter_text_get_line_alignment") pango-alignment
    (self :pointer))

(defcfun (%text-set-line-wrap "clutter_text_set_line_wrap") :void
    (self :pointer)
    (line-wrap gboolean))

(defcfun (%text-get-line-wrap "clutter_text_get_line_wrap") gboolean
    (self :pointer))

(defcfun (%text-set-line-wrap-mode "clutter_text_set_line_wrap_mode") :void
    (self :pointer)
    (wrap-mode pango-wrap-mode))

(defcfun (%text-get-line-wrap-mode "clutter_text_get_line_wrap_mode") pango-wrap-mode
    (self :pointer))

(defcfun (%text-set-max-length "clutter_text_set_max_length") :void
    (self :pointer)
    (max gint))

(defcfun (%text-get-max-length "clutter_text_get_max_length") gint
    (self :pointer))

(defcfun (%text-set-selectable "clutter_text_set_selectable") :void
    (self :pointer)
    (selectable gboolean))

(defcfun (%text-get-selectable "clutter_text_get_selectable") gboolean
    (self :pointer))

(defcfun (%text-set-selection "clutter_text_set_selection") :void
    (self :pointer)
    (start-pos gssize)
    (end-pos gssize))

(defcfun (%text-get-selection "clutter_text_get_selection") :string
    (self :pointer))

(defcfun (%text-set-selection-bound "clutter_text_set_selection_bound") :void
    (self :pointer)
    (selection-bound gint))

(defcfun (%text-get-selection-bound "clutter_text_get_selection_bound") gint
    (self :pointer))

(defcfun (%text-set-single-line-mode "clutter_text_set_single_line_mode") :void
    (self :pointer)
    (single-line gboolean))

(defcfun (%text-get-single-line-mode "clutter_text_get_single_line_mode") gboolean
    (self :pointer))

(defcfun (%text-set-use-markup "clutter_text_set_use_markup") :void
    (self :pointer)
    (setting gboolean))

(defcfun (%text-get-use-markup "clutter_text_get_use_markup") gboolean
    (self :pointer))

(defcfun (%text-set-editable "clutter_text_set_editable") :void
    (self :pointer)
    (editable gboolean))

(defcfun (%text-get-editable "clutter_text_get_editable") gboolean
    (self :pointer))

(defcfun (%text-insert-text "clutter_text_insert_text") :void
    (self :pointer)
    (text :string)
    (position gssize))

(defcfun (%text-insert-unichar "clutter_text_insert_unichar") :void
    (self :pointer)
    (wc gunichar))

(defcfun (%text-delete-chars "clutter_text_delete_chars") :void
    (self :pointer)
    (n-chars guint))

(defcfun (%text-delete-text "clutter_text_delete_text") :void
    (self :pointer)
    (start-pos gssize)
    (end-pos gssize))

(defcfun (%text-delete-selection "clutter_text_delete_selection") gboolean
    (self :pointer))

(defcfun (%text-get-chars "clutter_text_get_chars") :string
    (self :pointer)
    (start-pos gssize)
    (end-pos gssize))

(defcfun (%text-set-cursor-color "clutter_text_set_cursor_color") :void
    (self :pointer)
    (color (:pointer color)))

(defcfun (%text-get-cursor-color "clutter_text_get_cursor_color") :void
    (self :pointer)
    (color (:pointer color)))

(defcfun (%text-set-selection-color "clutter_text_set_selection_color") :void
    (self :pointer)
    (color (:pointer color)))

(defcfun (%text-get-selection-color "clutter_text_get_selection_color") :void
    (self :pointer)
    (color (:pointer color)))

(defcfun (%text-set-cursor-position "clutter_text_set_cursor_position") :void
    (self :pointer)
    (position gint))

(defcfun (%text-get-cursor-position "clutter_text_get_cursor_position") gint
    (self :pointer))

(defcfun (%text-set-cursor-visible "clutter_text_set_cursor_visible") :void
    (self :pointer)
    (cursor-visible gboolean))

(defcfun (%text-get-cursor-visible "clutter_text_get_cursor_visible") gboolean
    (self :pointer))

(defcfun (%text-set-cursor-size "clutter_text_set_cursor_size") :void
    (self :pointer)
    (size gint))

(defcfun (%text-get-cursor-size "clutter_text_get_cursor_size") guint
    (self :pointer))

(defcfun (%text-activate "clutter_text_activate") gboolean
    (self :pointer))

(defcfun (%text-position-to-coords "clutter_text_position_to_coords") gboolean
    (self :pointer)
    (position gint)
    (x (:pointer :float))
    (y (:pointer :float))
    (line-height (:pointer :float)))

(defcfun (%cairo-texture-new "clutter_cairo_texture_new") (:pointer actor)
    (width guint)
    (height guint))

(defcfun (%cairo-texture-set-surface-size "clutter_cairo_texture_set_surface_size") :void
    (self :pointer)
    (width guint)
    (height guint))

(defcfun (%cairo-texture-get-surface-size "clutter_cairo_texture_get_surface_size") :void
    (self :pointer)
    (width (:pointer guint))
    (height (:pointer guint)))

(defcfun (%cairo-texture-create "clutter_cairo_texture_create") :pointer
    (self :pointer))

(defcfun (%cairo-texture-create-region "clutter_cairo_texture_create_region") :pointer
    (self :pointer)
    (x-offset gint)
    (y-offset gint)
    (width gint)
    (height gint))

(defcfun (%cairo-texture-clear "clutter_cairo_texture_clear") :void
    (self :pointer))

(defcfun (%cairo-set-source-color "clutter_cairo_set_source_color") :void
    (cr :pointer)
    (color (:pointer color)))

(defcfun (%group-new "clutter_group_new") (:pointer actor))

(defcfun (%group-remove-all "clutter_group_remove_all") :void
    (group :pointer))

(defcfun (%group-get-n-children "clutter_group_get_n_children") gint
    (self :pointer))

(defcfun (%group-get-nth-child "clutter_group_get_nth_child") (:pointer actor)
    (self :pointer)
    (index- gint))

(defcfun (%stage-get-default "clutter_stage_get_default") (:pointer actor))

(defcfun (%stage-new "clutter_stage_new") (:pointer actor))

(defcfun (%stage-is-default "clutter_stage_is_default") gboolean
    (stage :pointer))

(defcfun (%stage-set-color "clutter_stage_set_color") :void
    (stage :pointer)
    (color (:pointer color)))

(defcfun (%stage-get-color "clutter_stage_get_color") :void
    (stage :pointer)
    (color (:pointer color)))

(defcfun (%stage-set-fullscreen "clutter_stage_set_fullscreen") :void
    (stage :pointer)
    (fullscreen gboolean))

(defcfun (%stage-get-fullscreen "clutter_stage_get_fullscreen") gboolean
    (stage :pointer))

(defcfun (%stage-show-cursor "clutter_stage_show_cursor") :void
    (stage :pointer))

(defcfun (%stage-hide-cursor "clutter_stage_hide_cursor") :void
    (stage :pointer))

(defcfun (%stage-get-actor-at-pos "clutter_stage_get_actor_at_pos") (:pointer actor)
    (stage :pointer)
    (pick-mode pick-mode)
    (x gint)
    (y gint))

(defcfun (%stage-ensure-current "clutter_stage_ensure_current") :void
    (stage :pointer))

(defcfun (%stage-ensure-viewport "clutter_stage_ensure_viewport") :void
    (stage :pointer))

(defcfun (%stage-ensure-redraw "clutter_stage_ensure_redraw") :void
    (stage :pointer))

(defcfun (%stage-queue-redraw "clutter_stage_queue_redraw") :void
    (stage :pointer))

(defcfun (%stage-event "clutter_stage_event") gboolean
    (stage :pointer)
    (event :pointer))

(defcfun (%stage-set-key-focus "clutter_stage_set_key_focus") :void
    (stage :pointer)
    (actor (:pointer actor)))

(defcfun (%stage-get-key-focus "clutter_stage_get_key_focus") (:pointer actor)
    (stage :pointer))

(defcfun (%stage-read-pixels "clutter_stage_read_pixels") (:pointer guchar)
    (stage :pointer)
    (x gint)
    (y gint)
    (width gint)
    (height gint))

(defcfun (%stage-set-perspective "clutter_stage_set_perspective") :void
    (stage :pointer)
    (perspective (:pointer perspective)))

(defcfun (%stage-get-perspective "clutter_stage_get_perspective") :void
    (stage :pointer)
    (perspective (:pointer perspective)))

(defcfun (%stage-set-title "clutter_stage_set_title") :void
    (stage :pointer)
    (title :string))

(defcfun (%stage-get-title "clutter_stage_get_title") :string
    (stage :pointer))

(defcfun (%stage-set-user-resizable "clutter_stage_set_user_resizable") :void
    (stage :pointer)
    (resizable gboolean))

(defcfun (%stage-get-user-resizable "clutter_stage_get_user_resizable") gboolean
    (stage :pointer))

(defcfun (%stage-set-use-fog "clutter_stage_set_use_fog") :void
    (stage :pointer)
    (fog gboolean))

(defcfun (%stage-get-use-fog "clutter_stage_get_use_fog") gboolean
    (stage :pointer))

(defcfun (%stage-set-fog "clutter_stage_set_fog") :void
    (stage :pointer)
    (fog :pointer))

(defcfun (%stage-get-fog "clutter_stage_get_fog") :void
    (stage :pointer)
    (fog :pointer))

(defcfun (%timeline-new "clutter_timeline_new") :pointer
    (msecs guint))

(defcfun (%timeline-clone "clutter_timeline_clone") :pointer
    (timeline :pointer))

(defcfun (%timeline-set-duration "clutter_timeline_set_duration") :void
    (timeline :pointer)
    (msecs guint))

(defcfun (%timeline-get-duration "clutter_timeline_get_duration") guint
    (timeline :pointer))

(defcfun (%timeline-set-loop "clutter_timeline_set_loop") :void
    (timeline :pointer)
    (loop gboolean))

(defcfun (%timeline-get-loop "clutter_timeline_get_loop") gboolean
    (timeline :pointer))

(defcfun (%timeline-set-delay "clutter_timeline_set_delay") :void
    (timeline :pointer)
    (msecs guint))

(defcfun (%timeline-get-delay "clutter_timeline_get_delay") guint
    (timeline :pointer))

(defcfun (%timeline-set-direction "clutter_timeline_set_direction") :void
    (timeline :pointer)
    (direction timeline-direction))

(defcfun (%timeline-get-direction "clutter_timeline_get_direction") timeline-direction
    (timeline :pointer))

(defcfun (%timeline-start "clutter_timeline_start") :void
    (timeline :pointer))

(defcfun (%timeline-pause "clutter_timeline_pause") :void
    (timeline :pointer))

(defcfun (%timeline-stop "clutter_timeline_stop") :void
    (timeline :pointer))

(defcfun (%timeline-rewind "clutter_timeline_rewind") :void
    (timeline :pointer))

(defcfun (%timeline-skip "clutter_timeline_skip") :void
    (timeline :pointer)
    (msecs guint))

(defcfun (%timeline-advance "clutter_timeline_advance") :void
    (timeline :pointer)
    (msecs guint))

(defcfun (%timeline-get-elapsed-time "clutter_timeline_get_elapsed_time") guint
    (timeline :pointer))

(defcfun (%timeline-get-delta "clutter_timeline_get_delta") guint
    (timeline :pointer))

(defcfun (%timeline-get-progress "clutter_timeline_get_progress") :double
    (timeline :pointer))

(defcfun (%timeline-is-playing "clutter_timeline_is_playing") gboolean
    (timeline :pointer))

(defcfun (%timeline-add-marker-at-time "clutter_timeline_add_marker_at_time") :void
    (timeline :pointer)
    (marker-name :string)
    (msecs guint))

(defcfun (%timeline-has-marker "clutter_timeline_has_marker") gboolean
    (timeline :pointer)
    (marker-name :string))

(defcfun (%timeline-list-markers "clutter_timeline_list_markers") :pointer
    (timeline :pointer)
    (msecs gint)
    (n-markers (:pointer gsize)))

(defcfun (%timeline-remove-marker "clutter_timeline_remove_marker") :void
    (timeline :pointer)
    (marker-name :string))

(defcfun (%timeline-advance-to-marker "clutter_timeline_advance_to_marker") :void
    (timeline :pointer)
    (marker-name :string))

(defcfun (%score-new "clutter_score_new") :pointer)

(defcfun (%score-set-loop "clutter_score_set_loop") :void
    (score :pointer)
    (loop gboolean))

(defcfun (%score-get-loop "clutter_score_get_loop") gboolean
    (score :pointer))

(defcfun (%score-append "clutter_score_append") gulong
    (score :pointer)
    (parent :pointer)
    (timeline :pointer))

(defcfun (%score-append-at-marker "clutter_score_append_at_marker") gulong
    (score :pointer)
    (parent :pointer)
    (marker-name :string)
    (timeline :pointer))

(defcfun (%score-remove "clutter_score_remove") :void
    (score :pointer)
    (id gulong))

(defcfun (%score-remove-all "clutter_score_remove_all") :void
    (score :pointer))

(defcfun (%score-get-timeline "clutter_score_get_timeline") :pointer
    (score :pointer)
    (id gulong))

(defcfun (%score-list-timelines "clutter_score_list_timelines") :pointer
    (score :pointer))

(defcfun (%score-start "clutter_score_start") :void
    (score :pointer))

(defcfun (%score-pause "clutter_score_pause") :void
    (score :pointer))

(defcfun (%score-stop "clutter_score_stop") :void
    (score :pointer))

(defcfun (%score-is-playing "clutter_score_is_playing") gboolean
    (score :pointer))

(defcfun (%score-rewind "clutter_score_rewind") :void
    (score :pointer))

(defcfun (%alpha-new "clutter_alpha_new") :pointer)

(defcfun (%alpha-new-full "clutter_alpha_new_full") :pointer
    (timeline :pointer)
    (mode gulong))

(defcfun (%alpha-new-with-func "clutter_alpha_new_with_func") :pointer
    (timeline :pointer)
    (func function-pointer)
    (data :pointer)
    (destroy function-pointer))

(defcfun (%alpha-set-timeline "clutter_alpha_set_timeline") :void
    (alpha :pointer)
    (timeline :pointer))

(defcfun (%alpha-get-timeline "clutter_alpha_get_timeline") :pointer
    (alpha :pointer))

(defcfun (%alpha-set-mode "clutter_alpha_set_mode") :void
    (alpha :pointer)
    (mode gulong))

(defcfun (%alpha-get-mode "clutter_alpha_get_mode") gulong
    (alpha :pointer))

(defcfun (%alpha-get-alpha "clutter_alpha_get_alpha") :double
    (alpha :pointer))

(defcfun (%alpha-set-func "clutter_alpha_set_func") :void
    (alpha :pointer)
    (func function-pointer)
    (data :pointer)
    (destroy function-pointer))

(defcfun (%alpha-set-closure "clutter_alpha_set_closure") :void
    (alpha :pointer)
    (closure :pointer))

(defcfun (%alpha-register-closure "clutter_alpha_register_closure") gulong
    (closure :pointer))

(defcfun (%alpha-register-func "clutter_alpha_register_func") gulong
    (func function-pointer)
    (data :pointer))

(defcfun (%behaviour-apply "clutter_behaviour_apply") :void
    (behave :pointer)
    (actor (:pointer actor)))

(defcfun (%behaviour-remove "clutter_behaviour_remove") :void
    (behave :pointer)
    (actor (:pointer actor)))

(defcfun (%behaviour-remove-all "clutter_behaviour_remove_all") :void
    (behave :pointer))

(defcfun (%behaviour-is-applied "clutter_behaviour_is_applied") gboolean
    (behave :pointer)
    (actor (:pointer actor)))

(defcfun (%behaviour-actors-foreach "clutter_behaviour_actors_foreach") :void
    (behave :pointer)
    (func function-pointer)
    (data :pointer))

(defcfun (%behaviour-get-actors "clutter_behaviour_get_actors") :pointer
    (behave :pointer))

(defcfun (%behaviour-get-n-actors "clutter_behaviour_get_n_actors") gint
    (behave :pointer))

(defcfun (%behaviour-get-nth-actor "clutter_behaviour_get_nth_actor") (:pointer actor)
    (behave :pointer)
    (index- gint))

(defcfun (%behaviour-get-alpha "clutter_behaviour_get_alpha") :pointer
    (behave :pointer))

(defcfun (%behaviour-set-alpha "clutter_behaviour_set_alpha") :void
    (behave :pointer)
    (alpha :pointer))

(defcfun (%behaviour-depth-new "clutter_behaviour_depth_new") :pointer
    (alpha :pointer)
    (depth-start gint)
    (depth-end gint))

(defcfun (%behaviour-depth-set-bounds "clutter_behaviour_depth_set_bounds") :void
    (behaviour :pointer)
    (depth-start gint)
    (depth-end gint))

(defcfun (%behaviour-depth-get-bounds "clutter_behaviour_depth_get_bounds") :void
    (behaviour :pointer)
    (depth-start (:pointer gint))
    (depth-end (:pointer gint)))

(defcfun (%behaviour-ellipse-new "clutter_behaviour_ellipse_new") :pointer
    (alpha :pointer)
    (x gint)
    (y gint)
    (width gint)
    (height gint)
    (direction rotate-direction)
    (start :double)
    (end :double))

(defcfun (%behaviour-ellipse-set-center "clutter_behaviour_ellipse_set_center") :void
    (self :pointer)
    (x gint)
    (y gint))

(defcfun (%behaviour-ellipse-get-center "clutter_behaviour_ellipse_get_center") :void
    (self :pointer)
    (x (:pointer gint))
    (y (:pointer gint)))

(defcfun (%behaviour-ellipse-set-angle-start "clutter_behaviour_ellipse_set_angle_start") :void
    (self :pointer)
    (angle-start :double))

(defcfun (%behaviour-ellipse-get-angle-start "clutter_behaviour_ellipse_get_angle_start") :double
    (self :pointer))

(defcfun (%behaviour-ellipse-set-angle-end "clutter_behaviour_ellipse_set_angle_end") :void
    (self :pointer)
    (angle-end :double))

(defcfun (%behaviour-ellipse-get-angle-end "clutter_behaviour_ellipse_get_angle_end") :double
    (self :pointer))

(defcfun (%behaviour-ellipse-set-angle-tilt "clutter_behaviour_ellipse_set_angle_tilt") :void
    (self :pointer)
    (axis rotate-axis)
    (angle-tilt :double))

(defcfun (%behaviour-ellipse-get-angle-tilt "clutter_behaviour_ellipse_get_angle_tilt") :double
    (self :pointer)
    (axis rotate-axis))

(defcfun (%behaviour-ellipse-set-height "clutter_behaviour_ellipse_set_height") :void
    (self :pointer)
    (height gint))

(defcfun (%behaviour-ellipse-get-height "clutter_behaviour_ellipse_get_height") gint
    (self :pointer))

(defcfun (%behaviour-ellipse-set-width "clutter_behaviour_ellipse_set_width") :void
    (self :pointer)
    (width gint))

(defcfun (%behaviour-ellipse-get-width "clutter_behaviour_ellipse_get_width") gint
    (self :pointer))

(defcfun (%behaviour-ellipse-set-tilt "clutter_behaviour_ellipse_set_tilt") :void
    (self :pointer)
    (angle-tilt-x :double)
    (angle-tilt-y :double)
    (angle-tilt-z :double))

(defcfun (%behaviour-ellipse-get-tilt "clutter_behaviour_ellipse_get_tilt") :void
    (self :pointer)
    (angle-tilt-x (:pointer :double))
    (angle-tilt-y (:pointer :double))
    (angle-tilt-z (:pointer :double)))

(defcfun (%behaviour-ellipse-set-direction "clutter_behaviour_ellipse_set_direction") :void
    (self :pointer)
    (direction rotate-direction))

(defcfun (%behaviour-ellipse-get-direction "clutter_behaviour_ellipse_get_direction") rotate-direction
    (self :pointer))

(defcfun (%behaviour-opacity-new "clutter_behaviour_opacity_new") :pointer
    (alpha :pointer)
    (opacity-start guint8)
    (opacity-end guint8))

(defcfun (%behaviour-opacity-set-bounds "clutter_behaviour_opacity_set_bounds") :void
    (behaviour :pointer)
    (opacity-start guint8)
    (opacity-end guint8))

(defcfun (%behaviour-opacity-get-bounds "clutter_behaviour_opacity_get_bounds") :void
    (behaviour :pointer)
    (opacity-start (:pointer guint8))
    (opacity-end (:pointer guint8)))

(defcfun (%behaviour-path-new "clutter_behaviour_path_new") :pointer
    (alpha :pointer)
    (path :pointer))

(defcfun (%behaviour-path-new-with-description "clutter_behaviour_path_new_with_description") :pointer
    (alpha :pointer)
    (desc :string))

(defcfun (%behaviour-path-new-with-knots "clutter_behaviour_path_new_with_knots") :pointer
    (alpha :pointer)
    (knots (:pointer knot))
    (n-knots guint))

(defcfun (%behaviour-path-set-path "clutter_behaviour_path_set_path") :void
    (pathb :pointer)
    (path :pointer))

(defcfun (%behaviour-path-get-path "clutter_behaviour_path_get_path") :pointer
    (pathb :pointer))

(defcfun (%knot-copy "clutter_knot_copy") (:pointer knot)
    (knot (:pointer knot)))

(defcfun (%knot-free "clutter_knot_free") :void
    (knot (:pointer knot)))

(defcfun (%knot-equal "clutter_knot_equal") gboolean
    (knot-a (:pointer knot))
    (knot-b (:pointer knot)))

(defcfun (%path-new "clutter_path_new") :pointer)

(defcfun (%path-new-with-description "clutter_path_new_with_description") :pointer
    (desc :string))

(defcfun (%path-add-move-to "clutter_path_add_move_to") :void
    (path :pointer)
    (x gint)
    (y gint))

(defcfun (%path-add-rel-move-to "clutter_path_add_rel_move_to") :void
    (path :pointer)
    (x gint)
    (y gint))

(defcfun (%path-add-line-to "clutter_path_add_line_to") :void
    (path :pointer)
    (x gint)
    (y gint))

(defcfun (%path-add-rel-line-to "clutter_path_add_rel_line_to") :void
    (path :pointer)
    (x gint)
    (y gint))

(defcfun (%path-add-curve-to "clutter_path_add_curve_to") :void
    (path :pointer)
    (x-1 gint)
    (y-1 gint)
    (x-2 gint)
    (y-2 gint)
    (x-3 gint)
    (y-3 gint))

(defcfun (%path-add-rel-curve-to "clutter_path_add_rel_curve_to") :void
    (path :pointer)
    (x-1 gint)
    (y-1 gint)
    (x-2 gint)
    (y-2 gint)
    (x-3 gint)
    (y-3 gint))

(defcfun (%path-add-close "clutter_path_add_close") :void
    (path :pointer))

(defcfun (%path-add-string "clutter_path_add_string") gboolean
    (path :pointer)
    (str :string))

(defcfun (%path-add-node "clutter_path_add_node") :void
    (path :pointer)
    (node :pointer))

(defcfun (%path-add-cairo-path "clutter_path_add_cairo_path") :void
    (path :pointer)
    (cpath :pointer))

(defcfun (%path-get-n-nodes "clutter_path_get_n_nodes") guint
    (path :pointer))

(defcfun (%path-get-node "clutter_path_get_node") :void
    (path :pointer)
    (index- guint)
    (node :pointer))

(defcfun (%path-get-nodes "clutter_path_get_nodes") :pointer
    (path :pointer))

(defcfun (%path-foreach "clutter_path_foreach") :void
    (path :pointer)
    (callback function-pointer)
    (user-data :pointer))

(defcfun (%path-insert-node "clutter_path_insert_node") :void
    (path :pointer)
    (index- gint)
    (node :pointer))

(defcfun (%path-remove-node "clutter_path_remove_node") :void
    (path :pointer)
    (index- guint))

(defcfun (%path-replace-node "clutter_path_replace_node") :void
    (path :pointer)
    (index- guint)
    (node :pointer))

(defcfun (%path-get-description "clutter_path_get_description") :string
    (path :pointer))

(defcfun (%path-set-description "clutter_path_set_description") gboolean
    (path :pointer)
    (str :string))

(defcfun (%path-to-cairo-path "clutter_path_to_cairo_path") :void
    (path :pointer)
    (cr :pointer))

(defcfun (%path-clear "clutter_path_clear") :void
    (path :pointer))

(defcfun (%path-get-position "clutter_path_get_position") guint
    (path :pointer)
    (progress :double)
    (position (:pointer knot)))

(defcfun (%path-get-length "clutter_path_get_length") guint
    (path :pointer))

(defcfun (%path-node-copy "clutter_path_node_copy") :pointer
    (node :pointer))

(defcfun (%path-node-free "clutter_path_node_free") :void
    (node :pointer))

(defcfun (%path-node-equal "clutter_path_node_equal") gboolean
    (node-a :pointer)
    (node-b :pointer))

(defcfun (%behaviour-rotate-new "clutter_behaviour_rotate_new") :pointer
    (alpha :pointer)
    (axis rotate-axis)
    (direction rotate-direction)
    (angle-start :double)
    (angle-end :double))

(defcfun (%behaviour-rotate-set-axis "clutter_behaviour_rotate_set_axis") :void
    (rotate :pointer)
    (axis rotate-axis))

(defcfun (%behaviour-rotate-get-axis "clutter_behaviour_rotate_get_axis") rotate-axis
    (rotate :pointer))

(defcfun (%behaviour-rotate-set-direction "clutter_behaviour_rotate_set_direction") :void
    (rotate :pointer)
    (direction rotate-direction))

(defcfun (%behaviour-rotate-get-direction "clutter_behaviour_rotate_get_direction") rotate-direction
    (rotate :pointer))

(defcfun (%behaviour-rotate-set-bounds "clutter_behaviour_rotate_set_bounds") :void
    (rotate :pointer)
    (angle-start :double)
    (angle-end :double))

(defcfun (%behaviour-rotate-get-bounds "clutter_behaviour_rotate_get_bounds") :void
    (rotate :pointer)
    (angle-start (:pointer :double))
    (angle-end (:pointer :double)))

(defcfun (%behaviour-rotate-set-center "clutter_behaviour_rotate_set_center") :void
    (rotate :pointer)
    (x gint)
    (y gint)
    (z gint))

(defcfun (%behaviour-rotate-get-center "clutter_behaviour_rotate_get_center") :void
    (rotate :pointer)
    (x (:pointer gint))
    (y (:pointer gint))
    (z (:pointer gint)))

(defcfun (%behaviour-scale-new "clutter_behaviour_scale_new") :pointer
    (alpha :pointer)
    (x-scale-start :double)
    (y-scale-start :double)
    (x-scale-end :double)
    (y-scale-end :double))

(defcfun (%behaviour-scale-set-bounds "clutter_behaviour_scale_set_bounds") :void
    (scale :pointer)
    (x-scale-start :double)
    (y-scale-start :double)
    (x-scale-end :double)
    (y-scale-end :double))

(defcfun (%behaviour-scale-get-bounds "clutter_behaviour_scale_get_bounds") :void
    (scale :pointer)
    (x-scale-start (:pointer :double))
    (y-scale-start (:pointer :double))
    (x-scale-end (:pointer :double))
    (y-scale-end (:pointer :double)))

(defcfun (%interval-new-with-values "clutter_interval_new_with_values") :pointer
    (gtype g-type)
    (initial (:pointer g-value))
    (final (:pointer g-value)))

(defcfun (%interval-clone "clutter_interval_clone") :pointer
    (interval :pointer))

(defcfun (%interval-get-value-type "clutter_interval_get_value_type") g-type
    (interval :pointer))

(defcfun (%interval-set-initial-value "clutter_interval_set_initial_value") :void
    (interval :pointer)
    (value (:pointer g-value)))

(defcfun (%interval-get-initial-value "clutter_interval_get_initial_value") :void
    (interval :pointer)
    (value (:pointer g-value)))

(defcfun (%interval-peek-initial-value "clutter_interval_peek_initial_value") (:pointer g-value)
    (interval :pointer))

(defcfun (%interval-set-final-value "clutter_interval_set_final_value") :void
    (interval :pointer)
    (value (:pointer g-value)))

(defcfun (%interval-get-final-value "clutter_interval_get_final_value") :void
    (interval :pointer)
    (value (:pointer g-value)))

(defcfun (%interval-peek-final-value "clutter_interval_peek_final_value") (:pointer g-value)
    (interval :pointer))

(defcfun (%interval-compute-value "clutter_interval_compute_value") gboolean
    (interval :pointer)
    (factor :double)
    (value (:pointer g-value)))

(defcfun (%interval-validate "clutter_interval_validate") gboolean
    (interval :pointer)
    (pspec (:pointer g-param-spec)))

(defcfun (%interval-register-progress-func "clutter_interval_register_progress_func") :void
    (value-type g-type)
    (func function-pointer))

(defcfun (%animation-new "clutter_animation_new") :pointer)

(defcfun (%animation-set-object "clutter_animation_set_object") :void
    (animation :pointer)
    (object (:pointer g-object)))

(defcfun (%animation-get-object "clutter_animation_get_object") (:pointer g-object)
    (animation :pointer))

(defcfun (%animation-set-mode "clutter_animation_set_mode") :void
    (animation :pointer)
    (mode gulong))

(defcfun (%animation-get-mode "clutter_animation_get_mode") gulong
    (animation :pointer))

(defcfun (%animation-set-duration "clutter_animation_set_duration") :void
    (animation :pointer)
    (msecs gint))

(defcfun (%animation-get-duration "clutter_animation_get_duration") guint
    (animation :pointer))

(defcfun (%animation-set-loop "clutter_animation_set_loop") :void
    (animation :pointer)
    (loop gboolean))

(defcfun (%animation-get-loop "clutter_animation_get_loop") gboolean
    (animation :pointer))

(defcfun (%animation-set-timeline "clutter_animation_set_timeline") :void
    (animation :pointer)
    (timeline :pointer))

(defcfun (%animation-get-timeline "clutter_animation_get_timeline") :pointer
    (animation :pointer))

(defcfun (%animation-set-alpha "clutter_animation_set_alpha") :void
    (animation :pointer)
    (alpha :pointer))

(defcfun (%animation-get-alpha "clutter_animation_get_alpha") :pointer
    (animation :pointer))

(defcfun (%animation-completed "clutter_animation_completed") :void
    (animation :pointer))

(defcfun (%animation-bind "clutter_animation_bind") :pointer
    (animation :pointer)
    (property-name :string)
    (final (:pointer g-value)))

(defcfun (%animation-bind-interval "clutter_animation_bind_interval") :pointer
    (animation :pointer)
    (property-name :string)
    (interval :pointer))

(defcfun (%animation-update-interval "clutter_animation_update_interval") :void
    (animation :pointer)
    (property-name :string)
    (interval :pointer))

(defcfun (%animation-has-property "clutter_animation_has_property") gboolean
    (animation :pointer)
    (property-name :string))

(defcfun (%animation-unbind-property "clutter_animation_unbind_property") :void
    (animation :pointer)
    (property-name :string))

(defcfun (%animation-get-interval "clutter_animation_get_interval") :pointer
    (animation :pointer)
    (property-name :string))

(defcfun (%actor-animatev "clutter_actor_animatev") :pointer
    (actor (:pointer actor))
    (mode gulong)
    (duration guint)
    (n-properties gint)
    (properties :pointer)
    (values (:pointer g-value)))

(defcfun (%actor-animate-with-timelinev "clutter_actor_animate_with_timelinev") :pointer
    (actor (:pointer actor))
    (mode gulong)
    (timeline :pointer)
    (n-properties gint)
    (properties :pointer)
    (values (:pointer g-value)))

(defcfun (%actor-animate-with-alphav "clutter_actor_animate_with_alphav") :pointer
    (actor (:pointer actor))
    (alpha :pointer)
    (n-properties gint)
    (properties :pointer)
    (values (:pointer g-value)))

(defcfun (%actor-get-animation "clutter_actor_get_animation") :pointer
    (actor (:pointer actor)))

(defcfun (%animatable-animate-property "clutter_animatable_animate_property") gboolean
    (animatable :pointer)
    (animation :pointer)
    (property-name :string)
    (initial-value (:pointer g-value))
    (final-value (:pointer g-value))
    (progress :double)
    (value (:pointer g-value)))

(defcfun (%color-new "clutter_color_new") (:pointer color)
    (red guint8)
    (green guint8)
    (blue guint8)
    (alpha guint8))

(defcfun (%color-copy "clutter_color_copy") (:pointer color)
    (color (:pointer color)))

(defcfun (%color-free "clutter_color_free") :void
    (color (:pointer color)))

(defcfun (%color-equal "clutter_color_equal") gboolean
    (v1 :pointer)
    (v2 :pointer))

(defcfun (%color-hash "clutter_color_hash") guint
    (v :pointer))

(defcfun (%color-from-string "clutter_color_from_string") gboolean
    (color (:pointer color))
    (str :string))

(defcfun (%color-to-string "clutter_color_to_string") :string
    (color (:pointer color)))

(defcfun (%color-from-hls "clutter_color_from_hls") :void
    (color (:pointer color))
    (hue :float)
    (luminance :float)
    (saturation :float))

(defcfun (%color-to-hls "clutter_color_to_hls") :void
    (color (:pointer color))
    (hue (:pointer :float))
    (luminance (:pointer :float))
    (saturation (:pointer :float)))

(defcfun (%color-from-pixel "clutter_color_from_pixel") :void
    (color (:pointer color))
    (pixel guint32))

(defcfun (%color-to-pixel "clutter_color_to_pixel") guint32
    (color (:pointer color)))

(defcfun (%color-add "clutter_color_add") :void
    (a (:pointer color))
    (b (:pointer color))
    (result (:pointer color)))

(defcfun (%color-subtract "clutter_color_subtract") :void
    (a (:pointer color))
    (b (:pointer color))
    (result (:pointer color)))

(defcfun (%color-lighten "clutter_color_lighten") :void
    (color (:pointer color))
    (result (:pointer color)))

(defcfun (%color-darken "clutter_color_darken") :void
    (color (:pointer color))
    (result (:pointer color)))

(defcfun (%color-shade "clutter_color_shade") :void
    (color (:pointer color))
    (factor :double)
    (result (:pointer color)))

(defcfun (%param-spec-color "clutter_param_spec_color") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (default-value (:pointer color))
    (flags g-param-flags-composite-enum))

(defcfun (%value-set-color "clutter_value_set_color") :void
    (value (:pointer g-value))
    (color (:pointer color)))

(defcfun (%value-get-color "clutter_value_get_color") (:pointer color)
    (value (:pointer g-value)))

(defcfun (%binding-pool-new "clutter_binding_pool_new") :pointer
    (name :string))

(defcfun (%binding-pool-get-for-class "clutter_binding_pool_get_for_class") :pointer
    (klass :pointer))

(defcfun (%binding-pool-find "clutter_binding_pool_find") :pointer
    (name :string))

(defcfun (%binding-pool-install-action "clutter_binding_pool_install_action") :void
    (pool :pointer)
    (action-name :string)
    (key-val guint)
    (modifiers modifier-type-composite-enum)
    (callback function-pointer)
    (data :pointer)
    (notify function-pointer))

(defcfun (%binding-pool-install-closure "clutter_binding_pool_install_closure") :void
    (pool :pointer)
    (action-name :string)
    (key-val guint)
    (modifiers modifier-type-composite-enum)
    (closure :pointer))

(defcfun (%binding-pool-override-action "clutter_binding_pool_override_action") :void
    (pool :pointer)
    (key-val guint)
    (modifiers modifier-type-composite-enum)
    (callback function-pointer)
    (data :pointer)
    (notify function-pointer))

(defcfun (%binding-pool-override-closure "clutter_binding_pool_override_closure") :void
    (pool :pointer)
    (key-val guint)
    (modifiers modifier-type-composite-enum)
    (closure :pointer))

(defcfun (%binding-pool-find-action "clutter_binding_pool_find_action") :string
    (pool :pointer)
    (key-val guint)
    (modifiers modifier-type-composite-enum))

(defcfun (%binding-pool-remove-action "clutter_binding_pool_remove_action") :void
    (pool :pointer)
    (key-val guint)
    (modifiers modifier-type-composite-enum))

(defcfun (%binding-pool-block-action "clutter_binding_pool_block_action") :void
    (pool :pointer)
    (action-name :string))

(defcfun (%binding-pool-unblock-action "clutter_binding_pool_unblock_action") :void
    (pool :pointer)
    (action-name :string))

(defcfun (%binding-pool-activate "clutter_binding_pool_activate") gboolean
    (pool :pointer)
    (key-val guint)
    (modifiers modifier-type-composite-enum)
    (gobject (:pointer g-object)))

(defcfun (%event-new "clutter_event_new") :pointer
    (type event-type))

(defcfun (%event-copy "clutter_event_copy") :pointer
    (event :pointer))

(defcfun (%event-free "clutter_event_free") :void
    (event :pointer))

(defcfun (%event-type "clutter_event_type") event-type
    (event :pointer))

(defcfun (%event-get-coords "clutter_event_get_coords") :void
    (event :pointer)
    (x (:pointer :float))
    (y (:pointer :float)))

(defcfun (%event-get-state "clutter_event_get_state") modifier-type-composite-enum
    (event :pointer))

(defcfun (%event-get-time "clutter_event_get_time") guint32
    (event :pointer))

(defcfun (%event-get-source "clutter_event_get_source") (:pointer actor)
    (event :pointer))

(defcfun (%event-get-stage "clutter_event_get_stage") :pointer
    (event :pointer))

(defcfun (%event-get-flags "clutter_event_get_flags") event-flags-composite-enum
    (event :pointer))

(defcfun (%event-get "clutter_event_get") :pointer)

(defcfun (%event-peek "clutter_event_peek") :pointer)

(defcfun (%event-put "clutter_event_put") :void
    (event :pointer))

(defcfun (%events-pending "clutter_events_pending") gboolean)

(defcfun (%event-get-button "clutter_event_get_button") guint32
    (event :pointer))

(defcfun (%event-get-click-count "clutter_event_get_click_count") guint
    (event :pointer))

(defcfun (%event-get-key-symbol "clutter_event_get_key_symbol") guint
    (event :pointer))

(defcfun (%event-get-key-code "clutter_event_get_key_code") guint16
    (event :pointer))

(defcfun (%event-get-key-unicode "clutter_event_get_key_unicode") guint32
    (event :pointer))

(defcfun (%keysym-to-unicode "clutter_keysym_to_unicode") guint32
    (keyval guint))

(defcfun (%event-get-related "clutter_event_get_related") (:pointer actor)
    (event :pointer))

(defcfun (%event-get-scroll-direction "clutter_event_get_scroll_direction") scroll-direction
    (event :pointer))

(defcfun (%event-get-device "clutter_event_get_device") :pointer
    (event :pointer))

(defcfun (%event-get-device-id "clutter_event_get_device_id") gint
    (event :pointer))

(defcfun (%event-get-device-type "clutter_event_get_device_type") input-device-type
    (event :pointer))

(defcfun (%get-input-device-for-id "clutter_get_input_device_for_id") :pointer
    (id gint))

(defcfun (%input-device-get-device-id "clutter_input_device_get_device_id") gint
    (device :pointer))

(defcfun (%input-device-get-device-type "clutter_input_device_get_device_type") input-device-type
    (device :pointer))

(defcfun (%get-current-event-time "clutter_get_current_event_time") guint32)

(defcfun (%init "clutter_init") init-error
    (argc (:pointer :int))
    (argv :pointer))

(defcfun (%init-with-args "clutter_init_with_args") init-error
    (argc (:pointer :int))
    (argv :pointer)
    (parameter-string :string)
    (entries :pointer)
    (translation-domain :string)
    (error :pointer))

(defcfun (%get-option-group "clutter_get_option_group") :pointer)

(defcfun (%get-option-group-without-init "clutter_get_option_group_without_init") :pointer)

(defcfun (%main "clutter_main") :void)

(defcfun (%main-quit "clutter_main_quit") :void)

(defcfun (%main-level "clutter_main_level") gint)

(defcfun (%get-debug-enabled "clutter_get_debug_enabled") gboolean)

(defcfun (%get-show-fps "clutter_get_show_fps") gboolean)

(defcfun (%get-timestamp "clutter_get_timestamp") gulong)

(defcfun (%get-actor-by-gid "clutter_get_actor_by_gid") (:pointer actor)
    (id guint32))

(defcfun (%set-default-frame-rate "clutter_set_default_frame_rate") :void
    (frames-per-sec guint))

(defcfun (%get-default-frame-rate "clutter_get_default_frame_rate") guint)

(defcfun (%set-motion-events-enabled "clutter_set_motion_events_enabled") :void
    (enable gboolean))

(defcfun (%get-motion-events-enabled "clutter_get_motion_events_enabled") gboolean)

(defcfun (%clear-glyph-cache "clutter_clear_glyph_cache") :void)

(defcfun (%set-font-flags "clutter_set_font_flags") :void
    (flags font-flags-composite-enum))

(defcfun (%get-font-flags "clutter_get_font_flags") font-flags-composite-enum)

(defcfun (%get-font-map "clutter_get_font_map") :pointer)

(defcfun (%threads-set-lock-functions "clutter_threads_set_lock_functions") :void
    (enter-fn function-pointer)
    (leave-fn function-pointer))

(defcfun (%threads-init "clutter_threads_init") :void)

(defcfun (%threads-enter "clutter_threads_enter") :void)

(defcfun (%threads-leave "clutter_threads_leave") :void)

(defcfun (%threads-add-idle "clutter_threads_add_idle") guint
    (func function-pointer)
    (data :pointer))

(defcfun (%threads-add-idle-full "clutter_threads_add_idle_full") guint
    (priority gint)
    (func function-pointer)
    (data :pointer)
    (notify function-pointer))

(defcfun (%threads-add-timeout "clutter_threads_add_timeout") guint
    (interval guint)
    (func function-pointer)
    (data :pointer))

(defcfun (%threads-add-timeout-full "clutter_threads_add_timeout_full") guint
    (priority gint)
    (interval guint)
    (func function-pointer)
    (data :pointer)
    (notify function-pointer))

(defcfun (%threads-add-frame-source "clutter_threads_add_frame_source") guint
    (fps guint)
    (func function-pointer)
    (data :pointer))

(defcfun (%threads-add-frame-source-full "clutter_threads_add_frame_source_full") guint
    (priority gint)
    (fps guint)
    (func function-pointer)
    (data :pointer)
    (notify function-pointer))

(defcfun (%threads-add-repaint-func "clutter_threads_add_repaint_func") guint
    (func function-pointer)
    (data :pointer)
    (notify function-pointer))

(defcfun (%threads-remove-repaint-func "clutter_threads_remove_repaint_func") :void
    (handle-id guint))

(defcfun (%get-keyboard-grab "clutter_get_keyboard_grab") (:pointer actor))

(defcfun (%get-pointer-grab "clutter_get_pointer_grab") (:pointer actor))

(defcfun (%grab-keyboard "clutter_grab_keyboard") :void
    (actor (:pointer actor)))

(defcfun (%grab-pointer "clutter_grab_pointer") :void
    (actor (:pointer actor)))

(defcfun (%ungrab-keyboard "clutter_ungrab_keyboard") :void)

(defcfun (%ungrab-pointer "clutter_ungrab_pointer") :void)

(defcfun (%grab-pointer-for-device "clutter_grab_pointer_for_device") :void
    (actor (:pointer actor))
    (id gint))

(defcfun (%ungrab-pointer-for-device "clutter_ungrab_pointer_for_device") :void
    (id gint))

(defcfun (%do-event "clutter_do_event") :void
    (event :pointer))

(defcfun (%shader-new "clutter_shader_new") :pointer)

(defcfun (%shader-set-vertex-source "clutter_shader_set_vertex_source") :void
    (shader :pointer)
    (data :string)
    (length gssize))

(defcfun (%shader-get-vertex-source "clutter_shader_get_vertex_source") :string
    (shader :pointer))

(defcfun (%shader-set-fragment-source "clutter_shader_set_fragment_source") :void
    (shader :pointer)
    (data :string)
    (length gssize))

(defcfun (%shader-get-fragment-source "clutter_shader_get_fragment_source") :string
    (shader :pointer))

(defcfun (%shader-compile "clutter_shader_compile") gboolean
    (shader :pointer)
    (error :pointer))

(defcfun (%shader-release "clutter_shader_release") :void
    (shader :pointer))

(defcfun (%shader-is-compiled "clutter_shader_is_compiled") gboolean
    (shader :pointer))

(defcfun (%shader-set-is-enabled "clutter_shader_set_is_enabled") :void
    (shader :pointer)
    (enabled gboolean))

(defcfun (%shader-get-is-enabled "clutter_shader_get_is_enabled") gboolean
    (shader :pointer))

(defcfun (%shader-set-uniform "clutter_shader_set_uniform") :void
    (shader :pointer)
    (name :string)
    (value (:pointer g-value)))

(defcfun (%shader-get-cogl-program "clutter_shader_get_cogl_program") cogl-handle
    (shader :pointer))

(defcfun (%shader-get-cogl-fragment-shader "clutter_shader_get_cogl_fragment_shader") cogl-handle
    (shader :pointer))

(defcfun (%shader-get-cogl-vertex-shader "clutter_shader_get_cogl_vertex_shader") cogl-handle
    (shader :pointer))

(defcfun (%value-set-shader-float "clutter_value_set_shader_float") :void
    (value (:pointer g-value))
    (size gint)
    (floats (:pointer :float)))

(defcfun (%value-get-shader-float "clutter_value_get_shader_float") (:pointer :float)
    (value (:pointer g-value))
    (length (:pointer gsize)))

(defcfun (%value-set-shader-int "clutter_value_set_shader_int") :void
    (value (:pointer g-value))
    (size gint)
    (ints (:pointer gint)))

(defcfun (%value-get-shader-int "clutter_value_get_shader_int") (:pointer gint)
    (value (:pointer g-value))
    (length (:pointer gsize)))

(defcfun (%value-set-shader-matrix "clutter_value_set_shader_matrix") :void
    (value (:pointer g-value))
    (size gint)
    (matrix (:pointer :float)))

(defcfun (%value-get-shader-matrix "clutter_value_get_shader_matrix") (:pointer :float)
    (value (:pointer g-value))
    (length (:pointer gsize)))

(defcfun (%units-mm "clutter_units_mm") :void
    (units :pointer)
    (mm :float))

(defcfun (%units-pt "clutter_units_pt") :void
    (units :pointer)
    (pt :float))

(defcfun (%units-em "clutter_units_em") :void
    (units :pointer)
    (em :float))

(defcfun (%units-em-for-font "clutter_units_em_for_font") :void
    (units :pointer)
    (font-name :string)
    (em :float))

(defcfun (%units-pixels "clutter_units_pixels") :void
    (units :pointer)
    (px gint))

(defcfun (%units-to-pixels "clutter_units_to_pixels") :float
    (units :pointer))

(defcfun (%units-copy "clutter_units_copy") :pointer
    (units :pointer))

(defcfun (%units-free "clutter_units_free") :void
    (units :pointer))

(defcfun (%units-get-unit-type "clutter_units_get_unit_type") unit-type
    (units :pointer))

(defcfun (%units-get-unit-value "clutter_units_get_unit_value") :float
    (units :pointer))

(defcfun (%units-from-string "clutter_units_from_string") gboolean
    (units :pointer)
    (str :string))

(defcfun (%units-to-string "clutter_units_to_string") :string
    (units :pointer))

(defcfun (%param-spec-units "clutter_param_spec_units") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (default-type unit-type)
    (minimum :float)
    (maximum :float)
    (default-value :float)
    (flags g-param-flags-composite-enum))

(defcfun (%value-set-units "clutter_value_set_units") :void
    (value (:pointer g-value))
    (units :pointer))

(defcfun (%value-get-units "clutter_value_get_units") :pointer
    (value (:pointer g-value)))

(defcfun (%util-next-p2 "clutter_util_next_p2") :int
    (a :int))

(defcfun (%timeout-pool-new "clutter_timeout_pool_new") :pointer
    (priority gint))

(defcfun (%timeout-pool-add "clutter_timeout_pool_add") guint
    (pool :pointer)
    (fps guint)
    (func function-pointer)
    (data :pointer)
    (notify function-pointer))

(defcfun (%timeout-pool-remove "clutter_timeout_pool_remove") :void
    (pool :pointer)
    (id guint))

(defcfun (%frame-source-add "clutter_frame_source_add") guint
    (fps guint)
    (func function-pointer)
    (data :pointer))

(defcfun (%frame-source-add-full "clutter_frame_source_add_full") guint
    (priority gint)
    (fps guint)
    (func function-pointer)
    (data :pointer)
    (notify function-pointer))

(defcfun (%param-spec-fixed "clutter_param_spec_fixed") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (minimum cogl-fixed)
    (maximum cogl-fixed)
    (default-value cogl-fixed)
    (flags g-param-flags-composite-enum))

(defcfun (%value-set-fixed "clutter_value_set_fixed") :void
    (value (:pointer g-value))
    (fixed- cogl-fixed))

(defcfun (%value-get-fixed "clutter_value_get_fixed") cogl-fixed
    (value (:pointer g-value)))

(defcfun (%script-new "clutter_script_new") :pointer)

(defcfun (%script-load-from-data "clutter_script_load_from_data") guint
    (script :pointer)
    (data :string)
    (length gssize)
    (error :pointer))

(defcfun (%script-load-from-file "clutter_script_load_from_file") guint
    (script :pointer)
    (filename :string)
    (error :pointer))

(defcfun (%script-add-search-paths "clutter_script_add_search_paths") :void
    (script :pointer)
    (paths :pointer)
    (n-paths gsize))

(defcfun (%script-lookup-filename "clutter_script_lookup_filename") :string
    (script :pointer)
    (filename :string))

(defcfun (%script-get-object "clutter_script_get_object") (:pointer g-object)
    (script :pointer)
    (name :string))

(defcfun (%script-unmerge-objects "clutter_script_unmerge_objects") :void
    (script :pointer)
    (merge-id guint))

(defcfun (%script-ensure-objects "clutter_script_ensure_objects") :void
    (script :pointer))

(defcfun (%script-list-objects "clutter_script_list_objects") :pointer
    (script :pointer))

(defcfun (%script-connect-signals "clutter_script_connect_signals") :void
    (script :pointer)
    (user-data :pointer))

(defcfun (%script-connect-signals-full "clutter_script_connect_signals_full") :void
    (script :pointer)
    (func function-pointer)
    (user-data :pointer))

(defcfun (%script-get-type-from-name "clutter_script_get_type_from_name") g-type
    (script :pointer)
    (type-name :string))

(defcfun (%get-script-id "clutter_get_script_id") :string
    (gobject (:pointer g-object)))

(defcfun (%scriptable-set-id "clutter_scriptable_set_id") :void
    (scriptable :pointer)
    (id :string))

(defcfun (%scriptable-get-id "clutter_scriptable_get_id") :string
    (scriptable :pointer))

(defcfun (%scriptable-parse-custom-node "clutter_scriptable_parse_custom_node") gboolean
    (scriptable :pointer)
    (script :pointer)
    (value (:pointer g-value))
    (name :string)
    (node :pointer))

(defcfun (%scriptable-set-custom-property "clutter_scriptable_set_custom_property") :void
    (scriptable :pointer)
    (script :pointer)
    (name :string)
    (value (:pointer g-value)))

(defcfun (%model-set-names "clutter_model_set_names") :void
    (model :pointer)
    (n-columns guint)
    (names :pointer))

(defcfun (%model-set-types "clutter_model_set_types") :void
    (model :pointer)
    (n-columns guint)
    (types (:pointer g-type)))

(defcfun (%model-get-column-name "clutter_model_get_column_name") :string
    (model :pointer)
    (column guint))

(defcfun (%model-get-column-type "clutter_model_get_column_type") g-type
    (model :pointer)
    (column guint))

(defcfun (%model-get-n-columns "clutter_model_get_n_columns") guint
    (model :pointer))

(defcfun (%model-get-n-rows "clutter_model_get_n_rows") guint
    (model :pointer))

(defcfun (%model-appendv "clutter_model_appendv") :void
    (model :pointer)
    (n-columns guint)
    (columns (:pointer guint))
    (values (:pointer g-value)))

(defcfun (%model-prependv "clutter_model_prependv") :void
    (model :pointer)
    (n-columns guint)
    (columns (:pointer guint))
    (values (:pointer g-value)))

(defcfun (%model-insertv "clutter_model_insertv") :void
    (model :pointer)
    (row guint)
    (n-columns guint)
    (columns (:pointer guint))
    (values (:pointer g-value)))

(defcfun (%model-insert-value "clutter_model_insert_value") :void
    (model :pointer)
    (row guint)
    (column guint)
    (value (:pointer g-value)))

(defcfun (%model-remove "clutter_model_remove") :void
    (model :pointer)
    (row guint))

(defcfun (%model-foreach "clutter_model_foreach") :void
    (model :pointer)
    (func function-pointer)
    (user-data :pointer))

(defcfun (%model-set-sorting-column "clutter_model_set_sorting_column") :void
    (model :pointer)
    (column gint))

(defcfun (%model-get-sorting-column "clutter_model_get_sorting_column") gint
    (model :pointer))

(defcfun (%model-set-sort "clutter_model_set_sort") :void
    (model :pointer)
    (column guint)
    (func function-pointer)
    (user-data :pointer)
    (notify function-pointer))

(defcfun (%model-resort "clutter_model_resort") :void
    (model :pointer))

(defcfun (%model-set-filter "clutter_model_set_filter") :void
    (model :pointer)
    (func function-pointer)
    (user-data :pointer)
    (notify function-pointer))

(defcfun (%model-get-filter-set "clutter_model_get_filter_set") gboolean
    (model :pointer))

(defcfun (%model-filter-iter "clutter_model_filter_iter") gboolean
    (model :pointer)
    (iter :pointer))

(defcfun (%model-filter-row "clutter_model_filter_row") gboolean
    (model :pointer)
    (row guint))

(defcfun (%model-get-first-iter "clutter_model_get_first_iter") :pointer
    (model :pointer))

(defcfun (%model-get-last-iter "clutter_model_get_last_iter") :pointer
    (model :pointer))

(defcfun (%model-get-iter-at-row "clutter_model_get_iter_at_row") :pointer
    (model :pointer)
    (row guint))

(defcfun (%model-iter-copy "clutter_model_iter_copy") :pointer
    (iter :pointer))

(defcfun (%model-iter-get-value "clutter_model_iter_get_value") :void
    (iter :pointer)
    (column guint)
    (value (:pointer g-value)))

(defcfun (%model-iter-set-value "clutter_model_iter_set_value") :void
    (iter :pointer)
    (column guint)
    (value (:pointer g-value)))

(defcfun (%model-iter-is-first "clutter_model_iter_is_first") gboolean
    (iter :pointer))

(defcfun (%model-iter-is-last "clutter_model_iter_is_last") gboolean
    (iter :pointer))

(defcfun (%model-iter-next "clutter_model_iter_next") :pointer
    (iter :pointer))

(defcfun (%model-iter-prev "clutter_model_iter_prev") :pointer
    (iter :pointer))

(defcfun (%model-iter-get-model "clutter_model_iter_get_model") :pointer
    (iter :pointer))

(defcfun (%model-iter-get-row "clutter_model_iter_get_row") guint
    (iter :pointer))

(defcfun (%list-model-newv "clutter_list_model_newv") :pointer
    (n-columns guint)
    (types (:pointer g-type))
    (names :pointer))

(defcfun (%get-default-backend "clutter_get_default_backend") :pointer)

(defcfun (%backend-set-resolution "clutter_backend_set_resolution") :void
    (backend :pointer)
    (dpi :double))

(defcfun (%backend-get-resolution "clutter_backend_get_resolution") :double
    (backend :pointer))

(defcfun (%backend-set-double-click-time "clutter_backend_set_double_click_time") :void
    (backend :pointer)
    (msec guint))

(defcfun (%backend-get-double-click-time "clutter_backend_get_double_click_time") guint
    (backend :pointer))

(defcfun (%backend-set-double-click-distance "clutter_backend_set_double_click_distance") :void
    (backend :pointer)
    (distance guint))

(defcfun (%backend-get-double-click-distance "clutter_backend_get_double_click_distance") guint
    (backend :pointer))

(defcfun (%backend-set-font-options "clutter_backend_set_font_options") :void
    (backend :pointer)
    (options :pointer))

(defcfun (%backend-get-font-options "clutter_backend_get_font_options") :pointer
    (backend :pointer))

(defcfun (%backend-set-font-name "clutter_backend_set_font_name") :void
    (backend :pointer)
    (font-name :string))

(defcfun (%backend-get-font-name "clutter_backend_get_font_name") :string
    (backend :pointer))

(defcfun (%cogl-handle-ref "cogl_handle_ref") cogl-handle
    (handle cogl-handle))

(defcfun (%cogl-handle-unref "cogl_handle_unref") :void
    (handle cogl-handle))

(defcfun (%cogl-get-features "cogl_get_features") cogl-feature-flags-composite-enum)

(defcfun (%cogl-features-available "cogl_features_available") gboolean
    (features cogl-feature-flags-composite-enum))

(defcfun (%cogl-check-extension "cogl_check_extension") gboolean
    (name :string)
    (ext :string))

(defcfun (%cogl-get-proc-address "cogl_get_proc_address") function-pointer
    (name :string))

(defcfun (%cogl-get-option-group "cogl_get_option_group") :pointer)

(defcfun (%cogl-gl-error-to-string "cogl_gl_error_to_string") :string
    (error-code g-lenum))

(defcfun (%cogl-push-matrix "cogl_push_matrix") :void)

(defcfun (%cogl-pop-matrix "cogl_pop_matrix") :void)

(defcfun (%cogl-scale "cogl_scale") :void
    (x :float)
    (y :float)
    (z :float))

(defcfun (%cogl-translate "cogl_translate") :void
    (x :float)
    (y :float)
    (z :float))

(defcfun (%cogl-rotate "cogl_rotate") :void
    (angle :float)
    (x :float)
    (y :float)
    (z :float))

(defcfun (%cogl-frustum "cogl_frustum") :void
    (left :float)
    (right :float)
    (bottom :float)
    (top :float)
    (z-near :float)
    (z-far :float))

(defcfun (%cogl-perspective "cogl_perspective") :void
    (fovy :float)
    (aspect :float)
    (z-near :float)
    (z-far :float))

(defcfun (%cogl-ortho "cogl_ortho") :void
    (left :float)
    (right :float)
    (bottom :float)
    (top :float)
    (near :float)
    (far :float))

(defcfun (%cogl-get-modelview-matrix "cogl_get_modelview_matrix") :void
    (matrix :pointer))

(defcfun (%cogl-set-modelview-matrix "cogl_set_modelview_matrix") :void
    (matrix :pointer))

(defcfun (%cogl-get-projection-matrix "cogl_get_projection_matrix") :void
    (matrix :pointer))

(defcfun (%cogl-set-projection-matrix "cogl_set_projection_matrix") :void
    (matrix :pointer))

(defcfun (%cogl-viewport "cogl_viewport") :void
    (width guint)
    (height guint))

(defcfun (%cogl-get-viewport "cogl_get_viewport") :void
    (v[4] :float))

(defcfun (%cogl-clear "cogl_clear") :void
    (color :pointer)
    (buffers gulong))

(defcfun (%cogl-get-bitmasks "cogl_get_bitmasks") :void
    (red (:pointer gint))
    (green (:pointer gint))
    (blue (:pointer gint))
    (alpha (:pointer gint)))

(defcfun (%cogl-set-depth-test-enabled "cogl_set_depth_test_enabled") :void
    (setting gboolean))

(defcfun (%cogl-get-depth-test-enabled "cogl_get_depth_test_enabled") gboolean)

(defcfun (%cogl-set-backface-culling-enabled "cogl_set_backface_culling_enabled") :void
    (setting gboolean))

(defcfun (%cogl-get-backface-culling-enabled "cogl_get_backface_culling_enabled") gboolean)

(defcfun (%cogl-set-fog "cogl_set_fog") :void
    (fog-color :pointer)
    (mode cogl-fog-mode)
    (density :float)
    (z-near :float)
    (z-far :float))

(defcfun (%cogl-disable-fog "cogl_disable_fog") :void)

(defcfun (%cogl-set-source "cogl_set_source") :void
    (material cogl-handle))

(defcfun (%cogl-set-source-color "cogl_set_source_color") :void
    (color :pointer))

(defcfun (%cogl-set-source-color4ub "cogl_set_source_color4ub") :void
    (red guint8)
    (green guint8)
    (blue guint8)
    (alpha guint8))

(defcfun (%cogl-set-source-color4f "cogl_set_source_color4f") :void
    (red :float)
    (green :float)
    (blue :float)
    (alpha :float))

(defcfun (%cogl-set-source-texture "cogl_set_source_texture") :void
    (texture-handle cogl-handle))

(defcfun (%cogl-read-pixels "cogl_read_pixels") :void
    (x :int)
    (y :int)
    (width :int)
    (height :int)
    (source cogl-read-pixels-flags-composite-enum)
    (format cogl-pixel-format)
    (pixels (:pointer guint8)))

(defcfun (%cogl-flush "cogl_flush") :void)

(defcfun (%cogl-begin-gl "cogl_begin_gl") :void)

(defcfun (%cogl-end-gl "cogl_end_gl") :void)

(defcfun (%cogl-color-new "cogl_color_new") :pointer)

(defcfun (%cogl-color-copy "cogl_color_copy") :pointer
    (color :pointer))

(defcfun (%cogl-color-free "cogl_color_free") :void
    (color :pointer))

(defcfun (%cogl-color-set-from-4ub "cogl_color_set_from_4ub") :void
    (dest :pointer)
    (red guint8)
    (green guint8)
    (blue guint8)
    (alpha guint8))

(defcfun (%cogl-color-set-from-4f "cogl_color_set_from_4f") :void
    (dest :pointer)
    (red :float)
    (green :float)
    (blue :float)
    (alpha :float))

(defcfun (%cogl-color-get-red "cogl_color_get_red") :float
    (color :pointer))

(defcfun (%cogl-color-get-green "cogl_color_get_green") :float
    (color :pointer))

(defcfun (%cogl-color-get-blue "cogl_color_get_blue") :float
    (color :pointer))

(defcfun (%cogl-color-get-alpha "cogl_color_get_alpha") :float
    (color :pointer))

(defcfun (%cogl-color-get-red-byte "cogl_color_get_red_byte") :unsigned-char
    (color :pointer))

(defcfun (%cogl-color-get-green-byte "cogl_color_get_green_byte") :unsigned-char
    (color :pointer))

(defcfun (%cogl-color-get-blue-byte "cogl_color_get_blue_byte") :unsigned-char
    (color :pointer))

(defcfun (%cogl-color-get-alpha-byte "cogl_color_get_alpha_byte") :unsigned-char
    (color :pointer))

(defcfun (%cogl-color-get-red-float "cogl_color_get_red_float") :float
    (color :pointer))

(defcfun (%cogl-color-get-green-float "cogl_color_get_green_float") :float
    (color :pointer))

(defcfun (%cogl-color-get-blue-float "cogl_color_get_blue_float") :float
    (color :pointer))

(defcfun (%cogl-color-get-alpha-float "cogl_color_get_alpha_float") :float
    (color :pointer))

(defcfun (%cogl-texture-new-with-size "cogl_texture_new_with_size") cogl-handle
    (width guint)
    (height guint)
    (flags cogl-texture-flags-composite-enum)
    (internal-format cogl-pixel-format))

(defcfun (%cogl-texture-new-from-file "cogl_texture_new_from_file") cogl-handle
    (filename :string)
    (flags cogl-texture-flags-composite-enum)
    (internal-format cogl-pixel-format)
    (error :pointer))

(defcfun (%cogl-texture-new-from-data "cogl_texture_new_from_data") cogl-handle
    (width guint)
    (height guint)
    (flags cogl-texture-flags-composite-enum)
    (format cogl-pixel-format)
    (internal-format cogl-pixel-format)
    (rowstride guint)
    (data (:pointer guchar)))

(defcfun (%cogl-texture-new-from-foreign "cogl_texture_new_from_foreign") cogl-handle
    (gl-handle g-luint)
    (gl-target g-lenum)
    (width g-luint)
    (height g-luint)
    (x-pot-waste g-luint)
    (y-pot-waste g-luint)
    (format cogl-pixel-format))

(defcfun (%cogl-texture-new-from-bitmap "cogl_texture_new_from_bitmap") cogl-handle
    (bmp-handle cogl-handle)
    (flags cogl-texture-flags-composite-enum)
    (internal-format cogl-pixel-format))

(defcfun (%cogl-is-texture "cogl_is_texture") gboolean
    (handle cogl-handle))

(defcfun (%cogl-texture-ref "cogl_texture_ref") cogl-handle
    (handle cogl-handle))

(defcfun (%cogl-texture-unref "cogl_texture_unref") :void
    (handle cogl-handle))

(defcfun (%cogl-texture-get-width "cogl_texture_get_width") guint
    (handle cogl-handle))

(defcfun (%cogl-texture-get-height "cogl_texture_get_height") guint
    (handle cogl-handle))

(defcfun (%cogl-texture-get-format "cogl_texture_get_format") cogl-pixel-format
    (handle cogl-handle))

(defcfun (%cogl-texture-get-rowstride "cogl_texture_get_rowstride") guint
    (handle cogl-handle))

(defcfun (%cogl-texture-get-max-waste "cogl_texture_get_max_waste") gint
    (handle cogl-handle))

(defcfun (%cogl-texture-is-sliced "cogl_texture_is_sliced") gboolean
    (handle cogl-handle))

(defcfun (%cogl-texture-get-gl-texture "cogl_texture_get_gl_texture") gboolean
    (handle cogl-handle)
    (out-gl-handle (:pointer g-luint))
    (out-gl-target (:pointer g-lenum)))

(defcfun (%cogl-texture-get-data "cogl_texture_get_data") gint
    (handle cogl-handle)
    (format cogl-pixel-format)
    (rowstride guint)
    (data (:pointer guchar)))

(defcfun (%cogl-texture-set-region "cogl_texture_set_region") gboolean
    (handle cogl-handle)
    (src-x gint)
    (src-y gint)
    (dst-x gint)
    (dst-y gint)
    (dst-width guint)
    (dst-height guint)
    (width gint)
    (height gint)
    (format cogl-pixel-format)
    (rowstride guint)
    (data (:pointer guchar)))

(defcfun (%cogl-material-new "cogl_material_new") cogl-handle)

(defcfun (%cogl-material-ref "cogl_material_ref") cogl-handle
    (handle cogl-handle))

(defcfun (%cogl-material-unref "cogl_material_unref") :void
    (handle cogl-handle))

(defcfun (%cogl-is-material "cogl_is_material") gboolean
    (handle cogl-handle))

(defcfun (%cogl-material-set-color "cogl_material_set_color") :void
    (material cogl-handle)
    (color :pointer))

(defcfun (%cogl-material-set-color4ub "cogl_material_set_color4ub") :void
    (material cogl-handle)
    (red guint8)
    (green guint8)
    (blue guint8)
    (alpha guint8))

(defcfun (%cogl-material-set-color4f "cogl_material_set_color4f") :void
    (material cogl-handle)
    (red :float)
    (green :float)
    (blue :float)
    (alpha :float))

(defcfun (%cogl-material-get-color "cogl_material_get_color") :void
    (material cogl-handle)
    (color :pointer))

(defcfun (%cogl-material-set-ambient "cogl_material_set_ambient") :void
    (material cogl-handle)
    (ambient :pointer))

(defcfun (%cogl-material-get-ambient "cogl_material_get_ambient") :void
    (material cogl-handle)
    (ambient :pointer))

(defcfun (%cogl-material-set-diffuse "cogl_material_set_diffuse") :void
    (material cogl-handle)
    (diffuse :pointer))

(defcfun (%cogl-material-get-diffuse "cogl_material_get_diffuse") :void
    (material cogl-handle)
    (diffuse :pointer))

(defcfun (%cogl-material-set-ambient-and-diffuse "cogl_material_set_ambient_and_diffuse") :void
    (material cogl-handle)
    (color :pointer))

(defcfun (%cogl-material-set-emission "cogl_material_set_emission") :void
    (material cogl-handle)
    (emission :pointer))

(defcfun (%cogl-material-get-emission "cogl_material_get_emission") :void
    (material cogl-handle)
    (emission :pointer))

(defcfun (%cogl-material-set-specular "cogl_material_set_specular") :void
    (material cogl-handle)
    (specular :pointer))

(defcfun (%cogl-material-get-specular "cogl_material_get_specular") :void
    (material cogl-handle)
    (specular :pointer))

(defcfun (%cogl-material-set-shininess "cogl_material_set_shininess") :void
    (material cogl-handle)
    (shininess :float))

(defcfun (%cogl-material-get-shininess "cogl_material_get_shininess") :float
    (material cogl-handle))

(defcfun (%cogl-material-set-alpha-test-function "cogl_material_set_alpha_test_function") :void
    (material cogl-handle)
    (alpha-func cogl-material-alpha-func)
    (alpha-reference :float))

(defcfun (%cogl-material-set-blend "cogl_material_set_blend") gboolean
    (material cogl-handle)
    (blend-string :string)
    (error :pointer))

(defcfun (%cogl-material-set-blend-constant "cogl_material_set_blend_constant") :void
    (material cogl-handle)
    (constant-color :pointer))

(defcfun (%cogl-material-set-layer "cogl_material_set_layer") :void
    (material cogl-handle)
    (layer-index :int)
    (texture cogl-handle))

(defcfun (%cogl-material-remove-layer "cogl_material_remove_layer") :void
    (material cogl-handle)
    (layer-index gint))

(defcfun (%cogl-material-set-layer-combine "cogl_material_set_layer_combine") gboolean
    (material cogl-handle)
    (layer-index gint)
    (blend-string :string)
    (error :pointer))

(defcfun (%cogl-material-set-layer-combine-constant "cogl_material_set_layer_combine_constant") :void
    (material cogl-handle)
    (layer-index :int)
    (constant :pointer))

(defcfun (%cogl-material-set-layer-matrix "cogl_material_set_layer_matrix") :void
    (material cogl-handle)
    (layer-index :int)
    (matrix :pointer))

(defcfun (%cogl-material-get-layers "cogl_material_get_layers") :pointer
    (material cogl-handle))

(defcfun (%cogl-material-set-layer-filters "cogl_material_set_layer_filters") :void
    (handle cogl-handle)
    (layer-index gint)
    (min-filter cogl-material-filter)
    (mag-filter cogl-material-filter))

(defcfun (%cogl-material-layer-get-type "cogl_material_layer_get_type") cogl-material-layer-type
    (layer-handle cogl-handle))

(defcfun (%cogl-material-layer-get-texture "cogl_material_layer_get_texture") cogl-handle
    (layer-handle cogl-handle))

(defcfun (%cogl-material-layer-get-min-filter "cogl_material_layer_get_min_filter") cogl-material-filter
    (layer-handle cogl-handle))

(defcfun (%cogl-material-layer-get-mag-filter "cogl_material_layer_get_mag_filter") cogl-material-filter
    (layer-handle cogl-handle))

(defcfun (%cogl-rectangle "cogl_rectangle") :void
    (x-1 :float)
    (y-1 :float)
    (x-2 :float)
    (y-2 :float))

(defcfun (%cogl-rectangles "cogl_rectangles") :void
    (verts (:pointer :float))
    (n-rects guint))

(defcfun (%cogl-rectangle-with-texture-coords "cogl_rectangle_with_texture_coords") :void
    (x1 :float)
    (y1 :float)
    (x2 :float)
    (y2 :float)
    (tx1 :float)
    (ty1 :float)
    (tx2 :float)
    (ty2 :float))

(defcfun (%cogl-rectangles-with-texture-coords "cogl_rectangles_with_texture_coords") :void
    (verts (:pointer :float))
    (n-rects guint))

(defcfun (%cogl-rectangle-with-multitexture-coords "cogl_rectangle_with_multitexture_coords") :void
    (x1 :float)
    (y1 :float)
    (x2 :float)
    (y2 :float)
    (tex-coords (:pointer :float))
    (tex-coords-len gint))

(defcfun (%cogl-polygon "cogl_polygon") :void
    (vertices :pointer)
    (n-vertices guint)
    (use-color gboolean))

(defcfun (%cogl-path-new "cogl_path_new") :void)

(defcfun (%cogl-path-move-to "cogl_path_move_to") :void
    (x :float)
    (y :float))

(defcfun (%cogl-path-close "cogl_path_close") :void)

(defcfun (%cogl-path-line-to "cogl_path_line_to") :void
    (x :float)
    (y :float))

(defcfun (%cogl-path-curve-to "cogl_path_curve_to") :void
    (x-1 :float)
    (y-1 :float)
    (x-2 :float)
    (y-2 :float)
    (x-3 :float)
    (y-3 :float))

(defcfun (%cogl-path-arc "cogl_path_arc") :void
    (center-x :float)
    (center-y :float)
    (radius-x :float)
    (radius-y :float)
    (angle-1 :float)
    (angle-2 :float))

(defcfun (%cogl-path-rel-move-to "cogl_path_rel_move_to") :void
    (x :float)
    (y :float))

(defcfun (%cogl-path-rel-line-to "cogl_path_rel_line_to") :void
    (x :float)
    (y :float))

(defcfun (%cogl-path-rel-curve-to "cogl_path_rel_curve_to") :void
    (x-1 :float)
    (y-1 :float)
    (x-2 :float)
    (y-2 :float)
    (x-3 :float)
    (y-3 :float))

(defcfun (%cogl-path-line "cogl_path_line") :void
    (x-1 :float)
    (y-1 :float)
    (x-2 :float)
    (y-2 :float))

(defcfun (%cogl-path-polyline "cogl_path_polyline") :void
    (coords (:pointer :float))
    (num-points gint))

(defcfun (%cogl-path-polygon "cogl_path_polygon") :void
    (coords (:pointer :float))
    (num-points gint))

(defcfun (%cogl-path-rectangle "cogl_path_rectangle") :void
    (x-1 :float)
    (y-1 :float)
    (x-2 :float)
    (y-2 :float))

(defcfun (%cogl-path-round-rectangle "cogl_path_round_rectangle") :void
    (x-1 :float)
    (y-1 :float)
    (x-2 :float)
    (y-2 :float)
    (radius :float)
    (arc-step :float))

(defcfun (%cogl-path-ellipse "cogl_path_ellipse") :void
    (center-x :float)
    (center-y :float)
    (radius-x :float)
    (radius-y :float))

(defcfun (%cogl-path-fill "cogl_path_fill") :void)

(defcfun (%cogl-path-fill-preserve "cogl_path_fill_preserve") :void)

(defcfun (%cogl-path-stroke "cogl_path_stroke") :void)

(defcfun (%cogl-path-stroke-preserve "cogl_path_stroke_preserve") :void)

(defcfun (%cogl-vertex-buffer-new "cogl_vertex_buffer_new") cogl-handle
    (n-vertices guint))

(defcfun (%cogl-vertex-buffer-get-n-vertices "cogl_vertex_buffer_get_n_vertices") guint
    (handle cogl-handle))

(defcfun (%cogl-vertex-buffer-ref "cogl_vertex_buffer_ref") cogl-handle
    (handle cogl-handle))

(defcfun (%cogl-vertex-buffer-unref "cogl_vertex_buffer_unref") :void
    (handle cogl-handle))

(defcfun (%cogl-vertex-buffer-add "cogl_vertex_buffer_add") :void
    (handle cogl-handle)
    (attribute-name :string)
    (n-components guint8)
    (type cogl-attribute-type)
    (normalized gboolean)
    (stride guint16)
    (pointer (:pointer :void)))

(defcfun (%cogl-vertex-buffer-delete "cogl_vertex_buffer_delete") :void
    (handle cogl-handle)
    (attribute-name :string))

(defcfun (%cogl-vertex-buffer-submit "cogl_vertex_buffer_submit") :void
    (handle cogl-handle))

(defcfun (%cogl-vertex-buffer-disable "cogl_vertex_buffer_disable") :void
    (handle cogl-handle)
    (attribute-name :string))

(defcfun (%cogl-vertex-buffer-enable "cogl_vertex_buffer_enable") :void
    (handle cogl-handle)
    (attribute-name :string))

(defcfun (%cogl-vertex-buffer-draw "cogl_vertex_buffer_draw") :void
    (handle cogl-handle)
    (mode cogl-vertices-mode)
    (first :int)
    (count :int))

(defcfun (%cogl-vertex-buffer-indices-new "cogl_vertex_buffer_indices_new") cogl-handle
    (indices-type cogl-indices-type)
    (indices-array (:pointer :void))
    (indices-len :int))

(defcfun (%cogl-vertex-buffer-delete-indices "cogl_vertex_buffer_delete_indices") :void
    (handle cogl-handle)
    (indices-id :int))

(defcfun (%cogl-vertex-buffer-draw-elements "cogl_vertex_buffer_draw_elements") :void
    (handle cogl-handle)
    (mode cogl-vertices-mode)
    (indices cogl-handle)
    (min-index :int)
    (max-index :int)
    (indices-offset :int)
    (count :int))

(defcfun (%cogl-vertex-buffer-indices-get-for-quads "cogl_vertex_buffer_indices_get_for_quads") cogl-handle
    (n-indices guint))

(defcfun (%cogl-matrix-init-identity "cogl_matrix_init_identity") :void
    (matrix :pointer))

(defcfun (%cogl-matrix-frustum "cogl_matrix_frustum") :void
    (matrix :pointer)
    (left :float)
    (right :float)
    (bottom :float)
    (top :float)
    (z-near :float)
    (z-far :float))

(defcfun (%cogl-matrix-ortho "cogl_matrix_ortho") :void
    (matrix :pointer)
    (left :float)
    (right :float)
    (bottom :float)
    (top :float)
    (z-near :float)
    (z-far :float))

(defcfun (%cogl-matrix-perspective "cogl_matrix_perspective") :void
    (matrix :pointer)
    (fov-y :float)
    (aspect :float)
    (z-near :float)
    (z-far :float))

(defcfun (%cogl-matrix-transform-point "cogl_matrix_transform_point") :void
    (matrix :pointer)
    (x (:pointer :float))
    (y (:pointer :float))
    (z (:pointer :float))
    (w (:pointer :float)))

(defcfun (%cogl-matrix-multiply "cogl_matrix_multiply") :void
    (result :pointer)
    (a :pointer)
    (b :pointer))

(defcfun (%cogl-matrix-rotate "cogl_matrix_rotate") :void
    (matrix :pointer)
    (angle :float)
    (x :float)
    (y :float)
    (z :float))

(defcfun (%cogl-matrix-translate "cogl_matrix_translate") :void
    (matrix :pointer)
    (x :float)
    (y :float)
    (z :float))

(defcfun (%cogl-matrix-scale "cogl_matrix_scale") :void
    (matrix :pointer)
    (sx :float)
    (sy :float)
    (sz :float))

(defcfun (%cogl-matrix-init-from-array "cogl_matrix_init_from_array") :void
    (matrix :pointer)
    (array (:pointer :float)))

(defcfun (%cogl-matrix-get-array "cogl_matrix_get_array") (:pointer :float)
    (matrix :pointer))

(defcfun (%cogl-create-shader "cogl_create_shader") cogl-handle
    (shader-type cogl-shader-type))

(defcfun (%cogl-shader-ref "cogl_shader_ref") cogl-handle
    (handle cogl-handle))

(defcfun (%cogl-shader-unref "cogl_shader_unref") :void
    (handle cogl-handle))

(defcfun (%cogl-is-shader "cogl_is_shader") gboolean
    (handle cogl-handle))

(defcfun (%cogl-shader-source "cogl_shader_source") :void
    (shader cogl-handle)
    (source :string))

(defcfun (%cogl-shader-compile "cogl_shader_compile") :void
    (handle cogl-handle))

(defcfun (%cogl-shader-get-info-log "cogl_shader_get_info_log") :string
    (handle cogl-handle))

(defcfun (%cogl-shader-get-type "cogl_shader_get_type") cogl-shader-type
    (handle cogl-handle))

(defcfun (%cogl-shader-is-compiled "cogl_shader_is_compiled") gboolean
    (handle cogl-handle))

(defcfun (%cogl-create-program "cogl_create_program") cogl-handle)

(defcfun (%cogl-program-ref "cogl_program_ref") cogl-handle
    (handle cogl-handle))

(defcfun (%cogl-program-unref "cogl_program_unref") :void
    (handle cogl-handle))

(defcfun (%cogl-is-program "cogl_is_program") gboolean
    (handle cogl-handle))

(defcfun (%cogl-program-attach-shader "cogl_program_attach_shader") :void
    (program-handle cogl-handle)
    (shader-handle cogl-handle))

(defcfun (%cogl-program-link "cogl_program_link") :void
    (handle cogl-handle))

(defcfun (%cogl-program-use "cogl_program_use") :void
    (handle cogl-handle))

(defcfun (%cogl-program-get-uniform-location "cogl_program_get_uniform_location") :int
    (handle cogl-handle)
    (uniform-name :string))

(defcfun (%cogl-program-uniform-1f "cogl_program_uniform_1f") :void
    (uniform-no :int)
    (value :float))

(defcfun (%cogl-program-uniform-1i "cogl_program_uniform_1i") :void
    (uniform-no :int)
    (value :int))

(defcfun (%cogl-program-uniform-float "cogl_program_uniform_float") :void
    (uniform-no :int)
    (size :int)
    (count :int)
    (value :pointer))

(defcfun (%cogl-program-uniform-int "cogl_program_uniform_int") :void
    (uniform-no :int)
    (size :int)
    (count :int)
    (value (:pointer :int)))

(defcfun (%cogl-program-uniform-matrix "cogl_program_uniform_matrix") :void
    (uniform-no :int)
    (size :int)
    (count :int)
    (transpose gboolean)
    (value (:pointer :float)))

(defcfun (%cogl-offscreen-new-to-texture "cogl_offscreen_new_to_texture") cogl-handle
    (handle cogl-handle))

(defcfun (%cogl-offscreen-ref "cogl_offscreen_ref") cogl-handle
    (handle cogl-handle))

(defcfun (%cogl-offscreen-unref "cogl_offscreen_unref") :void
    (handle cogl-handle))

(defcfun (%cogl-is-offscreen "cogl_is_offscreen") gboolean
    (handle cogl-handle))

(defcfun (%cogl-set-draw-buffer "cogl_set_draw_buffer") :void
    (target cogl-buffer-target-composite-enum)
    (offscreen cogl-handle))

(defcfun (%cogl-pop-draw-buffer "cogl_pop_draw_buffer") :void)

(defcfun (%cogl-push-draw-buffer "cogl_push_draw_buffer") :void)

(defcfun (%cogl-sqrti "cogl_sqrti") gint
    (x gint))

(defcfun (%cogl-fixed-atan2 "cogl_fixed_atan2") cogl-fixed
    (a cogl-fixed)
    (b cogl-fixed))

(defcfun (%cogl-fixed-atani "cogl_fixed_atani") cogl-fixed
    (a cogl-fixed))

(defcfun (%cogl-fixed-cos "cogl_fixed_cos") cogl-fixed
    (angle cogl-fixed))

(defcfun (%cogl-fixed-log2 "cogl_fixed_log2") cogl-fixed
    (x guint))

(defcfun (%cogl-fixed-pow "cogl_fixed_pow") guint
    (x guint)
    (y cogl-fixed))

(defcfun (%cogl-fixed-pow2 "cogl_fixed_pow2") guint
    (x cogl-fixed))

(defcfun (%cogl-fixed-sin "cogl_fixed_sin") cogl-fixed
    (angle cogl-fixed))

(defcfun (%cogl-fixed-sqrt "cogl_fixed_sqrt") cogl-fixed
    (x cogl-fixed))

(defcfun (%cogl-fixed-tan "cogl_fixed_tan") cogl-fixed
    (angle cogl-fixed))

(defcfun (%cogl-angle-cos "cogl_angle_cos") cogl-fixed
    (angle cogl-angle))

(defcfun (%cogl-angle-sin "cogl_angle_sin") cogl-fixed
    (angle cogl-angle))

(defcfun (%cogl-angle-tan "cogl_angle_tan") cogl-fixed
    (angle cogl-angle))

(defcfun (%g-thread-init "g_thread_init") :void
    (vtable :pointer))

(defcfun (%g-object-set-property "g_object_set_property") :void
    (object (:pointer g-object))
    (property-name :string)
    (value (:pointer g-value)))

(defcfun (%g-object-get-property "g_object_get_property") :void
    (object (:pointer g-object))
    (property-name :string)
    (value (:pointer g-value)))

(defcfun (%g-signal-newv "g_signal_newv") guint
    (signal-name :string)
    (itype g-type)
    (signal-flags g-signal-flags-composite-enum)
    (class-closure :pointer)
    (accumulator function-pointer)
    (accu-data :pointer)
    (c-marshaller function-pointer)
    (return-type g-type)
    (n-params guint)
    (param-types (:pointer g-type)))

(defcfun (%g-signal-query "g_signal_query") :void
    (signal-id guint)
    (query :pointer))

(defcfun (%g-signal-lookup "g_signal_lookup") guint
    (name :string)
    (itype g-type))

(defcfun (%g-signal-name "g_signal_name") :string
    (signal-id guint))

(defcfun (%g-signal-list-ids "g_signal_list_ids") (:pointer guint)
    (itype g-type)
    (n-ids (:pointer guint)))

(defcfun (%g-signal-emitv "g_signal_emitv") :void
    (instance-and-params (:pointer g-value))
    (signal-id guint)
    (detail g-quark)
    (return-value (:pointer g-value)))

(defcfun (%g-signal-connect-object "g_signal_connect_object") gulong
    (instance :pointer)
    (detailed-signal :string)
    (c-handler function-pointer)
    (gobject :pointer)
    (connect-flags g-connect-flags-composite-enum))

(defcfun (%g-signal-connect-data "g_signal_connect_data") gulong
    (instance :pointer)
    (detailed-signal :string)
    (c-handler function-pointer)
    (data :pointer)
    (destroy-data function-pointer)
    (connect-flags g-connect-flags-composite-enum))

(defcfun (%g-signal-connect-closure "g_signal_connect_closure") gulong
    (instance :pointer)
    (detailed-signal :string)
    (closure :pointer)
    (after gboolean))

(defcfun (%g-signal-connect-closure-by-id "g_signal_connect_closure_by_id") gulong
    (instance :pointer)
    (signal-id guint)
    (detail g-quark)
    (closure :pointer)
    (after gboolean))

(defcfun (%g-signal-handler-block "g_signal_handler_block") :void
    (instance :pointer)
    (handler-id gulong))

(defcfun (%g-signal-handler-unblock "g_signal_handler_unblock") :void
    (instance :pointer)
    (handler-id gulong))

(defcfun (%g-signal-handler-disconnect "g_signal_handler_disconnect") :void
    (instance :pointer)
    (handler-id gulong))

(defcfun (%g-signal-handler-find "g_signal_handler_find") gulong
    (instance :pointer)
    (mask g-signal-match-type-composite-enum)
    (signal-id guint)
    (detail g-quark)
    (closure :pointer)
    (func :pointer)
    (data :pointer))

(defcfun (%g-signal-handlers-block-matched "g_signal_handlers_block_matched") guint
    (instance :pointer)
    (mask g-signal-match-type-composite-enum)
    (signal-id guint)
    (detail g-quark)
    (closure :pointer)
    (func :pointer)
    (data :pointer))

(defcfun (%g-signal-handlers-unblock-matched "g_signal_handlers_unblock_matched") guint
    (instance :pointer)
    (mask g-signal-match-type-composite-enum)
    (signal-id guint)
    (detail g-quark)
    (closure :pointer)
    (func :pointer)
    (data :pointer))

(defcfun (%g-signal-handlers-disconnect-matched "g_signal_handlers_disconnect_matched") guint
    (instance :pointer)
    (mask g-signal-match-type-composite-enum)
    (signal-id guint)
    (detail g-quark)
    (closure :pointer)
    (func :pointer)
    (data :pointer))

(defcfun (%g-signal-handler-is-connected "g_signal_handler_is_connected") gboolean
    (instance :pointer)
    (handler-id gulong))

(defcfun (%g-signal-has-handler-pending "g_signal_has_handler_pending") gboolean
    (instance :pointer)
    (signal-id guint)
    (detail g-quark)
    (may-be-blocked gboolean))

(defcfun (%g-signal-stop-emission "g_signal_stop_emission") :void
    (instance :pointer)
    (signal-id guint)
    (detail g-quark))

(defcfun (%g-signal-stop-emission-by-name "g_signal_stop_emission_by_name") :void
    (instance :pointer)
    (detailed-signal :string))

(defcfun (%g-signal-override-class-closure "g_signal_override_class_closure") :void
    (signal-id guint)
    (instance-type g-type)
    (class-closure :pointer))

(defcfun (%g-signal-chain-from-overridden "g_signal_chain_from_overridden") :void
    (instance-and-params (:pointer g-value))
    (return-value (:pointer g-value)))

(defcfun (%g-signal-override-class-handler "g_signal_override_class_handler") :void
    (signal-name :string)
    (instance-type g-type)
    (class-handler function-pointer))

(defcfun (%g-signal-add-emission-hook "g_signal_add_emission_hook") gulong
    (signal-id guint)
    (detail g-quark)
    (hook-func function-pointer)
    (hook-data :pointer)
    (data-destroy function-pointer))

(defcfun (%g-signal-remove-emission-hook "g_signal_remove_emission_hook") :void
    (signal-id guint)
    (hook-id gulong))

(defcfun (%g-signal-parse-name "g_signal_parse_name") gboolean
    (detailed-signal :string)
    (itype g-type)
    (signal-id-p (:pointer guint))
    (detail-p (:pointer g-quark))
    (force-detail-quark gboolean))

(defcfun (%g-signal-get-invocation-hint "g_signal_get_invocation_hint") :pointer
    (instance :pointer))

(defcfun (%g-signal-type-cclosure-new "g_signal_type_cclosure_new") :pointer
    (itype g-type)
    (struct-offset guint))

(defcfun (%g-signal-accumulator-true-handled "g_signal_accumulator_true_handled") gboolean
    (ihint :pointer)
    (return-accu (:pointer g-value))
    (handler-return (:pointer g-value))
    (dummy :pointer))

(defcfun (%g-value-init "g_value_init") (:pointer g-value)
    (value (:pointer g-value))
    (g-type g-type))

(defcfun (%g-value-copy "g_value_copy") :void
    (src-value (:pointer g-value))
    (dest-value (:pointer g-value)))

(defcfun (%g-value-reset "g_value_reset") (:pointer g-value)
    (value (:pointer g-value)))

(defcfun (%g-value-unset "g_value_unset") :void
    (value (:pointer g-value)))

(defcfun (%g-value-set-instance "g_value_set_instance") :void
    (value (:pointer g-value))
    (instance :pointer))

(defcfun (%g-value-fits-pointer "g_value_fits_pointer") gboolean
    (value (:pointer g-value)))

(defcfun (%g-value-peek-pointer "g_value_peek_pointer") :pointer
    (value (:pointer g-value)))

(defcfun (%g-value-type-compatible "g_value_type_compatible") gboolean
    (src-type g-type)
    (dest-type g-type))

(defcfun (%g-value-type-transformable "g_value_type_transformable") gboolean
    (src-type g-type)
    (dest-type g-type))

(defcfun (%g-value-transform "g_value_transform") gboolean
    (src-value (:pointer g-value))
    (dest-value (:pointer g-value)))

(defcfun (%g-value-register-transform-func "g_value_register_transform_func") :void
    (src-type g-type)
    (dest-type g-type)
    (transform-func function-pointer))

(defcfun (%g-strdup-value-contents "g_strdup_value_contents") :string
    (value (:pointer g-value)))

(defcfun (%g-param-spec-boolean "g_param_spec_boolean") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (default-value gboolean)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-char "g_param_spec_char") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (minimum gint8)
    (maximum gint8)
    (default-value gint8)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-uchar "g_param_spec_uchar") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (minimum guint8)
    (maximum guint8)
    (default-value guint8)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-int "g_param_spec_int") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (minimum gint)
    (maximum gint)
    (default-value gint)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-uint "g_param_spec_uint") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (minimum guint)
    (maximum guint)
    (default-value guint)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-long "g_param_spec_long") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (minimum glong)
    (maximum glong)
    (default-value glong)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-ulong "g_param_spec_ulong") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (minimum gulong)
    (maximum gulong)
    (default-value gulong)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-int64 "g_param_spec_int64") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (minimum gint64)
    (maximum gint64)
    (default-value gint64)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-uint64 "g_param_spec_uint64") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (minimum guint64)
    (maximum guint64)
    (default-value guint64)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-float "g_param_spec_float") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (minimum :float)
    (maximum :float)
    (default-value :float)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-double "g_param_spec_double") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (minimum :double)
    (maximum :double)
    (default-value :double)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-enum "g_param_spec_enum") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (enum-type g-type)
    (default-value gint)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-flags "g_param_spec_flags") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (flags-type g-type)
    (default-value guint)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-string "g_param_spec_string") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (default-value :string)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-param "g_param_spec_param") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (param-type g-type)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-boxed "g_param_spec_boxed") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (boxed-type g-type)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-pointer "g_param_spec_pointer") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-object "g_param_spec_object") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (object-type g-type)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-unichar "g_param_spec_unichar") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (default-value gunichar)
    (flags g-param-flags-composite-enum))

(defcfun (%g-param-spec-gtype "g_param_spec_gtype") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (is-a-type g-type)
    (flags g-param-flags-composite-enum))

(defcfun (%g-value-set-boolean "g_value_set_boolean") :void
    (value (:pointer g-value))
    (v-boolean gboolean))

(defcfun (%g-value-get-boolean "g_value_get_boolean") gboolean
    (value (:pointer g-value)))

(defcfun (%g-value-set-char "g_value_set_char") :void
    (value (:pointer g-value))
    (v-char gchar))

(defcfun (%g-value-get-char "g_value_get_char") gchar
    (value (:pointer g-value)))

(defcfun (%g-value-set-uchar "g_value_set_uchar") :void
    (value (:pointer g-value))
    (v-uchar guchar))

(defcfun (%g-value-get-uchar "g_value_get_uchar") guchar
    (value (:pointer g-value)))

(defcfun (%g-value-set-int "g_value_set_int") :void
    (value (:pointer g-value))
    (v-int gint))

(defcfun (%g-value-get-int "g_value_get_int") gint
    (value (:pointer g-value)))

(defcfun (%g-value-set-uint "g_value_set_uint") :void
    (value (:pointer g-value))
    (v-uint guint))

(defcfun (%g-value-get-uint "g_value_get_uint") guint
    (value (:pointer g-value)))

(defcfun (%g-value-set-long "g_value_set_long") :void
    (value (:pointer g-value))
    (v-long glong))

(defcfun (%g-value-get-long "g_value_get_long") glong
    (value (:pointer g-value)))

(defcfun (%g-value-set-ulong "g_value_set_ulong") :void
    (value (:pointer g-value))
    (v-ulong gulong))

(defcfun (%g-value-get-ulong "g_value_get_ulong") gulong
    (value (:pointer g-value)))

(defcfun (%g-value-set-int64 "g_value_set_int64") :void
    (value (:pointer g-value))
    (v-int64 gint64))

(defcfun (%g-value-get-int64 "g_value_get_int64") gint64
    (value (:pointer g-value)))

(defcfun (%g-value-set-uint64 "g_value_set_uint64") :void
    (value (:pointer g-value))
    (v-uint64 guint64))

(defcfun (%g-value-get-uint64 "g_value_get_uint64") guint64
    (value (:pointer g-value)))

(defcfun (%g-value-set-float "g_value_set_float") :void
    (value (:pointer g-value))
    (v-float :float))

(defcfun (%g-value-get-float "g_value_get_float") :float
    (value (:pointer g-value)))

(defcfun (%g-value-set-double "g_value_set_double") :void
    (value (:pointer g-value))
    (v-double :double))

(defcfun (%g-value-get-double "g_value_get_double") :double
    (value (:pointer g-value)))

(defcfun (%g-value-set-enum "g_value_set_enum") :void
    (value (:pointer g-value))
    (v-enum gint))

(defcfun (%g-value-get-enum "g_value_get_enum") gint
    (value (:pointer g-value)))

(defcfun (%g-value-set-flags "g_value_set_flags") :void
    (value (:pointer g-value))
    (v-flags guint))

(defcfun (%g-value-get-flags "g_value_get_flags") guint
    (value (:pointer g-value)))

(defcfun (%g-value-set-string "g_value_set_string") :void
    (value (:pointer g-value))
    (v-string :string))

(defcfun (%g-value-set-static-string "g_value_set_static_string") :void
    (value (:pointer g-value))
    (v-string :string))

(defcfun (%g-value-take-string "g_value_take_string") :void
    (value (:pointer g-value))
    (v-string :string))

(defcfun (%g-value-set-string-take-ownership "g_value_set_string_take_ownership") :void
    (value (:pointer g-value))
    (v-string :string))

(defcfun (%g-value-get-string "g_value_get_string") :string
    (value (:pointer g-value)))

(defcfun (%g-value-dup-string "g_value_dup_string") :string
    (value (:pointer g-value)))

(defcfun (%g-value-set-param "g_value_set_param") :void
    (value (:pointer g-value))
    (param (:pointer g-param-spec)))

(defcfun (%g-value-take-param "g_value_take_param") :void
    (value (:pointer g-value))
    (param (:pointer g-param-spec)))

(defcfun (%g-value-get-param "g_value_get_param") (:pointer g-param-spec)
    (value (:pointer g-value)))

(defcfun (%g-value-dup-param "g_value_dup_param") (:pointer g-param-spec)
    (value (:pointer g-value)))

(defcfun (%g-value-set-boxed "g_value_set_boxed") :void
    (value (:pointer g-value))
    (v-boxed :pointer))

(defcfun (%g-value-set-static-boxed "g_value_set_static_boxed") :void
    (value (:pointer g-value))
    (v-boxed :pointer))

(defcfun (%g-value-take-boxed "g_value_take_boxed") :void
    (value (:pointer g-value))
    (v-boxed :pointer))

(defcfun (%g-value-set-boxed-take-ownership "g_value_set_boxed_take_ownership") :void
    (value (:pointer g-value))
    (v-boxed :pointer))

(defcfun (%g-value-get-boxed "g_value_get_boxed") :pointer
    (value (:pointer g-value)))

(defcfun (%g-value-dup-boxed "g_value_dup_boxed") :pointer
    (value (:pointer g-value)))

(defcfun (%g-value-set-pointer "g_value_set_pointer") :void
    (value (:pointer g-value))
    (v-pointer :pointer))

(defcfun (%g-value-get-pointer "g_value_get_pointer") :pointer
    (value (:pointer g-value)))

(defcfun (%g-value-set-object "g_value_set_object") :void
    (value (:pointer g-value))
    (v-object :pointer))

(defcfun (%g-value-take-object "g_value_take_object") :void
    (value (:pointer g-value))
    (v-object :pointer))

(defcfun (%g-value-set-object-take-ownership "g_value_set_object_take_ownership") :void
    (value (:pointer g-value))
    (v-object :pointer))

(defcfun (%g-value-get-object "g_value_get_object") :pointer
    (value (:pointer g-value)))

(defcfun (%g-value-dup-object "g_value_dup_object") :pointer
    (value (:pointer g-value)))

(defcfun (%g-param-spec-value-array "g_param_spec_value_array") (:pointer g-param-spec)
    (name :string)
    (nick :string)
    (blurb :string)
    (element-spec (:pointer g-param-spec))
    (flags g-param-flags-composite-enum))

(defcfun (%g-value-get-gtype "g_value_get_gtype") g-type
    (value (:pointer g-value)))

(defcfun (%g-value-set-gtype "g_value_set_gtype") :void
    (value (:pointer g-value))
    (v-gtype g-type))

(defcfun (%g-type-from-name "g_type_from_name") g-type
    (name :string))

(defcfun (%g-type-name "g_type_name") :string
    (type g-type))

(defcfun (%g-object-ref "g_object_ref") :pointer
    (object :pointer))

(defcfun (%g-object-unref "g_object_unref") :void
    (object :pointer))

(defcfun (%g-object-ref-sink "g_object_ref_sink") :pointer
    (object :pointer))

(defcfun (%g-object-is-floating "g_object_is_floating") gboolean
    (object :pointer))

(defcfun (%g-object-force-floating "g_object_force_floating") :void
    (object (:pointer g-object)))

(defcfun (%g-object-weak-ref "g_object_weak_ref") :void
    (object (:pointer g-object))
    (notify function-pointer)
    (data :pointer))

(defcfun (%g-object-weak-unref "g_object_weak_unref") :void
    (object (:pointer g-object))
    (notify function-pointer)
    (data :pointer))

(defcfun (%g-object-add-weak-pointer "g_object_add_weak_pointer") :void
    (object (:pointer g-object))
    (weak-pointer-location (:pointer :pointer)))

(defcfun (%g-object-remove-weak-pointer "g_object_remove_weak_pointer") :void
    (object (:pointer g-object))
    (weak-pointer-location (:pointer :pointer)))

(defcfun (%g-object-add-toggle-ref "g_object_add_toggle_ref") :void
    (object (:pointer g-object))
    (notify function-pointer)
    (data :pointer))

(defcfun (%g-object-remove-toggle-ref "g_object_remove_toggle_ref") :void
    (object (:pointer g-object))
    (notify function-pointer)
    (data :pointer))

(defcfun (%g-object-notify "g_object_notify") :void
    (object (:pointer g-object))
    (property-name :string))

(defcfun (%g-object-freeze-notify "g_object_freeze_notify") :void
    (object (:pointer g-object)))

(defcfun (%g-object-thaw-notify "g_object_thaw_notify") :void
    (object (:pointer g-object)))

(defcfun (%g-type-register-static "g_type_register_static") g-type
    (parent-type g-type)
    (type-name :string)
    (info (:pointer g-type-info))
    (flags g-type-flags-composite-enum))

(defcfun (%g-type-register-static-simple "g_type_register_static_simple") g-type
    (parent-type g-type)
    (type-name :string)
    (class-size guint)
    (class-init function-pointer)
    (instance-size guint)
    (instance-init function-pointer)
    (flags g-type-flags-composite-enum))

(defcfun (%g-type-qname "g_type_qname") g-quark
    (type g-type))

(defcfun (%g-type-parent "g_type_parent") g-type
    (type g-type))

(defcfun (%g-type-depth "g_type_depth") guint
    (type g-type))

(defcfun (%g-type-next-base "g_type_next_base") g-type
    (leaf-type g-type)
    (root-type g-type))

(defcfun (%g-type-is-a "g_type_is_a") gboolean
    (type g-type)
    (is-a-type g-type))

(defcfun (%g-type-class-ref "g_type_class_ref") :pointer
    (type g-type))

(defcfun (%g-type-class-peek "g_type_class_peek") :pointer
    (type g-type))

(defcfun (%g-type-class-peek-static "g_type_class_peek_static") :pointer
    (type g-type))

(defcfun (%g-type-class-unref "g_type_class_unref") :void
    (g-class :pointer))

(defcfun (%g-type-class-peek-parent "g_type_class_peek_parent") :pointer
    (g-class :pointer))

(defcfun (%g-type-class-add-private "g_type_class_add_private") :void
    (g-class :pointer)
    (private-size gsize))

(defcfun (%g-type-interface-peek "g_type_interface_peek") :pointer
    (instance-class :pointer)
    (iface-type g-type))

(defcfun (%g-type-interface-peek-parent "g_type_interface_peek_parent") :pointer
    (g-iface :pointer))

(defcfun (%g-type-default-interface-ref "g_type_default_interface_ref") :pointer
    (g-type g-type))

(defcfun (%g-type-default-interface-peek "g_type_default_interface_peek") :pointer
    (g-type g-type))

(defcfun (%g-type-default-interface-unref "g_type_default_interface_unref") :void
    (g-iface :pointer))

(defcfun (%g-type-children "g_type_children") (:pointer g-type)
    (type g-type)
    (n-children (:pointer guint)))

(defcfun (%g-type-interfaces "g_type_interfaces") (:pointer g-type)
    (type g-type)
    (n-interfaces (:pointer guint)))

(defcfun (%g-type-interface-prerequisites "g_type_interface_prerequisites") (:pointer g-type)
    (interface-type g-type)
    (n-prerequisites (:pointer guint)))

(defcfun (%g-type-set-qdata "g_type_set_qdata") :void
    (type g-type)
    (quark g-quark)
    (data :pointer))

(defcfun (%g-type-get-qdata "g_type_get_qdata") :pointer
    (type g-type)
    (quark g-quark))

(defcfun (%g-type-query "g_type_query") :void
    (type g-type)
    (query (:pointer g-type-query)))

(defcfun (%g-type-add-interface-static "g_type_add_interface_static") :void
    (instance-type g-type)
    (interface-type g-type)
    (info (:pointer g-interface-info)))

(defcfun (%g-type-interface-add-prerequisite "g_type_interface_add_prerequisite") :void
    (interface-type g-type)
    (prerequisite-type g-type))

(defcfun (%g-object-class-install-property "g_object_class_install_property") :void
    (oclass (:pointer g-object-class))
    (property-id guint)
    (pspec (:pointer g-param-spec)))

(defcfun (%g-object-class-find-property "g_object_class_find_property") (:pointer g-param-spec)
    (oclass (:pointer g-object-class))
    (property-name :string))

(defcfun (%g-object-class-list-properties "g_object_class_list_properties") :pointer
    (oclass (:pointer g-object-class))
    (n-properties (:pointer guint)))

(defcfun (%g-object-class-override-property "g_object_class_override_property") :void
    (oclass (:pointer g-object-class))
    (property-id guint)
    (name :string))

(defcfun (%g-object-interface-install-property "g_object_interface_install_property") :void
    (g-iface :pointer)
    (pspec (:pointer g-param-spec)))

(defcfun (%g-object-interface-find-property "g_object_interface_find_property") (:pointer g-param-spec)
    (g-iface :pointer)
    (property-name :string))

(defcfun (%g-object-interface-list-properties "g_object_interface_list_properties") :pointer
    (g-iface :pointer)
    (n-properties-p (:pointer guint)))

(defcfun (%g-object-newv "g_object_newv") :pointer
    (object-type g-type)
    (n-parameters guint)
    (parameters (:pointer g-parameter)))
