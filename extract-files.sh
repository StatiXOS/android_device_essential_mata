#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=mata
VENDOR=essential

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
        vendor/etc/init/android.hardware.biometrics.fingerprint@2.1-service.mata.rc)
            sed -i 's/service fps_hal_mata/service vendor.fps_hal_mata/g' "${2}"
            ;;
        vendor/etc/init/vendor.essential.hardware.sidecar@1.0-service.rc)
            sed -i 's/service sidecar-hal-1-0/service vendor.sidecar-hal-1-0/g' "${2}"
            ;;
        recovery/root/vendor/bin/hbtp_daemon|\
        recovery/root/vendor/lib64/libhbtpclient.so|\
        recovery/root/vendor/lib64/vendor.qti.hardware.improvetouch.blobmanager@1.0-service.so|\
        recovery/root/vendor/lib64/vendor.qti.hardware.improvetouch.blobmanager@1.0_vendor.so|\
        recovery/root/vendor/lib64/vendor.qti.hardware.improvetouch.gesturemanager@1.0-service.so|\
        recovery/root/vendor/lib64/vendor.qti.hardware.improvetouch.gesturemanager@1.0_vendor.so|\
        recovery/root/vendor/lib64/vendor.qti.hardware.improvetouch.touchcompanion@1.0-service.so|\
        recovery/root/vendor/lib64/vendor.qti.hardware.improvetouch.touchcompanion@1.0_vendor.so)
            patchelf --remove-needed libhidltransport.so --remove-needed libhwbinder.so "${2}"
            ;;
    esac
}

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"
extract "${MY_DIR}/proprietary-files-recovery.txt" "${SRC}" "${KANG}" --section "${SECTION}"

"${MY_DIR}/setup-makefiles.sh"
