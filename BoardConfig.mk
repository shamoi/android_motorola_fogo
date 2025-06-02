#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
# Inherit from common
-include $(DEVICE_PATH)/BoardConfigCommon.mk


DEVICE_PATH := device/motorola/fogo

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true


# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system_ext \
    vendor \
    odm \
    system \
    product

BOARD_USES_RECOVERY_AS_BOOT := true


# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := fogo
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_HEIGHT := 1612
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_DENSITY := 280

#Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_KERNEL_CONFIG := fogo_defconfig
TARGET_KERNEL_SOURCE := kernel/motorola/fogo

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
endif

# Partitions
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



# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0 
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_QCOM_FBE_DECRYPTION := true


# Recovery 
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hidl.allocator@1.0 \
    android.hidl.memory@1.0 \
    android.hidl.memory.token@1.0 \
    libdmabufheap \
    libhidlmemory \
    libion \
    libnetutils \
    vendor.display.config@1.0 \
    vendor.display.config@2.0 \
    libdebuggerd_client
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Qcom
BOARD_USES_QCOM_HARDWARE := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true
TW_EXCLUDE_APEX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_CRYPTO := true
TW_NO_EXFAT_FUSE := true
TW_INCLUDE_RESETPROP := true
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true
TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.product;ro.build.fingerprint=ro.vendor.build.fingerprint;ro.build.version.incremental"
TW_OVERRIDE_PROPS_ADDITIONAL_PARTITIONS := vendor
RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.allocator@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory.token@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdmabufheap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidlmemory.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnetutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdebuggerd_client.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
TW_LOAD_VENDOR_DLKM_MODULES := "qpnp_adaptive_charge.ko mmi_annotate.ko mmi_info.ko mmi_sys_temp.ko mmi_charger.ko moto_f_usbnet.ko sensors_class.ko touchscreen_mmi.ko stmicro_mmi.ko goodix_brl_mmi.ko qpnp-pbs.ko qcom-hv-haptics.ko utags.ko"
TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true

# TWRP Debug Flags
#TWRP_EVENT_LOGGING := true
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
TARGET_RECOVERY_DEVICE_MODULES += strace
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/strace
#TARGET_RECOVERY_DEVICE_MODULES += twrpdec
#RECOVERY_BINARY_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/twrpdec

