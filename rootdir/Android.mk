LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# Device init scripts

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.mata
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/fstab.mata
LOCAL_VENDOR_OVERLAY_MODULE    := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.persist
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/fstab.persist
LOCAL_VENDOR_OVERLAY_MODULE    := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.mata.ramdump.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/init.mata.ramdump.rc
LOCAL_VENDOR_OVERLAY_MODULE    := true
LOCAL_MODULE_RELATIVE_PATH := init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.mata.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/init.mata.rc
LOCAL_VENDOR_OVERLAY_MODULE    := true
LOCAL_MODULE_RELATIVE_PATH := init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.qcom.devstart.sh
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES    := bin/init.qcom.devstart.sh
LOCAL_VENDOR_OVERLAY_MODULE    := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.qcom.ipastart.sh
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES    := bin/init.qcom.ipastart.sh
LOCAL_VENDOR_OVERLAY_MODULE    := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.qcom.post_boot.sh
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES    := bin/init.qcom.post_boot.sh
LOCAL_VENDOR_OVERLAY_MODULE    := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := ueventd.mata.rc
LOCAL_MODULE_STEM  := ueventd.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/ueventd.mata.rc
# this needs to be in /vendor/ueventd.rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_OVERLAY)
include $(BUILD_PREBUILT)
