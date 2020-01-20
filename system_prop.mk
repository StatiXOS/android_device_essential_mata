#
# system props for mata
#


# Audio
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    audio.deep_buffer.media=true \
    audio.offload.video=true

# Camera
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.camera.expose.aux=1 \
    persist.camera.max.previewfps=60 \
    vidc.enc.dcvs.extra-buff-count=2 \
    vendor.camera.aux.packagelist="org.codeaurora.snapcam,com.essential.klik,org.lineageos.snap"

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m

# Display
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    vendor.display.disable_partial_split=1 \
    vendor.gralloc.enable_fb_ubwc=1 \
    vendor.display.disable_skip_validate=1 \
    vendor.display.perf_hint_window=50 \

# HDR
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.qcom.hdr.config=/vendor/etc/hdr_tm_config.xml

# Surfaceflinger
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.surface_flinger.protected_contents=true \
    debug.sf.early_phase_offset_ns=1500000 \
    debug.sf.early_app_phase_offset_ns=1500000 \
    debug.sf.early_gl_phase_offset_ns=3000000 \
    debug.sf.early_gl_app_phase_offset_ns=15000000

# Voice assistant
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.opa.eligible_device=true

# Wifi Display
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.hwc.enable_vds=1
