# Copyright (C) 2017-2018 The LineageOS Project
# Copyright (C) 2020 StatiXOS
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

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 560dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Additional native libraries.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/public.libraries.txt

# Audio
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

# Boot Control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    bootctrl.msm8998 \
    update_engine \
    update_engine_client \
    update_verifier

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.msm8998 \
    libgptutils \
    libz \
    libcutils

# Camera
PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0_32

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Display
PRODUCT_PACKAGES += \
    libqdMetaData.system

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl

# HDR
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hdr_tm_config.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/hdr_tm_config.xml

# Headers
$(call inherit-product, hardware/qcom/msm8998/msm8998.mk)

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
    ueventd.mata.rc

# IRQ Balancing
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/msm_irqbalance.conf

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.mata

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    Tag

# Notch
TARGET_HAS_NOTCH := true

# Overlays
PRODUCT_PACKAGES += \
    EssentialCarrierConfig \
    EssentialFrameworks \
    EssentialSettings \
    EssentialSettingsProvider \
    EssentialSystemUI \
    EssentialTelephony

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-mata.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mata.xml \

# Properties
PRODUCT_ACTIONABLE_COMPATIBLE_PROPERTY_DISABLE := true
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# QCOM
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.recovery.mata.rc:$(TARGET_COPY_OUT_RAMDISK)/init.recovery.mata.rc

# SDCard
PRODUCT_CHARACTERISTICS := nosdcard

# Soong
PRODUCT_SOONG_NAMESPACES += \
    device/essential/mata \
    hardware/qcom/bootctrl

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext \

PRODUCT_BOOT_JARS += \
    telephony-ext

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/thermal_info_config.json

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_HOST_PACKAGES += \
    brillo_update_payload

# Verity
$(call inherit-product, build/target/product/verity.mk)
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/platform/soc/1da4000.ufshc/by-name/system
PRODUCT_VENDOR_VERITY_PARTITION := /dev/block/platform/soc/1da4000.ufshc/by-name/vendor

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.2

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/wifi/wpa_supplicant_overlay.conf
