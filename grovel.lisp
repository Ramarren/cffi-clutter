(in-package :cffi-clutter)

(flag "-I/home/ramarren/C/Clutter/clutter-0.9.6/")
(flag "-I/home/ramarren/C/Clutter/clutter-0.9.6/clutter/")
(flag "-I/usr/include/pango-1.0")
(flag "-I/usr/include/glib-2.0")
(flag "-I/usr/lib/glib-2.0/include")
(flag "-I/usr/include/gtk-2.0")
(flag "-I/usr/include/cairo")
(flag "-I/usr/include/freetype2")
(flag "-I/usr/include/libpng12")
(flag "-I/usr/include/pixman-1")

(include "clutter/clutter.h")
(include "clutter/cogl/cogl.h")
(include "clutter/cogl/common/cogl-blend-string.h")
(include "clutter/cogl/common/cogl-current-matrix.h")

;; constants
(constant (+priority-high+ "G_PRIORITY_HIGH"))
(constant (+priority-default+ "G_PRIORITY_DEFAULT"))
(constant (+priority-high-idle+ "G_PRIORITY_HIGH_IDLE"))
(constant (+priority-default-idle+ "G_PRIORITY_DEFAULT_IDLE"))
(constant (+priority-low+ "G_PRIORITY_LOW"))
(constant (+true+ "TRUE"))
(constant (+false+ "FALSE"))
(constant (+pixel-format-24+ "COGL_PIXEL_FORMAT_24"))
(constant (+pixel-format-32+ "COGL_PIXEL_FORMAT_32"))
(constant (+a-bit+ "COGL_A_BIT"))
(constant (+bgr-bit+ "COGL_BGR_BIT"))
(constant (+afirst-bit+ "COGL_AFIRST_BIT"))
(constant (+premult-bit+ "COGL_PREMULT_BIT"))
(constant (+unordered-mask+ "COGL_UNORDERED_MASK"))
(constant (+unpremult-mask+ "COGL_UNPREMULT_MASK"))
(constant (+fixed-bits+ "COGL_FIXED_BITS"))
(constant (+fixed-q+ "COGL_FIXED_Q"))
(constant (+fixed-max+ "COGL_FIXED_MAX"))
(constant (+fixed-min+ "COGL_FIXED_MIN"))
(constant (+fixed-epsilon+ "COGL_FIXED_EPSILON"))
(constant (+fixed-1+ "COGL_FIXED_1"))
(constant (+fixed-0-5+ "COGL_FIXED_0_5"))
(constant (+fixed-30+ "COGL_FIXED_30"))
(constant (+fixed-45+ "COGL_FIXED_45"))
(constant (+fixed-60+ "COGL_FIXED_60"))
(constant (+fixed-90+ "COGL_FIXED_90"))
(constant (+fixed-120+ "COGL_FIXED_120"))
(constant (+fixed-180+ "COGL_FIXED_180"))
(constant (+fixed-240+ "COGL_FIXED_240"))
(constant (+fixed-255+ "COGL_FIXED_255"))
(constant (+fixed-270+ "COGL_FIXED_270"))
(constant (+fixed-360+ "COGL_FIXED_360"))
(constant (+fixed-2-pi+ "COGL_FIXED_2_PI"))
(constant (+fixed-pi+ "COGL_FIXED_PI"))
(constant (+fixed-pi-2+ "COGL_FIXED_PI_2"))
(constant (+fixed-pi-4+ "COGL_FIXED_PI_4"))
(constant (+radians-to-degrees+ "COGL_RADIANS_TO_DEGREES"))
(constant (+sqrti-arg-10-percent+ "COGL_SQRTI_ARG_10_PERCENT"))
(constant (+sqrti-arg-5-percent+ "COGL_SQRTI_ARG_5_PERCENT"))
(constant (+sqrti-arg-max+ "COGL_SQRTI_ARG_MAX"))

;; typedefs
(ctype g-lenum "GLenum")
(ctype g-luint "GLuint")
(ctype va-list "va_list")
(ctype gunichar "gunichar")
(ctype guint64 "guint64")
(ctype gint64 "gint64")
(ctype glong "glong")
(ctype guchar "guchar")
(ctype gchar "gchar")
(ctype gulong "gulong")
(ctype guint8 "guint8")
(ctype guint32 "guint32")
(ctype guint16 "guint16")
(ctype guint "guint")
(ctype gssize "gssize")
(ctype gsize "gsize")
(ctype gint "gint")
(ctype gboolean "gboolean")
(ctype g-quark "GQuark")
(ctype g-type "GType")
(ctype cogl-handle "CoglHandle")
(ctype cogl-angle "CoglAngle")
(ctype cogl-fixed "CoglFixed")

;; enums
(cenum event-type
      ((:nothing "CLUTTER_NOTHING"))
      ((:key-press "CLUTTER_KEY_PRESS"))
      ((:key-release "CLUTTER_KEY_RELEASE"))
      ((:motion "CLUTTER_MOTION"))
      ((:enter "CLUTTER_ENTER"))
      ((:leave "CLUTTER_LEAVE"))
      ((:button-press "CLUTTER_BUTTON_PRESS"))
      ((:button-release "CLUTTER_BUTTON_RELEASE"))
      ((:scroll "CLUTTER_SCROLL"))
      ((:stage-state "CLUTTER_STAGE_STATE"))
      ((:destroy-notify "CLUTTER_DESTROY_NOTIFY"))
      ((:client-message "CLUTTER_CLIENT_MESSAGE"))
      ((:delete "CLUTTER_DELETE")))

(cenum gravity
      ((:none "CLUTTER_GRAVITY_NONE"))
      ((:north "CLUTTER_GRAVITY_NORTH"))
      ((:north-east "CLUTTER_GRAVITY_NORTH_EAST"))
      ((:east "CLUTTER_GRAVITY_EAST"))
      ((:south-east "CLUTTER_GRAVITY_SOUTH_EAST"))
      ((:south "CLUTTER_GRAVITY_SOUTH"))
      ((:south-west "CLUTTER_GRAVITY_SOUTH_WEST"))
      ((:west "CLUTTER_GRAVITY_WEST"))
      ((:north-west "CLUTTER_GRAVITY_NORTH_WEST"))
      ((:center "CLUTTER_GRAVITY_CENTER")))

(cenum init-error
      ((:success "CLUTTER_INIT_SUCCESS"))
      ((:error-unknown "CLUTTER_INIT_ERROR_UNKNOWN"))
      ((:error-threads "CLUTTER_INIT_ERROR_THREADS"))
      ((:error-backend "CLUTTER_INIT_ERROR_BACKEND"))
      ((:error-internal "CLUTTER_INIT_ERROR_INTERNAL")))

(cenum modifier-type
      ((:shift-mask "CLUTTER_SHIFT_MASK"))
      ((:lock-mask "CLUTTER_LOCK_MASK"))
      ((:control-mask "CLUTTER_CONTROL_MASK"))
      ((:mod1-mask "CLUTTER_MOD1_MASK"))
      ((:mod2-mask "CLUTTER_MOD2_MASK"))
      ((:mod3-mask "CLUTTER_MOD3_MASK"))
      ((:mod4-mask "CLUTTER_MOD4_MASK"))
      ((:mod5-mask "CLUTTER_MOD5_MASK"))
      ((:button1-mask "CLUTTER_BUTTON1_MASK"))
      ((:button2-mask "CLUTTER_BUTTON2_MASK"))
      ((:button3-mask "CLUTTER_BUTTON3_MASK"))
      ((:button4-mask "CLUTTER_BUTTON4_MASK"))
      ((:button5-mask "CLUTTER_BUTTON5_MASK"))
      ((:super-mask "CLUTTER_SUPER_MASK"))
      ((:hyper-mask "CLUTTER_HYPER_MASK"))
      ((:meta-mask "CLUTTER_META_MASK"))
      ((:release-mask "CLUTTER_RELEASE_MASK"))
      ((:modifier-mask "CLUTTER_MODIFIER_MASK")))

(cenum rotate-axis
      ((:x-axis "CLUTTER_X_AXIS"))
      ((:y-axis "CLUTTER_Y_AXIS"))
      ((:z-axis "CLUTTER_Z_AXIS")))

(cenum rotate-direction
      ((:rotate-cw "CLUTTER_ROTATE_CW"))
      ((:rotate-ccw "CLUTTER_ROTATE_CCW")))

(cenum texture-flags
      ((:rgb-flag-bgr "CLUTTER_TEXTURE_RGB_FLAG_BGR"))
      ((:rgb-flag-premult "CLUTTER_TEXTURE_RGB_FLAG_PREMULT"))
      ((:yuv-flag-yuv2 "CLUTTER_TEXTURE_YUV_FLAG_YUV2")))

(cenum texture-quality
      ((:quality-low "CLUTTER_TEXTURE_QUALITY_LOW"))
      ((:quality-medium "CLUTTER_TEXTURE_QUALITY_MEDIUM"))
      ((:quality-high "CLUTTER_TEXTURE_QUALITY_HIGH")))

(cenum timeline-direction
      ((:forward "CLUTTER_TIMELINE_FORWARD"))
      ((:backward "CLUTTER_TIMELINE_BACKWARD")))

(cenum g-param-flags
      ((:readable "G_PARAM_READABLE"))
      ((:writable "G_PARAM_WRITABLE"))
      ((:construct "G_PARAM_CONSTRUCT"))
      ((:construct-only "G_PARAM_CONSTRUCT_ONLY"))
      ((:lax-validation "G_PARAM_LAX_VALIDATION"))
      ((:static-name "G_PARAM_STATIC_NAME"))
      ((:static-nick "G_PARAM_STATIC_NICK"))
      ((:static-blurb "G_PARAM_STATIC_BLURB")))

(cenum pango-alignment
      ((:left "PANGO_ALIGN_LEFT"))
      ((:center "PANGO_ALIGN_CENTER"))
      ((:right "PANGO_ALIGN_RIGHT")))

(cenum pango-ellipsize-mode
      ((:none "PANGO_ELLIPSIZE_NONE"))
      ((:start "PANGO_ELLIPSIZE_START"))
      ((:middle "PANGO_ELLIPSIZE_MIDDLE"))
      ((:end "PANGO_ELLIPSIZE_END")))

(cenum pango-wrap-mode
      ((:word "PANGO_WRAP_WORD"))
      ((:char "PANGO_WRAP_CHAR"))
      ((:word-char "PANGO_WRAP_WORD_CHAR")))

(cenum g-connect-flags
      ((:after "G_CONNECT_AFTER"))
      ((:swapped "G_CONNECT_SWAPPED")))

(cenum event-flags
      ((:none "CLUTTER_EVENT_NONE"))
      ((:flag-synthetic "CLUTTER_EVENT_FLAG_SYNTHETIC")))

(cenum scroll-direction
      ((:up "CLUTTER_SCROLL_UP"))
      ((:down "CLUTTER_SCROLL_DOWN"))
      ((:left "CLUTTER_SCROLL_LEFT"))
      ((:right "CLUTTER_SCROLL_RIGHT")))

(cenum stage-state
      ((:fullscreen "CLUTTER_STAGE_STATE_FULLSCREEN"))
      ((:offscreen "CLUTTER_STAGE_STATE_OFFSCREEN"))
      ((:activated "CLUTTER_STAGE_STATE_ACTIVATED")))

(cenum cogl-pixel-format
      ((:any "COGL_PIXEL_FORMAT_ANY"))
      ((:a-8 "COGL_PIXEL_FORMAT_A_8"))
      ((:rgb-565 "COGL_PIXEL_FORMAT_RGB_565"))
      ((:rgba-4444 "COGL_PIXEL_FORMAT_RGBA_4444"))
      ((:rgba-5551 "COGL_PIXEL_FORMAT_RGBA_5551"))
      ((:yuv "COGL_PIXEL_FORMAT_YUV"))
      ((:g-8 "COGL_PIXEL_FORMAT_G_8"))
      ((:rgb-888 "COGL_PIXEL_FORMAT_RGB_888"))
      ((:bgr-888 "COGL_PIXEL_FORMAT_BGR_888"))
      ((:rgba-8888 "COGL_PIXEL_FORMAT_RGBA_8888"))
      ((:bgra-8888 "COGL_PIXEL_FORMAT_BGRA_8888"))
      ((:argb-8888 "COGL_PIXEL_FORMAT_ARGB_8888"))
      ((:abgr-8888 "COGL_PIXEL_FORMAT_ABGR_8888"))
      ((:rgba-8888-pre "COGL_PIXEL_FORMAT_RGBA_8888_PRE"))
      ((:bgra-8888-pre "COGL_PIXEL_FORMAT_BGRA_8888_PRE"))
      ((:argb-8888-pre "COGL_PIXEL_FORMAT_ARGB_8888_PRE"))
      ((:abgr-8888-pre "COGL_PIXEL_FORMAT_ABGR_8888_PRE"))
      ((:rgba-4444-pre "COGL_PIXEL_FORMAT_RGBA_4444_PRE"))
      ((:rgba-5551-pre "COGL_PIXEL_FORMAT_RGBA_5551_PRE")))

(cenum unit-type
      ((:pixel "CLUTTER_UNIT_PIXEL"))
      ((:em "CLUTTER_UNIT_EM"))
      ((:mm "CLUTTER_UNIT_MM"))
      ((:point "CLUTTER_UNIT_POINT")))

(cenum font-flags
      ((:mipmapping "CLUTTER_FONT_MIPMAPPING"))
      ((:hinting "CLUTTER_FONT_HINTING")))

(cenum input-device-type
      ((:pointer-device "CLUTTER_POINTER_DEVICE"))
      ((:keyboard-device "CLUTTER_KEYBOARD_DEVICE"))
      ((:extension-device "CLUTTER_EXTENSION_DEVICE"))
      ((:n-device-types "CLUTTER_N_DEVICE_TYPES")))

(cenum pick-mode
      ((:none "CLUTTER_PICK_NONE"))
      ((:reactive "CLUTTER_PICK_REACTIVE"))
      ((:all "CLUTTER_PICK_ALL")))

(cenum allocation-flags
      ((:none "CLUTTER_ALLOCATION_NONE"))
      ((:clutter-absolute-origin-changed "CLUTTER_ABSOLUTE_ORIGIN_CHANGED")))

(cenum actor-flags
      ((:mapped "CLUTTER_ACTOR_MAPPED"))
      ((:realized "CLUTTER_ACTOR_REALIZED"))
      ((:reactive "CLUTTER_ACTOR_REACTIVE"))
      ((:visible "CLUTTER_ACTOR_VISIBLE")))

(cenum g-signal-match-type
      ((:id "G_SIGNAL_MATCH_ID"))
      ((:detail "G_SIGNAL_MATCH_DETAIL"))
      ((:closure "G_SIGNAL_MATCH_CLOSURE"))
      ((:func "G_SIGNAL_MATCH_FUNC"))
      ((:data "G_SIGNAL_MATCH_DATA"))
      ((:unblocked "G_SIGNAL_MATCH_UNBLOCKED")))

(cenum request-mode
      ((:height-for-width "CLUTTER_REQUEST_HEIGHT_FOR_WIDTH"))
      ((:width-for-height "CLUTTER_REQUEST_WIDTH_FOR_HEIGHT")))

(cenum animation-mode
      ((:custom-mode "CLUTTER_CUSTOM_MODE"))
      ((:linear "CLUTTER_LINEAR"))
      ((:ease-in-quad "CLUTTER_EASE_IN_QUAD"))
      ((:ease-out-quad "CLUTTER_EASE_OUT_QUAD"))
      ((:ease-in-out-quad "CLUTTER_EASE_IN_OUT_QUAD"))
      ((:ease-in-cubic "CLUTTER_EASE_IN_CUBIC"))
      ((:ease-out-cubic "CLUTTER_EASE_OUT_CUBIC"))
      ((:ease-in-out-cubic "CLUTTER_EASE_IN_OUT_CUBIC"))
      ((:ease-in-quart "CLUTTER_EASE_IN_QUART"))
      ((:ease-out-quart "CLUTTER_EASE_OUT_QUART"))
      ((:ease-in-out-quart "CLUTTER_EASE_IN_OUT_QUART"))
      ((:ease-in-quint "CLUTTER_EASE_IN_QUINT"))
      ((:ease-out-quint "CLUTTER_EASE_OUT_QUINT"))
      ((:ease-in-out-quint "CLUTTER_EASE_IN_OUT_QUINT"))
      ((:ease-in-sine "CLUTTER_EASE_IN_SINE"))
      ((:ease-out-sine "CLUTTER_EASE_OUT_SINE"))
      ((:ease-in-out-sine "CLUTTER_EASE_IN_OUT_SINE"))
      ((:ease-in-expo "CLUTTER_EASE_IN_EXPO"))
      ((:ease-out-expo "CLUTTER_EASE_OUT_EXPO"))
      ((:ease-in-out-expo "CLUTTER_EASE_IN_OUT_EXPO"))
      ((:ease-in-circ "CLUTTER_EASE_IN_CIRC"))
      ((:ease-out-circ "CLUTTER_EASE_OUT_CIRC"))
      ((:ease-in-out-circ "CLUTTER_EASE_IN_OUT_CIRC"))
      ((:ease-in-elastic "CLUTTER_EASE_IN_ELASTIC"))
      ((:ease-out-elastic "CLUTTER_EASE_OUT_ELASTIC"))
      ((:ease-in-out-elastic "CLUTTER_EASE_IN_OUT_ELASTIC"))
      ((:ease-in-back "CLUTTER_EASE_IN_BACK"))
      ((:ease-out-back "CLUTTER_EASE_OUT_BACK"))
      ((:ease-in-out-back "CLUTTER_EASE_IN_OUT_BACK"))
      ((:ease-in-bounce "CLUTTER_EASE_IN_BOUNCE"))
      ((:ease-out-bounce "CLUTTER_EASE_OUT_BOUNCE"))
      ((:ease-in-out-bounce "CLUTTER_EASE_IN_OUT_BOUNCE"))
      ((:animation-last "CLUTTER_ANIMATION_LAST")))

(cenum cogl-texture-flags
      ((:none "COGL_TEXTURE_NONE"))
      ((:no-auto-mipmap "COGL_TEXTURE_NO_AUTO_MIPMAP"))
      ((:no-slicing "COGL_TEXTURE_NO_SLICING")))

(cenum cogl-material-alpha-func
      ((:never "COGL_MATERIAL_ALPHA_FUNC_NEVER"))
      ((:less "COGL_MATERIAL_ALPHA_FUNC_LESS"))
      ((:equal "COGL_MATERIAL_ALPHA_FUNC_EQUAL"))
      ((:lequal "COGL_MATERIAL_ALPHA_FUNC_LEQUAL"))
      ((:greater "COGL_MATERIAL_ALPHA_FUNC_GREATER"))
      ((:notequal "COGL_MATERIAL_ALPHA_FUNC_NOTEQUAL"))
      ((:gequal "COGL_MATERIAL_ALPHA_FUNC_GEQUAL"))
      ((:always "COGL_MATERIAL_ALPHA_FUNC_ALWAYS")))

(cenum cogl-blend-string-channel-mask
      ((:rgb "COGL_BLEND_STRING_CHANNEL_MASK_RGB"))
      ((:alpha "COGL_BLEND_STRING_CHANNEL_MASK_ALPHA"))
      ((:rgba "COGL_BLEND_STRING_CHANNEL_MASK_RGBA")))

(cenum cogl-blend-string-color-source-type
      ((:src-color "COGL_BLEND_STRING_COLOR_SOURCE_SRC_COLOR"))
      ((:dst-color "COGL_BLEND_STRING_COLOR_SOURCE_DST_COLOR"))
      ((:constant "COGL_BLEND_STRING_COLOR_SOURCE_CONSTANT"))
      ((:texture "COGL_BLEND_STRING_COLOR_SOURCE_TEXTURE"))
      ((:texture-n "COGL_BLEND_STRING_COLOR_SOURCE_TEXTURE_N"))
      ((:primary "COGL_BLEND_STRING_COLOR_SOURCE_PRIMARY"))
      ((:previous "COGL_BLEND_STRING_COLOR_SOURCE_PREVIOUS")))

(cenum cogl-blend-string-context
      ((:blending "COGL_BLEND_STRING_CONTEXT_BLENDING"))
      ((:texture-combine "COGL_BLEND_STRING_CONTEXT_TEXTURE_COMBINE")))

(cenum cogl-blend-string-error
      ((:parse-error "COGL_BLEND_STRING_ERROR_PARSE_ERROR"))
      ((:argument-parse-error "COGL_BLEND_STRING_ERROR_ARGUMENT_PARSE_ERROR"))
      ((:invalid-error "COGL_BLEND_STRING_ERROR_INVALID_ERROR"))
      ((:gpu-unsupported-error "COGL_BLEND_STRING_ERROR_GPU_UNSUPPORTED_ERROR")))

(cenum cogl-blend-string-function-type
      ((:auto-composite "COGL_BLEND_STRING_FUNCTION_AUTO_COMPOSITE"))
      ((:add "COGL_BLEND_STRING_FUNCTION_ADD"))
      ((:replace "COGL_BLEND_STRING_FUNCTION_REPLACE"))
      ((:modulate "COGL_BLEND_STRING_FUNCTION_MODULATE"))
      ((:add-signed "COGL_BLEND_STRING_FUNCTION_ADD_SIGNED"))
      ((:interpolate "COGL_BLEND_STRING_FUNCTION_INTERPOLATE"))
      ((:subtract "COGL_BLEND_STRING_FUNCTION_SUBTRACT"))
      ((:dot3-rgb "COGL_BLEND_STRING_FUNCTION_DOT3_RGB"))
      ((:dot3-rgba "COGL_BLEND_STRING_FUNCTION_DOT3_RGBA")))

(cenum cogl-material-filter
      ((:nearest "COGL_MATERIAL_FILTER_NEAREST"))
      ((:linear "COGL_MATERIAL_FILTER_LINEAR"))
      ((:nearest-mipmap-nearest "COGL_MATERIAL_FILTER_NEAREST_MIPMAP_NEAREST"))
      ((:linear-mipmap-nearest "COGL_MATERIAL_FILTER_LINEAR_MIPMAP_NEAREST"))
      ((:nearest-mipmap-linear "COGL_MATERIAL_FILTER_NEAREST_MIPMAP_LINEAR"))
      ((:linear-mipmap-linear "COGL_MATERIAL_FILTER_LINEAR_MIPMAP_LINEAR")))

(cenum cogl-indices-type
      ((:unsigned-byte "COGL_INDICES_TYPE_UNSIGNED_BYTE"))
      ((:unsigned-short "COGL_INDICES_TYPE_UNSIGNED_SHORT")))

(cenum cogl-matrix-mode
      ((:modelview "COGL_MATRIX_MODELVIEW"))
      ((:projection "COGL_MATRIX_PROJECTION"))
      ((:texture "COGL_MATRIX_TEXTURE")))

(cenum cogl-shader-type
      ((:vertex "COGL_SHADER_TYPE_VERTEX"))
      ((:fragment "COGL_SHADER_TYPE_FRAGMENT")))

(cenum cogl-feature-flags
      ((:texture-rectangle "COGL_FEATURE_TEXTURE_RECTANGLE"))
      ((:texture-npot "COGL_FEATURE_TEXTURE_NPOT"))
      ((:texture-yuv "COGL_FEATURE_TEXTURE_YUV"))
      ((:texture-read-pixels "COGL_FEATURE_TEXTURE_READ_PIXELS"))
      ((:shaders-glsl "COGL_FEATURE_SHADERS_GLSL"))
      ((:offscreen "COGL_FEATURE_OFFSCREEN"))
      ((:offscreen-multisample "COGL_FEATURE_OFFSCREEN_MULTISAMPLE"))
      ((:offscreen-blit "COGL_FEATURE_OFFSCREEN_BLIT"))
      ((:four-clip-planes "COGL_FEATURE_FOUR_CLIP_PLANES"))
      ((:stencil-buffer "COGL_FEATURE_STENCIL_BUFFER"))
      ((:vbos "COGL_FEATURE_VBOS")))

(cenum cogl-fog-mode
      ((:linear "COGL_FOG_MODE_LINEAR"))
      ((:exponential "COGL_FOG_MODE_EXPONENTIAL"))
      ((:exponential-squared "COGL_FOG_MODE_EXPONENTIAL_SQUARED")))

(cenum cogl-read-pixels-flags
      ((:color-buffer "COGL_READ_PIXELS_COLOR_BUFFER")))

(cenum cogl-material-layer-type
      ((:texture "COGL_MATERIAL_LAYER_TYPE_TEXTURE")))

(cenum cogl-vertices-mode
      ((:points "COGL_VERTICES_MODE_POINTS"))
      ((:line-strip "COGL_VERTICES_MODE_LINE_STRIP"))
      ((:line-loop "COGL_VERTICES_MODE_LINE_LOOP"))
      ((:lines "COGL_VERTICES_MODE_LINES"))
      ((:triangle-strip "COGL_VERTICES_MODE_TRIANGLE_STRIP"))
      ((:triangle-fan "COGL_VERTICES_MODE_TRIANGLE_FAN"))
      ((:triangles "COGL_VERTICES_MODE_TRIANGLES")))

(cenum cogl-buffer-target
      ((:window-buffer "COGL_WINDOW_BUFFER"))
      ((:offscreen-buffer "COGL_OFFSCREEN_BUFFER")))

(cenum cogl-attribute-type
      ((:byte "COGL_ATTRIBUTE_TYPE_BYTE"))
      ((:unsigned-byte "COGL_ATTRIBUTE_TYPE_UNSIGNED_BYTE"))
      ((:short "COGL_ATTRIBUTE_TYPE_SHORT"))
      ((:unsigned-short "COGL_ATTRIBUTE_TYPE_UNSIGNED_SHORT"))
      ((:float "COGL_ATTRIBUTE_TYPE_FLOAT")))


;; composite enums
(ctype modifier-type-composite "ClutterModifierType")
(ctype texture-flags-composite "ClutterTextureFlags")
(ctype g-param-flags-composite "GParamFlags")
(ctype g-connect-flags-composite "GConnectFlags")
(ctype event-flags-composite "ClutterEventFlags")
(ctype stage-state-composite "ClutterStageState")
(ctype font-flags-composite "ClutterFontFlags")
(ctype allocation-flags-composite "ClutterAllocationFlags")
(ctype actor-flags-composite "ClutterActorFlags")
(ctype g-signal-match-type-composite "GSignalMatchType")
(ctype cogl-texture-flags-composite "CoglTextureFlags")
(ctype cogl-feature-flags-composite "CoglFeatureFlags")
(ctype cogl-read-pixels-flags-composite "CoglReadPixelsFlags")
(ctype cogl-buffer-target-composite "CoglBufferTarget")

;; structs
(cstruct vertex "ClutterVertex"
         (x "x" :type :float)
         (y "y" :type :float)
         (z "z" :type :float))

(cstruct button-event "ClutterButtonEvent"
         (type "type" :type event-type)
         (time "time" :type guint32)
         (flags "flags" :type event-flags-composite)
         (stage "stage" :type :pointer)
         (source "source" :type :pointer)
         (x "x" :type :float)
         (y "y" :type :float)
         (modifier-state "modifier_state" :type modifier-type-composite)
         (button "button" :type guint32)
         (click-count "click_count" :type guint)
         (axes "axes" :type :pointer)
         (device "device" :type :pointer))

(cstruct key-event "ClutterKeyEvent"
         (type "type" :type event-type)
         (time "time" :type guint32)
         (flags "flags" :type event-flags-composite)
         (stage "stage" :type :pointer)
         (source "source" :type :pointer)
         (modifier-state "modifier_state" :type modifier-type-composite)
         (keyval "keyval" :type guint)
         (hardware-keycode "hardware_keycode" :type guint16)
         (unicode-value "unicode_value" :type gunichar)
         (device "device" :type :pointer))

(cstruct motion-event "ClutterMotionEvent"
         (type "type" :type event-type)
         (time "time" :type guint32)
         (flags "flags" :type event-flags-composite)
         (stage "stage" :type :pointer)
         (source "source" :type :pointer)
         (x "x" :type :float)
         (y "y" :type :float)
         (modifier-state "modifier_state" :type modifier-type-composite)
         (axes "axes" :type :pointer)
         (device "device" :type :pointer))

(cstruct scroll-event "ClutterScrollEvent"
         (type "type" :type event-type)
         (time "time" :type guint32)
         (flags "flags" :type event-flags-composite)
         (stage "stage" :type :pointer)
         (source "source" :type :pointer)
         (x "x" :type :float)
         (y "y" :type :float)
         (direction "direction" :type scroll-direction)
         (modifier-state "modifier_state" :type modifier-type-composite)
         (axes "axes" :type :pointer)
         (device "device" :type :pointer))

(cstruct stage-state-event "ClutterStageStateEvent"
         (type "type" :type event-type)
         (time "time" :type guint32)
         (flags "flags" :type event-flags-composite)
         (stage "stage" :type :pointer)
         (source "source" :type :pointer)
         (changed-mask "changed_mask" :type stage-state-composite)
         (new-state "new_state" :type stage-state-composite))

(cstruct crossing-event "ClutterCrossingEvent"
         (type "type" :type event-type)
         (time "time" :type guint32)
         (flags "flags" :type event-flags-composite)
         (stage "stage" :type :pointer)
         (source "source" :type :pointer)
         (x "x" :type :float)
         (y "y" :type :float)
         (device "device" :type :pointer)
         (related "related" :type :pointer))

(cstruct color "ClutterColor"
         (red "red" :type guint8)
         (green "green" :type guint8)
         (blue "blue" :type guint8)
         (alpha "alpha" :type guint8))

(cstruct g-value "GValue"
         (g-type "g_type" :type g-type))

(cstruct g-type-class "GTypeClass"
         (g-type "g_type" :type g-type))

(cstruct g-type-instance "GTypeInstance"
         (g-class "g_class" :type :pointer))

(cstruct geometry "ClutterGeometry"
         (x "x" :type gint)
         (y "y" :type gint)
         (width "width" :type guint)
         (height "height" :type guint))

(cstruct knot "ClutterKnot"
         (x "x" :type gint)
         (y "y" :type gint))


;; unions
(cunion event "ClutterEvent"
        (type "type" :type event-type)
        (button "button" :type button-event)
        (key "key" :type key-event)
        (motion "motion" :type motion-event)
        (scroll "scroll" :type scroll-event)
        (stage-state "stage_state" :type stage-state-event)
        (crossing "crossing" :type crossing-event))

