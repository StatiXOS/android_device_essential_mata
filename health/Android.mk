LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.health@2.0-service.mata
LOCAL_INIT_RC := android.hardware.health@2.0-service.mata.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_VENDOR_OVERLAY_MODULE := true
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_OVERRIDES_PACKAGES := healthd

LOCAL_HEADER_LIBS := libhealthd_headers

LOCAL_SRC_FILES := \
    HealthService.cpp \
    LearnedCapacityBackupRestore.cpp

LOCAL_STATIC_LIBRARIES := \
    android.hardware.health@2.0-impl \
    android.hardware.health@1.0-convert \
    libhealthservice \
    libbatterymonitor

LOCAL_SHARED_LIBRARIES := \
    libbase \
    libcutils \
    libhardware \
    libhidlbase \
    libhidltransport \
    liblog \
    libhwbinder \
    libutils \
    libpixelhealth \
    android.hardware.health@2.0

include $(BUILD_EXECUTABLE)
