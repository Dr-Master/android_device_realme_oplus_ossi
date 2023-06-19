#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/oplus/ossi
# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_PACKAGES += \
    bootctrl.taro

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.taro \
    libgptutils \
    libz \
    libcutils

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

PRODUCT_PLATFORM := SM7475 # 定义平台

# A/B

AB_OTA_UPDATER := true # 是否打开 A/B 支持

AB_OTA_PARTITIONS += \ # 定义使用 A/B 特性的分区

   boot \

   system \

   vendor

AB_OTA_POSTINSTALL_CONFIG += \

   RUN_POSTINSTALL_system=true \     POSTINSTALL_PATH_system=system/bin/otapreopt_script \    

   FILESYSTEM_TYPE_system=ext4 \    

   POSTINSTALL_OPTIONAL_system=truePRODUCT_PACKAGES += \    

   otapreopt_script \

      cppreopts.sh \

      update_engine \

      update_verifier \

      update_engine_sideload

# Boot control

PRODUCT_PACKAGES += \

   android.hardware.boot@1.0-impl \

   android.hardware.boot@1.0-service \

   bootctrl.SM7475 \

PRODUCT_PACKAGES_DEBUG += \

   bootctl

PRODUCT_STATIC_BOOT_CONTROL_HAL := \

   bootctrl.SM7475 \

   libcutils \

   libgptutils \

   libz