#
# Copyright (C) 2017-2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/essential/mata/overlay

# Properties
TARGET_SYSTEM_PROP := device/essential/mata/system.prop

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 560dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Additional native libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/public.libraries.txt

# Audio
PRODUCT_COPY_FILES += \
    device/essential/mata/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/audio_effects.xml \
    device/essential/mata/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/audio_platform_info.xml \
    device/essential/mata/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/audio_policy_configuration.xml \
    device/essential/mata/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/audio_policy_volumes.xml \
    device/essential/mata/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/default_volume_tables.xml \
    device/essential/mata/audio/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/listen_platform_info.xml \
    device/essential/mata/audio/mixer_paths_tasha.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/mixer_paths_tasha.xml \
    device/essential/mata/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/sound_trigger_mixer_paths.xml \
    device/essential/mata/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/sound_trigger_platform_info.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/hearing_aid_audio_policy_configuration.xml \

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1312

# Boot control
PRODUCT_PACKAGES += update_engine \
		    update_engine_client \
		    update_verifier \
		    bootctrl.msm8998 \
		    android.hardware.boot@1.0-impl \
		    android.hardware.boot@1.0-service

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.msm8998 \
    libgptutils \
    libz \
    libcutils

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Camera
PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0_32

# Dalvik
-include frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk

# Display
PRODUCT_PACKAGES += \
    libqdMetaData.system \

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1

PRODUCT_COPY_FILES += \
    device/essential/mata/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl

# HDR
PRODUCT_COPY_FILES += \
    device/essential/mata/configs/hdr_tm_config.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/hdr_tm_config.xml

# Headers
-include hardware/qcom/msm8998/msm8998.mk

# IMS
PRODUCT_PACKAGES += \
    libbase_shim

# Init
PRODUCT_PACKAGES += \
    fstab.mata \
    fstab.persist \
    init.mata.ramdump.rc \
    init.mata.rc \
    init.qcom.devstart.sh \
    init.qcom.ipastart.sh \
    init.qcom.post_boot.sh \
    ueventd.mata.rc

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# IRQ Balancing
 PRODUCT_COPY_FILES += \
     device/essential/mata/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/msm_irqbalance.conf

# Led packages
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.mata

# Network
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    Tag

# Overlay
PRODUCT_PACKAGES += \
    NoCutoutOverlay \
    NotchBarKiller

# Permissions
PRODUCT_COPY_FILES += \
    device/essential/mata/configs/privapp-permissions-mata.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mata.xml \

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service-qti

# QCOM
PRODUCT_COPY_FILES += \
    device/essential/mata/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    device/essential/mata/configs/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml

# Recovery
PRODUCT_COPY_FILES += \
    device/essential/mata/recovery/root/fstab.recovery.mata:recovery/root/fstab.recovery.mata \
    device/essential/mata/recovery/root/init.recovery.mata.rc:recovery/root/init.recovery.mata.rc

# Soong
PRODUCT_SOONG_NAMESPACES += \
    device/essential/mata \

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \

PRODUCT_BOOT_JARS += \
    telephony-ext

# TextClassifier
PRODUCT_PACKAGES += \
    textclassifier.smartselection.bundle1

# Thermal
PRODUCT_COPY_FILES += \
    device/essential/mata/configs/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/thermal_info_config.json

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_HOST_PACKAGES += \
    brillo_update_payload

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# utilities
-include device/essential/mata/utils.mk

# Verity
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/platform/soc/1da4000.ufshc/by-name/system
PRODUCT_VENDOR_VERITY_PARTITION := /dev/block/platform/soc/1da4000.ufshc/by-name/vendor
$(call inherit-product, build/target/product/verity.mk)

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.2

# Wifi
PRODUCT_COPY_FILES += \
    device/essential/mata/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/wifi/wpa_supplicant_overlay.conf

# vendor_overlay
PRODUCT_COPY_FILES += \
    device/essential/mata/dummy_overlay/android.hardware.power@1.3-service.mata-libperfmgr.rc:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/android.hardware.power@1.3-service.mata-libperfmgr.rc
