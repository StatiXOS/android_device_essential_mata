LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.light@2.0-service.mata
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_OVERLAY_MODULE := true
LOCAL_INIT_RC := android.hardware.light@2.0-service.mata.rc

LOCAL_SHARED_LIBRARIES := \
    libbase \
    libhardware \
    libhidlbase \
    libhidltransport \
    liblog \
    libhwbinder \
    libutils \
    android.hardware.light@2.0

LOCAL_SRC_FILES := \
    service.cpp \
    Light.cpp

include $(BUILD_EXECUTABLE)
