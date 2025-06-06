#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
#

# Inherit the proprietary files
-include vendor/motorola/fogo/BoardConfigVendor.mk

# Inherit from motorola sm6375-common
-include device/motorola/sm6375-common/BoardConfigCommon.mk

# Inherit from common
-include $(DEVICE_PATH)/BoardConfigCommon.mk

# Export
export ALLOW_MISSING_DEPENDENCIES= true
 
# For arm64 
TARGET_ARCH := arm64

# SDK
BOARD_SYSTEMSDK_VERSIONS := 34

DEVICE_PATH := "device/motorola/fogo"


# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system_ext \
    vendor \
    odm \
    system \
    product

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armabi
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75


# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := fogo
TARGET_NO_BOOTLOADER := false

# Display
TARGET_SCREEN_HEIGHT := 1612
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_DENSITY := 280

# Kernel
BOARD_KERNEL_SIZE := 41873920 
BOARD_BOOTIMG_HEADER_SIZE := 1580
BOARD_KERNEL_CMDLINE += androidboot.hab.product=fogo
BOARD_KERNEL_TAGS_OFFSET:= 0x02500000
BOARD_RAMDISK_OFFSET:= 0x0093c88a
BOARD_KERNEL_BASE:= 0x027ef200

BOARD_BOOTIMG_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_KERNEL_CONFIG := fogo_defconfig
TARGET_KERNEL_SOURCE := kernel/motorola/fogo
KERNEL_PAGE_SIZE := 4096

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
endif

# Partitions
BOARD_RAMDISK_SIZE := 9685130 
BOARD_STORE_RAMDISK_IN_BOOT := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := system system system_ext system_ext product product vendor vendor odm
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Platform
TARGET_BOARD_PLATFORM := holi

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 4

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Recovery 
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 120
RAMDISK_IN_BOOT := true

# Qcom
BOARD_USES_QCOM_HARDWARE := true# qcom decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe


# TWRP Configuration
TW_EXCLUDE_SUPERSU := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_TW_HAS_NO_BOOT_PARTITION := true
INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_DEFAULT_BRIGHTNESS := 250
TW_EXCLUDE_APEX := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_CRYPTO := true
