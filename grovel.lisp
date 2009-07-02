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

(constant (+true+ "TRUE"))
(constant (+false+ "FALSE"))

;; typedefs
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


;; structs
(cstruct vertex "ClutterVertex"
         (x "x" :type :float)
         (y "y" :type :float)
         (z "z" :type :float))

(cstruct button-event "ClutterButtonEvent"
         (type "type" :type event-type)
         (time "time" :type guint32)
         (flags "flags" :type event-flags)
         (stage "stage" :type :pointer)
         (source "source" :type :pointer)
         (x "x" :type :float)
         (y "y" :type :float)
         (modifier-state "modifier_state" :type modifier-type)
         (button "button" :type guint32)
         (click-count "click_count" :type guint)
         (axes "axes" :type :pointer)
         (device "device" :type :pointer))

(cstruct key-event "ClutterKeyEvent"
         (type "type" :type event-type)
         (time "time" :type guint32)
         (flags "flags" :type event-flags)
         (stage "stage" :type :pointer)
         (source "source" :type :pointer)
         (modifier-state "modifier_state" :type modifier-type)
         (keyval "keyval" :type guint)
         (hardware-keycode "hardware_keycode" :type guint16)
         (unicode-value "unicode_value" :type gunichar)
         (device "device" :type :pointer))

(cstruct motion-event "ClutterMotionEvent"
         (type "type" :type event-type)
         (time "time" :type guint32)
         (flags "flags" :type event-flags)
         (stage "stage" :type :pointer)
         (source "source" :type :pointer)
         (x "x" :type :float)
         (y "y" :type :float)
         (modifier-state "modifier_state" :type modifier-type)
         (axes "axes" :type :pointer)
         (device "device" :type :pointer))

(cstruct scroll-event "ClutterScrollEvent"
         (type "type" :type event-type)
         (time "time" :type guint32)
         (flags "flags" :type event-flags)
         (stage "stage" :type :pointer)
         (source "source" :type :pointer)
         (x "x" :type :float)
         (y "y" :type :float)
         (direction "direction" :type scroll-direction)
         (modifier-state "modifier_state" :type modifier-type)
         (axes "axes" :type :pointer)
         (device "device" :type :pointer))

(cstruct stage-state-event "ClutterStageStateEvent"
         (type "type" :type event-type)
         (time "time" :type guint32)
         (flags "flags" :type event-flags)
         (stage "stage" :type :pointer)
         (source "source" :type :pointer)
         (changed-mask "changed_mask" :type stage-state)
         (new-state "new_state" :type stage-state))

(cstruct crossing-event "ClutterCrossingEvent"
         (type "type" :type event-type)
         (time "time" :type guint32)
         (flags "flags" :type event-flags)
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


;; unions
(cunion event "ClutterEvent"
        (type "type" :type event-type)
        (button "button" :type button-event)
        (key "key" :type key-event)
        (motion "motion" :type motion-event)
        (scroll "scroll" :type scroll-event)
        (stage-state "stage_state" :type stage-state-event)
        (crossing "crossing" :type crossing-event))

