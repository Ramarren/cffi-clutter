(in-package :cffi-clutter)

(define-foreign-library clutter
  (:unix "/home/ramarren/C/Clutter/clutter-0.9.6/clutter/.libs/libclutter-glx-0.9.so"))

(define-foreign-library glib
  (:unix "/usr/lib/libglib.so"))

(define-foreign-library gobject
  (:unix "/usr/lib/libgobject-2.0.so"))

(use-foreign-library clutter)
(use-foreign-library glib)
(use-foreign-library gobject)

(defun g-signal-connect (instance detailed-signal c-handler &optional (data nil))
  (g-signal-connect-data instance detailed-signal c-handler (if data data (null-pointer)) (null-pointer) 0))

(defcfun (%actor-set-flags "clutter_actor_set_flags") :void
    (self :pointer)
    (flags actor-flags))

(defcfun (%actor-unset-flags "clutter_actor_unset_flags") :void
    (self :pointer)
    (flags actor-flags))

(defcfun (%actor-get-flags "clutter_actor_get_flags") actor-flags
    (self :pointer))

(defcfun (%actor-show "clutter_actor_show") :void
    (self :pointer))

(defcfun (%actor-show-all "clutter_actor_show_all") :void
    (self :pointer))

(defcfun (%actor-hide "clutter_actor_hide") :void
    (self :pointer))

(defcfun (%actor-hide-all "clutter_actor_hide_all") :void
    (self :pointer))

(defcfun (%actor-realize "clutter_actor_realize") :void
    (self :pointer))

(defcfun (%actor-unrealize "clutter_actor_unrealize") :void
    (self :pointer))

(defcfun (%actor-paint "clutter_actor_paint") :void
    (self :pointer))

(defcfun (%actor-queue-redraw "clutter_actor_queue_redraw") :void
    (self :pointer))

(defcfun (%actor-queue-relayout "clutter_actor_queue_relayout") :void
    (self :pointer))

(defcfun (%actor-destroy "clutter_actor_destroy") :void
    (self :pointer))

(defcfun (%actor-event "clutter_actor_event") gboolean
    (actor :pointer)
    (event :pointer)
    (capture gboolean))

(defcfun (%actor-should-pick-paint "clutter_actor_should_pick_paint") gboolean
    (self :pointer))

(defcfun (%actor-map "clutter_actor_map") :void
    (self :pointer))

(defcfun (%actor-unmap "clutter_actor_unmap") :void
    (self :pointer))

(defcfun (%actor-allocate "clutter_actor_allocate") :void
    (self :pointer)
    (box :pointer)
    (flags allocation-flags))

(defcfun (%actor-allocate-preferred-size "clutter_actor_allocate_preferred_size") :void
    (self :pointer)
    (flags allocation-flags))

(defcfun (%actor-allocate-available-size "clutter_actor_allocate_available_size") :void
    (self :pointer)
    (x :float)
    (y :float)
    (available-width :float)
    (available-height :float)
    (flags allocation-flags))

(defcfun (%actor-get-allocation-box "clutter_actor_get_allocation_box") :void
    (self :pointer)
    (box :pointer))

(defcfun (%actor-get-allocation-geometry "clutter_actor_get_allocation_geometry") :void
    (self :pointer)
    (geom :pointer))

(defcfun (%actor-get-allocation-vertices "clutter_actor_get_allocation_vertices") :void
    (self :pointer)
    (ancestor :pointer)
    (verts[4] vertex))

(defcfun (%actor-get-preferred-size "clutter_actor_get_preferred_size") :void
    (self :pointer)
    (min-width-p :pointer)
    (min-height-p :pointer)
    (natural-width-p :pointer)
    (natural-height-p :pointer))

(defcfun (%actor-get-preferred-width "clutter_actor_get_preferred_width") :void
    (self :pointer)
    (for-height :float)
    (min-width-p :pointer)
    (natural-width-p :pointer))

(defcfun (%actor-get-preferred-height "clutter_actor_get_preferred_height") :void
    (self :pointer)
    (for-width :float)
    (min-height-p :pointer)
    (natural-height-p :pointer))

(defcfun (%actor-set-fixed-position-set "clutter_actor_set_fixed_position_set") :void
    (self :pointer)
    (is-set gboolean))

(defcfun (%actor-get-fixed-position-set "clutter_actor_get_fixed_position_set") gboolean
    (self :pointer))

(defcfun (%actor-set-geometry "clutter_actor_set_geometry") :void
    (self :pointer)
    (geometry :pointer))

(defcfun (%actor-get-geometry "clutter_actor_get_geometry") :void
    (self :pointer)
    (geometry :pointer))

(defcfun (%actor-set-size "clutter_actor_set_size") :void
    (self :pointer)
    (width :float)
    (height :float))

(defcfun (%actor-get-size "clutter_actor_get_size") :void
    (self :pointer)
    (width :pointer)
    (height :pointer))

(defcfun (%actor-set-position "clutter_actor_set_position") :void
    (self :pointer)
    (x :float)
    (y :float))

(defcfun (%actor-get-position "clutter_actor_get_position") :void
    (self :pointer)
    (x :pointer)
    (y :pointer))

(defcfun (%actor-set-width "clutter_actor_set_width") :void
    (self :pointer)
    (width :float))

(defcfun (%actor-get-width "clutter_actor_get_width") :float
    (self :pointer))

(defcfun (%actor-set-height "clutter_actor_set_height") :void
    (self :pointer)
    (height :float))

(defcfun (%actor-get-height "clutter_actor_get_height") :float
    (self :pointer))

(defcfun (%actor-set-x "clutter_actor_set_x") :void
    (self :pointer)
    (x :float))

(defcfun (%actor-get-x "clutter_actor_get_x") :float
    (self :pointer))

(defcfun (%actor-set-y "clutter_actor_set_y") :void
    (self :pointer)
    (y :float))

(defcfun (%actor-get-y "clutter_actor_get_y") :float
    (self :pointer))

(defcfun (%actor-move-by "clutter_actor_move_by") :void
    (self :pointer)
    (dx :float)
    (dy :float))

(defcfun (%actor-set-rotation "clutter_actor_set_rotation") :void
    (self :pointer)
    (axis rotate-axis)
    (angle :double)
    (x :float)
    (y :float)
    (z :float))

(defcfun (%actor-set-z-rotation-from-gravity "clutter_actor_set_z_rotation_from_gravity") :void
    (self :pointer)
    (angle :double)
    (gravity gravity))

(defcfun (%actor-get-rotation "clutter_actor_get_rotation") :double
    (self :pointer)
    (axis rotate-axis)
    (x :pointer)
    (y :pointer)
    (z :pointer))

(defcfun (%actor-get-z-rotation-gravity "clutter_actor_get_z_rotation_gravity") gravity
    (self :pointer))

(defcfun (%actor-is-rotated "clutter_actor_is_rotated") gboolean
    (self :pointer))

(defcfun (%actor-set-opacity "clutter_actor_set_opacity") :void
    (self :pointer)
    (opacity guint8))

(defcfun (%actor-get-opacity "clutter_actor_get_opacity") guint8
    (self :pointer))

(defcfun (%actor-set-name "clutter_actor_set_name") :void
    (self :pointer)
    (name :string))

(defcfun (%actor-get-name "clutter_actor_get_name") :string
    (self :pointer))

(defcfun (%actor-get-gid "clutter_actor_get_gid") guint32
    (self :pointer))

(defcfun (%actor-set-clip "clutter_actor_set_clip") :void
    (self :pointer)
    (xoff :float)
    (yoff :float)
    (width :float)
    (height :float))

(defcfun (%actor-remove-clip "clutter_actor_remove_clip") :void
    (self :pointer))

(defcfun (%actor-has-clip "clutter_actor_has_clip") gboolean
    (self :pointer))

(defcfun (%actor-get-clip "clutter_actor_get_clip") :void
    (self :pointer)
    (xoff :pointer)
    (yoff :pointer)
    (width :pointer)
    (height :pointer))

(defcfun (%actor-set-parent "clutter_actor_set_parent") :void
    (self :pointer)
    (parent :pointer))

(defcfun (%actor-get-parent "clutter_actor_get_parent") :pointer
    (self :pointer))

(defcfun (%actor-reparent "clutter_actor_reparent") :void
    (self :pointer)
    (new-parent :pointer))

(defcfun (%actor-unparent "clutter_actor_unparent") :void
    (self :pointer))

(defcfun (%actor-raise "clutter_actor_raise") :void
    (self :pointer)
    (below :pointer))

(defcfun (%actor-lower "clutter_actor_lower") :void
    (self :pointer)
    (above :pointer))

(defcfun (%actor-raise-top "clutter_actor_raise_top") :void
    (self :pointer))

(defcfun (%actor-lower-bottom "clutter_actor_lower_bottom") :void
    (self :pointer))

(defcfun (%actor-get-stage "clutter_actor_get_stage") :pointer
    (actor :pointer))

(defcfun (%actor-set-depth "clutter_actor_set_depth") :void
    (self :pointer)
    (depth :float))

(defcfun (%actor-get-depth "clutter_actor_get_depth") :float
    (self :pointer))

(defcfun (%actor-set-scale "clutter_actor_set_scale") :void
    (self :pointer)
    (scale-x :double)
    (scale-y :double))

(defcfun (%actor-set-scale-full "clutter_actor_set_scale_full") :void
    (self :pointer)
    (scale-x :double)
    (scale-y :double)
    (center-x :float)
    (center-y :float))

(defcfun (%actor-set-scale-with-gravity "clutter_actor_set_scale_with_gravity") :void
    (self :pointer)
    (scale-x :double)
    (scale-y :double)
    (gravity gravity))

(defcfun (%actor-get-scale "clutter_actor_get_scale") :void
    (self :pointer)
    (scale-x :pointer)
    (scale-y :pointer))

(defcfun (%actor-get-scale-center "clutter_actor_get_scale_center") :void
    (self :pointer)
    (center-x :pointer)
    (center-y :pointer))

(defcfun (%actor-get-scale-gravity "clutter_actor_get_scale_gravity") gravity
    (self :pointer))

(defcfun (%actor-is-scaled "clutter_actor_is_scaled") gboolean
    (self :pointer))

(defcfun (%actor-apply-transform-to-point "clutter_actor_apply_transform_to_point") :void
    (self :pointer)
    (point :pointer)
    (vertex :pointer))

(defcfun (%actor-transform-stage-point "clutter_actor_transform_stage_point") gboolean
    (self :pointer)
    (x :float)
    (y :float)
    (x-out :pointer)
    (y-out :pointer))

(defcfun (%actor-apply-relative-transform-to-point "clutter_actor_apply_relative_transform_to_point") :void
    (self :pointer)
    (ancestor :pointer)
    (point :pointer)
    (vertex :pointer))

(defcfun (%actor-get-transformed-position "clutter_actor_get_transformed_position") :void
    (self :pointer)
    (x :pointer)
    (y :pointer))

(defcfun (%actor-get-transformed-size "clutter_actor_get_transformed_size") :void
    (self :pointer)
    (width :pointer)
    (height :pointer))

(defcfun (%actor-get-paint-opacity "clutter_actor_get_paint_opacity") guint8
    (self :pointer))

(defcfun (%actor-get-paint-visibility "clutter_actor_get_paint_visibility") gboolean
    (self :pointer))

(defcfun (%actor-get-abs-allocation-vertices "clutter_actor_get_abs_allocation_vertices") :void
    (self :pointer)
    (verts[4] vertex))

(defcfun (%actor-get-transformation-matrix "clutter_actor_get_transformation_matrix") :void
    (self :pointer)
    (matrix :pointer))

(defcfun (%actor-set-anchor-point "clutter_actor_set_anchor_point") :void
    (self :pointer)
    (anchor-x :float)
    (anchor-y :float))

(defcfun (%actor-get-anchor-point "clutter_actor_get_anchor_point") :void
    (self :pointer)
    (anchor-x :pointer)
    (anchor-y :pointer))

(defcfun (%actor-set-anchor-point-from-gravity "clutter_actor_set_anchor_point_from_gravity") :void
    (self :pointer)
    (gravity gravity))

(defcfun (%actor-get-anchor-point-gravity "clutter_actor_get_anchor_point_gravity") gravity
    (self :pointer))

(defcfun (%actor-move-anchor-point "clutter_actor_move_anchor_point") :void
    (self :pointer)
    (anchor-x :float)
    (anchor-y :float))

(defcfun (%actor-move-anchor-point-from-gravity "clutter_actor_move_anchor_point_from_gravity") :void
    (self :pointer)
    (gravity gravity))

(defcfun (%actor-set-reactive "clutter_actor_set_reactive") :void
    (actor :pointer)
    (reactive gboolean))

(defcfun (%actor-get-reactive "clutter_actor_get_reactive") gboolean
    (actor :pointer))

(defcfun (%actor-set-shader "clutter_actor_set_shader") gboolean
    (self :pointer)
    (shader :pointer))

(defcfun (%actor-get-shader "clutter_actor_get_shader") :pointer
    (self :pointer))

(defcfun (%actor-set-shader-param "clutter_actor_set_shader_param") :void
    (self :pointer)
    (param :string)
    (value :pointer))

(defcfun (%actor-set-shader-param-float "clutter_actor_set_shader_param_float") :void
    (self :pointer)
    (param :string)
    (value :float))

(defcfun (%actor-set-shader-param-int "clutter_actor_set_shader_param_int") :void
    (self :pointer)
    (param :string)
    (value gint))

(defcfun (%actor-grab-key-focus "clutter_actor_grab_key_focus") :void
    (self :pointer))

(defcfun (%actor-get-pango-context "clutter_actor_get_pango_context") :pointer
    (self :pointer))

(defcfun (%actor-create-pango-context "clutter_actor_create_pango_context") :pointer
    (self :pointer))

(defcfun (%actor-create-pango-layout "clutter_actor_create_pango_layout") :pointer
    (self :pointer)
    (text :string))

(defcfun (%actor-box-new "clutter_actor_box_new") :pointer
    (x-1 :float)
    (y-1 :float)
    (x-2 :float)
    (y-2 :float))

(defcfun (%actor-box-copy "clutter_actor_box_copy") :pointer
    (box :pointer))

(defcfun (%actor-box-free "clutter_actor_box_free") :void
    (box :pointer))

(defcfun (%actor-box-equal "clutter_actor_box_equal") gboolean
    (box-a :pointer)
    (box-b :pointer))

(defcfun (%actor-box-get-x "clutter_actor_box_get_x") :float
    (box :pointer))

(defcfun (%actor-box-get-y "clutter_actor_box_get_y") :float
    (box :pointer))

(defcfun (%actor-box-get-width "clutter_actor_box_get_width") :float
    (box :pointer))

(defcfun (%actor-box-get-height "clutter_actor_box_get_height") :float
    (box :pointer))

(defcfun (%actor-box-get-origin "clutter_actor_box_get_origin") :void
    (box :pointer)
    (x :pointer)
    (y :pointer))

(defcfun (%actor-box-get-size "clutter_actor_box_get_size") :void
    (box :pointer)
    (width :pointer)
    (height :pointer))

(defcfun (%actor-box-get-area "clutter_actor_box_get_area") :float
    (box :pointer))

(defcfun (%actor-box-contains "clutter_actor_box_contains") gboolean
    (box :pointer)
    (x :float)
    (y :float))

(defcfun (%actor-box-from-vertices "clutter_actor_box_from_vertices") :void
    (box :pointer)
    (verts :pointer))

(defcfun (%vertex-new "clutter_vertex_new") :pointer
    (x :float)
    (y :float)
    (z :float))

(defcfun (%vertex-copy "clutter_vertex_copy") :pointer
    (vertex :pointer))

(defcfun (%vertex-free "clutter_vertex_free") :void
    (vertex :pointer))

(defcfun (%vertex-equal "clutter_vertex_equal") gboolean
    (vertex-a :pointer)
    (vertex-b :pointer))

(defcfun (%container-add-actor "clutter_container_add_actor") :void
    (container :pointer)
    (actor :pointer))

(defcfun (%container-add-valist "clutter_container_add_valist") :void
    (container :pointer)
    (first-actor :pointer)
    (var-args va-list))

(defcfun (%container-remove-actor "clutter_container_remove_actor") :void
    (container :pointer)
    (actor :pointer))

(defcfun (%container-remove-valist "clutter_container_remove_valist") :void
    (container :pointer)
    (first-actor :pointer)
    (var-args va-list))

(defcfun (%container-get-children "clutter_container_get_children") :pointer
    (container :pointer))

(defcfun (%container-foreach "clutter_container_foreach") :void
    (container :pointer)
    (callback :pointer)
    (user-data :pointer))

(defcfun (%container-foreach-with-internals "clutter_container_foreach_with_internals") :void
    (container :pointer)
    (callback :pointer)
    (user-data :pointer))

(defcfun (%container-find-child-by-name "clutter_container_find_child_by_name") :pointer
    (container :pointer)
    (child-name :string))

(defcfun (%container-raise-child "clutter_container_raise_child") :void
    (container :pointer)
    (actor :pointer)
    (sibling :pointer))

(defcfun (%container-lower-child "clutter_container_lower_child") :void
    (container :pointer)
    (actor :pointer)
    (sibling :pointer))

(defcfun (%container-sort-depth-order "clutter_container_sort_depth_order") :void
    (container :pointer))

(defcfun (%container-class-find-child-property "clutter_container_class_find_child_property") :pointer
    (klass :pointer)
    (property-name :string))

(defcfun (%container-class-list-child-properties "clutter_container_class_list_child_properties") :pointer
    (klass :pointer)
    (n-properties :pointer))

(defcfun (%container-child-set-property "clutter_container_child_set_property") :void
    (container :pointer)
    (child :pointer)
    (property :string)
    (value :pointer))

(defcfun (%container-child-get-property "clutter_container_child_get_property") :void
    (container :pointer)
    (child :pointer)
    (property :string)
    (value :pointer))

(defcfun (%container-get-child-meta "clutter_container_get_child_meta") :pointer
    (container :pointer)
    (actor :pointer))

(defcfun (%child-meta-get-container "clutter_child_meta_get_container") :pointer
    (data :pointer))

(defcfun (%child-meta-get-actor "clutter_child_meta_get_actor") :pointer
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

(defcfun (%rectangle-new "clutter_rectangle_new") :pointer)

(defcfun (%rectangle-new-with-color "clutter_rectangle_new_with_color") :pointer
    (color :pointer))

(defcfun (%rectangle-get-color "clutter_rectangle_get_color") :void
    (rectangle :pointer)
    (color :pointer))

(defcfun (%rectangle-set-color "clutter_rectangle_set_color") :void
    (rectangle :pointer)
    (color :pointer))

(defcfun (%rectangle-get-border-color "clutter_rectangle_get_border_color") :void
    (rectangle :pointer)
    (color :pointer))

(defcfun (%rectangle-set-border-color "clutter_rectangle_set_border_color") :void
    (rectangle :pointer)
    (color :pointer))

(defcfun (%rectangle-get-border-width "clutter_rectangle_get_border_width") guint
    (rectangle :pointer))

(defcfun (%rectangle-set-border-width "clutter_rectangle_set_border_width") :void
    (rectangle :pointer)
    (width guint))

(defcfun (%texture-new "clutter_texture_new") :pointer)

(defcfun (%texture-new-from-file "clutter_texture_new_from_file") :pointer
    (filename :string)
    (error :pointer))

(defcfun (%texture-new-from-actor "clutter_texture_new_from_actor") :pointer
    (actor :pointer))

(defcfun (%texture-set-from-file "clutter_texture_set_from_file") gboolean
    (texture :pointer)
    (filename :string)
    (error :pointer))

(defcfun (%texture-set-from-rgb-data "clutter_texture_set_from_rgb_data") gboolean
    (texture :pointer)
    (data :pointer)
    (has-alpha gboolean)
    (width gint)
    (height gint)
    (rowstride gint)
    (bpp gint)
    (flags texture-flags)
    (error :pointer))

(defcfun (%texture-set-from-yuv-data "clutter_texture_set_from_yuv_data") gboolean
    (texture :pointer)
    (data :pointer)
    (width gint)
    (height gint)
    (flags texture-flags)
    (error :pointer))

(defcfun (%texture-set-area-from-rgb-data "clutter_texture_set_area_from_rgb_data") gboolean
    (texture :pointer)
    (data :pointer)
    (has-alpha gboolean)
    (x gint)
    (y gint)
    (width gint)
    (height gint)
    (rowstride gint)
    (bpp gint)
    (flags texture-flags)
    (error :pointer))

(defcfun (%texture-get-base-size "clutter_texture_get_base_size") :void
    (texture :pointer)
    (width :pointer)
    (height :pointer))

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
    (repeat-x :pointer)
    (repeat-y :pointer))

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

(defcfun (%clone-new "clutter_clone_new") :pointer
    (source :pointer))

(defcfun (%clone-set-source "clutter_clone_set_source") :void
    (clone :pointer)
    (source :pointer))

(defcfun (%clone-get-source "clutter_clone_get_source") :pointer
    (clone :pointer))

(defcfun (%text-new "clutter_text_new") :pointer)

(defcfun (%text-new-full "clutter_text_new_full") :pointer
    (font-name :string)
    (text :string)
    (color :pointer))

(defcfun (%text-new-with-text "clutter_text_new_with_text") :pointer
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
    (color :pointer))

(defcfun (%text-get-color "clutter_text_get_color") :void
    (self :pointer)
    (color :pointer))

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
    (color :pointer))

(defcfun (%text-get-cursor-color "clutter_text_get_cursor_color") :void
    (self :pointer)
    (color :pointer))

(defcfun (%text-set-selection-color "clutter_text_set_selection_color") :void
    (self :pointer)
    (color :pointer))

(defcfun (%text-get-selection-color "clutter_text_get_selection_color") :void
    (self :pointer)
    (color :pointer))

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
    (x :pointer)
    (y :pointer)
    (line-height :pointer))

(defcfun (%cairo-texture-new "clutter_cairo_texture_new") :pointer
    (width guint)
    (height guint))

(defcfun (%cairo-texture-set-surface-size "clutter_cairo_texture_set_surface_size") :void
    (self :pointer)
    (width guint)
    (height guint))

(defcfun (%cairo-texture-get-surface-size "clutter_cairo_texture_get_surface_size") :void
    (self :pointer)
    (width :pointer)
    (height :pointer))

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
    (color :pointer))

(defcfun (%group-new "clutter_group_new") :pointer)

(defcfun (%group-remove-all "clutter_group_remove_all") :void
    (group :pointer))

(defcfun (%group-get-n-children "clutter_group_get_n_children") gint
    (self :pointer))

(defcfun (%group-get-nth-child "clutter_group_get_nth_child") :pointer
    (self :pointer)
    (index- gint))

(defcfun (%stage-get-default "clutter_stage_get_default") :pointer)

(defcfun (%stage-new "clutter_stage_new") :pointer)

(defcfun (%stage-is-default "clutter_stage_is_default") gboolean
    (stage :pointer))

(defcfun (%stage-set-color "clutter_stage_set_color") :void
    (stage :pointer)
    (color :pointer))

(defcfun (%stage-get-color "clutter_stage_get_color") :void
    (stage :pointer)
    (color :pointer))

(defcfun (%stage-set-fullscreen "clutter_stage_set_fullscreen") :void
    (stage :pointer)
    (fullscreen gboolean))

(defcfun (%stage-get-fullscreen "clutter_stage_get_fullscreen") gboolean
    (stage :pointer))

(defcfun (%stage-show-cursor "clutter_stage_show_cursor") :void
    (stage :pointer))

(defcfun (%stage-hide-cursor "clutter_stage_hide_cursor") :void
    (stage :pointer))

(defcfun (%stage-get-actor-at-pos "clutter_stage_get_actor_at_pos") :pointer
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
    (actor :pointer))

(defcfun (%stage-get-key-focus "clutter_stage_get_key_focus") :pointer
    (stage :pointer))

(defcfun (%stage-read-pixels "clutter_stage_read_pixels") :pointer
    (stage :pointer)
    (x gint)
    (y gint)
    (width gint)
    (height gint))

(defcfun (%stage-set-perspective "clutter_stage_set_perspective") :void
    (stage :pointer)
    (perspective :pointer))

(defcfun (%stage-get-perspective "clutter_stage_get_perspective") :void
    (stage :pointer)
    (perspective :pointer))

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
    (n-markers :pointer))

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
    (func :pointer)
    (data :pointer)
    (destroy :pointer))

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
    (func :pointer)
    (data :pointer)
    (destroy :pointer))

(defcfun (%alpha-set-closure "clutter_alpha_set_closure") :void
    (alpha :pointer)
    (closure :pointer))

(defcfun (%alpha-register-closure "clutter_alpha_register_closure") gulong
    (closure :pointer))

(defcfun (%alpha-register-func "clutter_alpha_register_func") gulong
    (func :pointer)
    (data :pointer))

(defcfun (%behaviour-apply "clutter_behaviour_apply") :void
    (behave :pointer)
    (actor :pointer))

(defcfun (%behaviour-remove "clutter_behaviour_remove") :void
    (behave :pointer)
    (actor :pointer))

(defcfun (%behaviour-remove-all "clutter_behaviour_remove_all") :void
    (behave :pointer))

(defcfun (%behaviour-is-applied "clutter_behaviour_is_applied") gboolean
    (behave :pointer)
    (actor :pointer))

(defcfun (%behaviour-actors-foreach "clutter_behaviour_actors_foreach") :void
    (behave :pointer)
    (func :pointer)
    (data :pointer))

(defcfun (%behaviour-get-actors "clutter_behaviour_get_actors") :pointer
    (behave :pointer))

(defcfun (%behaviour-get-n-actors "clutter_behaviour_get_n_actors") gint
    (behave :pointer))

(defcfun (%behaviour-get-nth-actor "clutter_behaviour_get_nth_actor") :pointer
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
    (depth-start :pointer)
    (depth-end :pointer))

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
    (x :pointer)
    (y :pointer))

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
    (angle-tilt-x :pointer)
    (angle-tilt-y :pointer)
    (angle-tilt-z :pointer))

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
    (opacity-start :pointer)
    (opacity-end :pointer))

(defcfun (%behaviour-path-new "clutter_behaviour_path_new") :pointer
    (alpha :pointer)
    (path :pointer))

(defcfun (%behaviour-path-new-with-description "clutter_behaviour_path_new_with_description") :pointer
    (alpha :pointer)
    (desc :string))

(defcfun (%behaviour-path-new-with-knots "clutter_behaviour_path_new_with_knots") :pointer
    (alpha :pointer)
    (knots :pointer)
    (n-knots guint))

(defcfun (%behaviour-path-set-path "clutter_behaviour_path_set_path") :void
    (pathb :pointer)
    (path :pointer))

(defcfun (%behaviour-path-get-path "clutter_behaviour_path_get_path") :pointer
    (pathb :pointer))

(defcfun (%knot-copy "clutter_knot_copy") :pointer
    (knot :pointer))

(defcfun (%knot-free "clutter_knot_free") :void
    (knot :pointer))

(defcfun (%knot-equal "clutter_knot_equal") gboolean
    (knot-a :pointer)
    (knot-b :pointer))

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
    (callback :pointer)
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
    (position :pointer))

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
    (angle-start :pointer)
    (angle-end :pointer))

(defcfun (%behaviour-rotate-set-center "clutter_behaviour_rotate_set_center") :void
    (rotate :pointer)
    (x gint)
    (y gint)
    (z gint))

(defcfun (%behaviour-rotate-get-center "clutter_behaviour_rotate_get_center") :void
    (rotate :pointer)
    (x :pointer)
    (y :pointer)
    (z :pointer))

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
    (x-scale-start :pointer)
    (y-scale-start :pointer)
    (x-scale-end :pointer)
    (y-scale-end :pointer))

(defcfun (%interval-new-with-values "clutter_interval_new_with_values") :pointer
    (gtype g-type)
    (initial :pointer)
    (final :pointer))

(defcfun (%interval-clone "clutter_interval_clone") :pointer
    (interval :pointer))

(defcfun (%interval-get-value-type "clutter_interval_get_value_type") g-type
    (interval :pointer))

(defcfun (%interval-set-initial-value "clutter_interval_set_initial_value") :void
    (interval :pointer)
    (value :pointer))

(defcfun (%interval-get-initial-value "clutter_interval_get_initial_value") :void
    (interval :pointer)
    (value :pointer))

(defcfun (%interval-peek-initial-value "clutter_interval_peek_initial_value") :pointer
    (interval :pointer))

(defcfun (%interval-set-final-value "clutter_interval_set_final_value") :void
    (interval :pointer)
    (value :pointer))

(defcfun (%interval-get-final-value "clutter_interval_get_final_value") :void
    (interval :pointer)
    (value :pointer))

(defcfun (%interval-peek-final-value "clutter_interval_peek_final_value") :pointer
    (interval :pointer))

(defcfun (%interval-compute-value "clutter_interval_compute_value") gboolean
    (interval :pointer)
    (factor :double)
    (value :pointer))

(defcfun (%interval-validate "clutter_interval_validate") gboolean
    (interval :pointer)
    (pspec :pointer))

(defcfun (%interval-register-progress-func "clutter_interval_register_progress_func") :void
    (value-type g-type)
    (func :pointer))

(defcfun (%animation-new "clutter_animation_new") :pointer)

(defcfun (%animation-set-object "clutter_animation_set_object") :void
    (animation :pointer)
    (object :pointer))

(defcfun (%animation-get-object "clutter_animation_get_object") :pointer
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
    (final :pointer))

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
    (actor :pointer)
    (mode gulong)
    (duration guint)
    (n-properties gint)
    (properties :pointer)
    (values :pointer))

(defcfun (%actor-animate-with-timelinev "clutter_actor_animate_with_timelinev") :pointer
    (actor :pointer)
    (mode gulong)
    (timeline :pointer)
    (n-properties gint)
    (properties :pointer)
    (values :pointer))

(defcfun (%actor-animate-with-alphav "clutter_actor_animate_with_alphav") :pointer
    (actor :pointer)
    (alpha :pointer)
    (n-properties gint)
    (properties :pointer)
    (values :pointer))

(defcfun (%actor-get-animation "clutter_actor_get_animation") :pointer
    (actor :pointer))

(defcfun (%animatable-animate-property "clutter_animatable_animate_property") gboolean
    (animatable :pointer)
    (animation :pointer)
    (property-name :string)
    (initial-value :pointer)
    (final-value :pointer)
    (progress :double)
    (value :pointer))

(defcfun (%color-new "clutter_color_new") :pointer
    (red guint8)
    (green guint8)
    (blue guint8)
    (alpha guint8))

(defcfun (%color-copy "clutter_color_copy") :pointer
    (color :pointer))

(defcfun (%color-free "clutter_color_free") :void
    (color :pointer))

(defcfun (%color-equal "clutter_color_equal") gboolean
    (v1 :pointer)
    (v2 :pointer))

(defcfun (%color-hash "clutter_color_hash") guint
    (v :pointer))

(defcfun (%color-from-string "clutter_color_from_string") gboolean
    (color :pointer)
    (str :string))

(defcfun (%color-to-string "clutter_color_to_string") :string
    (color :pointer))

(defcfun (%color-from-hls "clutter_color_from_hls") :void
    (color :pointer)
    (hue :float)
    (luminance :float)
    (saturation :float))

(defcfun (%color-to-hls "clutter_color_to_hls") :void
    (color :pointer)
    (hue :pointer)
    (luminance :pointer)
    (saturation :pointer))

(defcfun (%color-from-pixel "clutter_color_from_pixel") :void
    (color :pointer)
    (pixel guint32))

(defcfun (%color-to-pixel "clutter_color_to_pixel") guint32
    (color :pointer))

(defcfun (%color-add "clutter_color_add") :void
    (a :pointer)
    (b :pointer)
    (result :pointer))

(defcfun (%color-subtract "clutter_color_subtract") :void
    (a :pointer)
    (b :pointer)
    (result :pointer))

(defcfun (%color-lighten "clutter_color_lighten") :void
    (color :pointer)
    (result :pointer))

(defcfun (%color-darken "clutter_color_darken") :void
    (color :pointer)
    (result :pointer))

(defcfun (%color-shade "clutter_color_shade") :void
    (color :pointer)
    (factor :double)
    (result :pointer))

(defcfun (%param-spec-color "clutter_param_spec_color") :pointer
    (name :string)
    (nick :string)
    (blurb :string)
    (default-value :pointer)
    (flags g-param-flags))

(defcfun (%value-set-color "clutter_value_set_color") :void
    (value :pointer)
    (color :pointer))

(defcfun (%value-get-color "clutter_value_get_color") :pointer
    (value :pointer))

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
    (modifiers modifier-type)
    (callback :pointer)
    (data :pointer)
    (notify :pointer))

(defcfun (%binding-pool-install-closure "clutter_binding_pool_install_closure") :void
    (pool :pointer)
    (action-name :string)
    (key-val guint)
    (modifiers modifier-type)
    (closure :pointer))

(defcfun (%binding-pool-override-action "clutter_binding_pool_override_action") :void
    (pool :pointer)
    (key-val guint)
    (modifiers modifier-type)
    (callback :pointer)
    (data :pointer)
    (notify :pointer))

(defcfun (%binding-pool-override-closure "clutter_binding_pool_override_closure") :void
    (pool :pointer)
    (key-val guint)
    (modifiers modifier-type)
    (closure :pointer))

(defcfun (%binding-pool-find-action "clutter_binding_pool_find_action") :string
    (pool :pointer)
    (key-val guint)
    (modifiers modifier-type))

(defcfun (%binding-pool-remove-action "clutter_binding_pool_remove_action") :void
    (pool :pointer)
    (key-val guint)
    (modifiers modifier-type))

(defcfun (%binding-pool-block-action "clutter_binding_pool_block_action") :void
    (pool :pointer)
    (action-name :string))

(defcfun (%binding-pool-unblock-action "clutter_binding_pool_unblock_action") :void
    (pool :pointer)
    (action-name :string))

(defcfun (%binding-pool-activate "clutter_binding_pool_activate") gboolean
    (pool :pointer)
    (key-val guint)
    (modifiers modifier-type)
    (gobject :pointer))

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
    (x :pointer)
    (y :pointer))

(defcfun (%event-get-state "clutter_event_get_state") modifier-type
    (event :pointer))

(defcfun (%event-get-time "clutter_event_get_time") guint32
    (event :pointer))

(defcfun (%event-get-source "clutter_event_get_source") :pointer
    (event :pointer))

(defcfun (%event-get-stage "clutter_event_get_stage") :pointer
    (event :pointer))

(defcfun (%event-get-flags "clutter_event_get_flags") event-flags
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

(defcfun (%event-get-related "clutter_event_get_related") :pointer
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
    (argc :pointer)
    (argv :pointer))

(defcfun (%init-with-args "clutter_init_with_args") init-error
    (argc :pointer)
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

(defcfun (%get-actor-by-gid "clutter_get_actor_by_gid") :pointer
    (id guint32))

(defcfun (%set-default-frame-rate "clutter_set_default_frame_rate") :void
    (frames-per-sec guint))

(defcfun (%get-default-frame-rate "clutter_get_default_frame_rate") guint)

(defcfun (%set-motion-events-enabled "clutter_set_motion_events_enabled") :void
    (enable gboolean))

(defcfun (%get-motion-events-enabled "clutter_get_motion_events_enabled") gboolean)

(defcfun (%clear-glyph-cache "clutter_clear_glyph_cache") :void)

(defcfun (%set-font-flags "clutter_set_font_flags") :void
    (flags font-flags))

(defcfun (%get-font-flags "clutter_get_font_flags") font-flags)

(defcfun (%get-font-map "clutter_get_font_map") :pointer)

(defcfun (%threads-set-lock-functions "clutter_threads_set_lock_functions") :void
    (enter-fn :pointer)
    (leave-fn :pointer))

(defcfun (%threads-init "clutter_threads_init") :void)

(defcfun (%threads-enter "clutter_threads_enter") :void)

(defcfun (%threads-leave "clutter_threads_leave") :void)

(defcfun (%threads-add-idle "clutter_threads_add_idle") guint
    (func :pointer)
    (data :pointer))

(defcfun (%threads-add-idle-full "clutter_threads_add_idle_full") guint
    (priority gint)
    (func :pointer)
    (data :pointer)
    (notify :pointer))

(defcfun (%threads-add-timeout "clutter_threads_add_timeout") guint
    (interval guint)
    (func :pointer)
    (data :pointer))

(defcfun (%threads-add-timeout-full "clutter_threads_add_timeout_full") guint
    (priority gint)
    (interval guint)
    (func :pointer)
    (data :pointer)
    (notify :pointer))

(defcfun (%threads-add-frame-source "clutter_threads_add_frame_source") guint
    (fps guint)
    (func :pointer)
    (data :pointer))

(defcfun (%threads-add-frame-source-full "clutter_threads_add_frame_source_full") guint
    (priority gint)
    (fps guint)
    (func :pointer)
    (data :pointer)
    (notify :pointer))

(defcfun (%threads-add-repaint-func "clutter_threads_add_repaint_func") guint
    (func :pointer)
    (data :pointer)
    (notify :pointer))

(defcfun (%threads-remove-repaint-func "clutter_threads_remove_repaint_func") :void
    (handle-id guint))

(defcfun (%get-keyboard-grab "clutter_get_keyboard_grab") :pointer)

(defcfun (%get-pointer-grab "clutter_get_pointer_grab") :pointer)

(defcfun (%grab-keyboard "clutter_grab_keyboard") :void
    (actor :pointer))

(defcfun (%grab-pointer "clutter_grab_pointer") :void
    (actor :pointer))

(defcfun (%ungrab-keyboard "clutter_ungrab_keyboard") :void)

(defcfun (%ungrab-pointer "clutter_ungrab_pointer") :void)

(defcfun (%grab-pointer-for-device "clutter_grab_pointer_for_device") :void
    (actor :pointer)
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
    (value :pointer))

(defcfun (%shader-get-cogl-program "clutter_shader_get_cogl_program") cogl-handle
    (shader :pointer))

(defcfun (%shader-get-cogl-fragment-shader "clutter_shader_get_cogl_fragment_shader") cogl-handle
    (shader :pointer))

(defcfun (%shader-get-cogl-vertex-shader "clutter_shader_get_cogl_vertex_shader") cogl-handle
    (shader :pointer))

(defcfun (%value-set-shader-float "clutter_value_set_shader_float") :void
    (value :pointer)
    (size gint)
    (floats :pointer))

(defcfun (%value-get-shader-float "clutter_value_get_shader_float") :pointer
    (value :pointer)
    (length :pointer))

(defcfun (%value-set-shader-int "clutter_value_set_shader_int") :void
    (value :pointer)
    (size gint)
    (ints :pointer))

(defcfun (%value-get-shader-int "clutter_value_get_shader_int") :pointer
    (value :pointer)
    (length :pointer))

(defcfun (%value-set-shader-matrix "clutter_value_set_shader_matrix") :void
    (value :pointer)
    (size gint)
    (matrix :pointer))

(defcfun (%value-get-shader-matrix "clutter_value_get_shader_matrix") :pointer
    (value :pointer)
    (length :pointer))

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

(defcfun (%param-spec-units "clutter_param_spec_units") :pointer
    (name :string)
    (nick :string)
    (blurb :string)
    (default-type unit-type)
    (minimum :float)
    (maximum :float)
    (default-value :float)
    (flags g-param-flags))

(defcfun (%value-set-units "clutter_value_set_units") :void
    (value :pointer)
    (units :pointer))

(defcfun (%value-get-units "clutter_value_get_units") :pointer
    (value :pointer))

(defcfun (%util-next-p2 "clutter_util_next_p2") :int
    (a :int))

(defcfun (%timeout-pool-new "clutter_timeout_pool_new") :pointer
    (priority gint))

(defcfun (%timeout-pool-add "clutter_timeout_pool_add") guint
    (pool :pointer)
    (fps guint)
    (func :pointer)
    (data :pointer)
    (notify :pointer))

(defcfun (%timeout-pool-remove "clutter_timeout_pool_remove") :void
    (pool :pointer)
    (id guint))

(defcfun (%frame-source-add "clutter_frame_source_add") guint
    (fps guint)
    (func :pointer)
    (data :pointer))

(defcfun (%frame-source-add-full "clutter_frame_source_add_full") guint
    (priority gint)
    (fps guint)
    (func :pointer)
    (data :pointer)
    (notify :pointer))

(defcfun (%param-spec-fixed "clutter_param_spec_fixed") :pointer
    (name :string)
    (nick :string)
    (blurb :string)
    (minimum cogl-fixed)
    (maximum cogl-fixed)
    (default-value cogl-fixed)
    (flags g-param-flags))

(defcfun (%value-set-fixed "clutter_value_set_fixed") :void
    (value :pointer)
    (fixed- cogl-fixed))

(defcfun (%value-get-fixed "clutter_value_get_fixed") cogl-fixed
    (value :pointer))

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

(defcfun (%script-get-object "clutter_script_get_object") :pointer
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
    (func :pointer)
    (user-data :pointer))

(defcfun (%script-get-type-from-name "clutter_script_get_type_from_name") g-type
    (script :pointer)
    (type-name :string))

(defcfun (%get-script-id "clutter_get_script_id") :string
    (gobject :pointer))

(defcfun (%scriptable-set-id "clutter_scriptable_set_id") :void
    (scriptable :pointer)
    (id :string))

(defcfun (%scriptable-get-id "clutter_scriptable_get_id") :string
    (scriptable :pointer))

(defcfun (%scriptable-parse-custom-node "clutter_scriptable_parse_custom_node") gboolean
    (scriptable :pointer)
    (script :pointer)
    (value :pointer)
    (name :string)
    (node :pointer))

(defcfun (%scriptable-set-custom-property "clutter_scriptable_set_custom_property") :void
    (scriptable :pointer)
    (script :pointer)
    (name :string)
    (value :pointer))

(defcfun (%model-set-names "clutter_model_set_names") :void
    (model :pointer)
    (n-columns guint)
    (names :pointer))

(defcfun (%model-set-types "clutter_model_set_types") :void
    (model :pointer)
    (n-columns guint)
    (types :pointer))

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
    (columns :pointer)
    (values :pointer))

(defcfun (%model-prependv "clutter_model_prependv") :void
    (model :pointer)
    (n-columns guint)
    (columns :pointer)
    (values :pointer))

(defcfun (%model-insertv "clutter_model_insertv") :void
    (model :pointer)
    (row guint)
    (n-columns guint)
    (columns :pointer)
    (values :pointer))

(defcfun (%model-insert-value "clutter_model_insert_value") :void
    (model :pointer)
    (row guint)
    (column guint)
    (value :pointer))

(defcfun (%model-remove "clutter_model_remove") :void
    (model :pointer)
    (row guint))

(defcfun (%model-foreach "clutter_model_foreach") :void
    (model :pointer)
    (func :pointer)
    (user-data :pointer))

(defcfun (%model-set-sorting-column "clutter_model_set_sorting_column") :void
    (model :pointer)
    (column gint))

(defcfun (%model-get-sorting-column "clutter_model_get_sorting_column") gint
    (model :pointer))

(defcfun (%model-set-sort "clutter_model_set_sort") :void
    (model :pointer)
    (column guint)
    (func :pointer)
    (user-data :pointer)
    (notify :pointer))

(defcfun (%model-resort "clutter_model_resort") :void
    (model :pointer))

(defcfun (%model-set-filter "clutter_model_set_filter") :void
    (model :pointer)
    (func :pointer)
    (user-data :pointer)
    (notify :pointer))

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

(defcfun (%model-iter-get-valist "clutter_model_iter_get_valist") :void
    (iter :pointer)
    (args va-list))

(defcfun (%model-iter-get-value "clutter_model_iter_get_value") :void
    (iter :pointer)
    (column guint)
    (value :pointer))

(defcfun (%model-iter-set-valist "clutter_model_iter_set_valist") :void
    (iter :pointer)
    (args va-list))

(defcfun (%model-iter-set-value "clutter_model_iter_set_value") :void
    (iter :pointer)
    (column guint)
    (value :pointer))

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
    (types :pointer)
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

(defcfun (%g-object-set-property "g_object_set_property") :void
    (object :pointer)
    (property-name :string)
    (value :pointer))

(defcfun (%g-object-get-property "g_object_get_property") :void
    (object :pointer)
    (property-name :string)
    (value :pointer))

(defcfun (%g-signal-connect-data "g_signal_connect_data") gulong
    (instance :pointer)
    (detailed-signal :string)
    (c-handler :pointer)
    (data :pointer)
    (destroy-data :pointer)
    (connect-flags g-connect-flags))

(defcfun (%g-value-init "g_value_init") :pointer
    (value :pointer)
    (g-type g-type))

(defcfun (%g-value-copy "g_value_copy") :void
    (src-value :pointer)
    (dest-value :pointer))

(defcfun (%g-value-reset "g_value_reset") :pointer
    (value :pointer))

(defcfun (%g-value-unset "g_value_unset") :void
    (value :pointer))

(defcfun (%g-value-set-instance "g_value_set_instance") :void
    (value :pointer)
    (instance :pointer))

(defcfun (%g-value-fits-pointer "g_value_fits_pointer") gboolean
    (value :pointer))

(defcfun (%g-value-peek-pointer "g_value_peek_pointer") :pointer
    (value :pointer))

(defcfun (%g-value-type-compatible "g_value_type_compatible") gboolean
    (src-type g-type)
    (dest-type g-type))

(defcfun (%g-value-type-transformable "g_value_type_transformable") gboolean
    (src-type g-type)
    (dest-type g-type))

(defcfun (%g-value-transform "g_value_transform") gboolean
    (src-value :pointer)
    (dest-value :pointer))

(defcfun (%g-value-register-transform-func "g_value_register_transform_func") :void
    (src-type g-type)
    (dest-type g-type)
    (transform-func :pointer))

(defcfun (%g-strdup-value-contents "g_strdup_value_contents") :string
    (value :pointer))

(defcfun (%g-value-set-boolean "g_value_set_boolean") :void
    (value :pointer)
    (v-boolean gboolean))

(defcfun (%g-value-get-boolean "g_value_get_boolean") gboolean
    (value :pointer))

(defcfun (%g-value-set-char "g_value_set_char") :void
    (value :pointer)
    (v-char gchar))

(defcfun (%g-value-get-char "g_value_get_char") gchar
    (value :pointer))

(defcfun (%g-value-set-uchar "g_value_set_uchar") :void
    (value :pointer)
    (v-uchar guchar))

(defcfun (%g-value-get-uchar "g_value_get_uchar") guchar
    (value :pointer))

(defcfun (%g-value-set-int "g_value_set_int") :void
    (value :pointer)
    (v-int gint))

(defcfun (%g-value-get-int "g_value_get_int") gint
    (value :pointer))

(defcfun (%g-value-set-uint "g_value_set_uint") :void
    (value :pointer)
    (v-uint guint))

(defcfun (%g-value-get-uint "g_value_get_uint") guint
    (value :pointer))

(defcfun (%g-value-set-long "g_value_set_long") :void
    (value :pointer)
    (v-long glong))

(defcfun (%g-value-get-long "g_value_get_long") glong
    (value :pointer))

(defcfun (%g-value-set-ulong "g_value_set_ulong") :void
    (value :pointer)
    (v-ulong gulong))

(defcfun (%g-value-get-ulong "g_value_get_ulong") gulong
    (value :pointer))

(defcfun (%g-value-set-int64 "g_value_set_int64") :void
    (value :pointer)
    (v-int64 gint64))

(defcfun (%g-value-get-int64 "g_value_get_int64") gint64
    (value :pointer))

(defcfun (%g-value-set-uint64 "g_value_set_uint64") :void
    (value :pointer)
    (v-uint64 guint64))

(defcfun (%g-value-get-uint64 "g_value_get_uint64") guint64
    (value :pointer))

(defcfun (%g-value-set-float "g_value_set_float") :void
    (value :pointer)
    (v-float :float))

(defcfun (%g-value-get-float "g_value_get_float") :float
    (value :pointer))

(defcfun (%g-value-set-double "g_value_set_double") :void
    (value :pointer)
    (v-double :double))

(defcfun (%g-value-get-double "g_value_get_double") :double
    (value :pointer))

(defcfun (%g-value-set-enum "g_value_set_enum") :void
    (value :pointer)
    (v-enum gint))

(defcfun (%g-value-get-enum "g_value_get_enum") gint
    (value :pointer))

(defcfun (%g-value-set-flags "g_value_set_flags") :void
    (value :pointer)
    (v-flags guint))

(defcfun (%g-value-get-flags "g_value_get_flags") guint
    (value :pointer))

(defcfun (%g-value-set-string "g_value_set_string") :void
    (value :pointer)
    (v-string :string))

(defcfun (%g-value-set-static-string "g_value_set_static_string") :void
    (value :pointer)
    (v-string :string))

(defcfun (%g-value-take-string "g_value_take_string") :void
    (value :pointer)
    (v-string :string))

(defcfun (%g-value-set-string-take-ownership "g_value_set_string_take_ownership") :void
    (value :pointer))

(defcfun (%g-value-dup-string "g_value_dup_string") :string
    (value :pointer))

(defcfun (%g-type-from-name "g_type_from_name") g-type
    (name :string))

