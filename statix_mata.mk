# Inherit some common statix stuff.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, vendor/statix/config/common.mk)
$(call inherit-product, vendor/statix/config/gsm.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)
# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Vendor blobs
$(call inherit-product-if-exists, vendor/essential/mata/mata-vendor.mk)

# Device
$(call inherit-product, device/essential/mata/device.mk)

# Device identifiers
PRODUCT_DEVICE := mata
PRODUCT_NAME := statix_mata
PRODUCT_BRAND := essential
PRODUCT_MODEL := PH-1
PRODUCT_MANUFACTURER := Essential Products
PRODUCT_RELEASE_NAME := mata

PRODUCT_BUILD_PROP_OVERRIDES += \
        PRODUCT_NAME=mata \
        PRIVATE_BUILD_DESC="mata-userdebug 10 QQ1A.200105.088 590 test-keys"

BUILD_FINGERPRINT := essential/mata/mata:10/QQ1A.200105.088/590:userdebug/test-keys
