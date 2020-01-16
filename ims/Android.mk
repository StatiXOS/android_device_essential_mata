LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libbase_shim
LOCAL_VENDOR_OVERLAY_MODULE := true
LOCAL_SHARED_LIBRARIES := libbase
LOCAL_SRC_FILES := logging.cpp
include $(BUILD_SHARED_LIBRARY)
