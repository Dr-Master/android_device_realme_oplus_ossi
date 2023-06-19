#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oplus/ossi

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system \
    system \
    system_ext \
    system_ext \
    product \
    product \
    vendor \
    vendor \
    odm \
    odm
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
TARGET_BOOTLOADER_BOARD_NAME := taro
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CONFIG := ossi_defconfig
TARGET_KERNEL_SOURCE := kernel/oplus/ossi

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
endif

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := oplus_dynamic_partitions
BOARD_OPLUS_DYNAMIC_PARTITIONS_PARTITION_LIST := system system system_ext system_ext product product vendor vendor odm odm my_product my_product my_company my_company my_carrier my_carrier my_region my_region my_bigball my_bigball my_heytap my_heytap my_stock my_stock my_preload my_preload my_manifest my_manifest my_engineering my_engineering
BOARD_OPLUS_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Platform
TARGET_BOARD_PLATFORM := taro

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true

ALLOW_MISSING_DEPENDENCIES = true # 由于同步的只有 TWRP 源码，编译时需要打开这个

VENDOR_SECURITY_PATCH := 2025-07-05 # 需要加入补丁更新日期来回避防回滚机制

TW_THEME := portrait_hdpi # TWRP 要使用的主题

TW_BRIGHTNESS_PATH := "/sys/devices/soc/c900000.qcom\x2cmdss_mdp/c900000.qcom\x2cmdss_mdp:qcom\x2cmdss_fb_primary/leds/lcd-backlight/brightness" # 亮度调节的内核节点

TW_MAX_BRIGHTNESS := 255 # 设置最高亮度

TW_DEFAULT_BRIGHTNESS := 155 # 设置最低亮度

TW_EXTRA_LANGUAGES := ture # 设置是否添加亚洲语言

TW_IGNORE_MISC_WIPE_DATA := true # 是否在 wipe data 时忽略 misc

TW_SCREEN_BLANK_ON_BOOT := true # 这个我也不知道什么作用

TW_NO_EXFAT_FUSE := true # 这个我也不知道什么作用

TW_INCLUDE_CRYPTO := true #是否添加加密支持

TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/commonsys/cryptfs_hw # 解密所需依赖的源码路径

RECOVERY_SDCARD_ON_DATA := true # 设置内部存储的数据是否在 data 分区

BOARD_HAS_NO_REAL_SDCARD := true # 这个我也不知道什么作用

BOARD_PROVIDES_GPTUTILS := true # 这个我也不知道什么作用

TW_USE_TOOLBOX := true # 是否使用 ToolBox

TWRP_INCLUDE_LOgcAT := true # 是否启用 logcat

TARGET_USES_LOGD := true # 是否启用 logcat



# 如果是 A/B 分区的话还得加入这些

A/B OTAAB_OTA_UPDATER := true

BOARD_USES_RECOVERY_AS_BOOT := true

BOARD_BUILD_SYSTEM_ROOT_IMAGE := true