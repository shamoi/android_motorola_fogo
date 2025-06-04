#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

export ALLOW_MISSING_DEPENDENCIES=true
export BUILD_BROKEN_DUP_RULES=true
export BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES=true

add_lunch_combo twrp_fogo-user
add_lunch_combo twrp_fogo-userdebug
add_lunch_combo twrp_fogo-eng
