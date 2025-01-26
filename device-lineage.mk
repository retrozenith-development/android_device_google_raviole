#
# SPDX-FileCopyrightText: 2021-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2021-2024 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay-lineage

# ANGLE - Almost Native Graphics Layer Engine
PRODUCT_PACKAGES += \
    ANGLE

# Camera
$(call inherit-product-if-exists, vendor/google/camera/config.mk)

# EUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

# Fingerprint
TARGET_HAS_UDFPS := true

# IWLAN
PRODUCT_PACKAGES += \
    Iwlan

# PowerShare
include hardware/google/pixel/powershare/device.mk

# Pixel Parts
$(call inherit-product-if-exists, packages/apps/PixelParts/device.mk)

# ViPER4AndroidFX
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += system/app/ViPER4AndroidFX/ViPER4AndroidFX.apk
$(call inherit-product-if-exists, packages/apps/ViPER4AndroidFX/config.mk)

# wireless_charger HAL service
include device/google/gs-common/wireless_charger/wireless_charger.mk

# Build necessary packages for vendor

# Codec2
PRODUCT_PACKAGES += \
    libexynosv4l2

# Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Graphics
PRODUCT_PACKAGES += \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle

# Sensors
PRODUCT_PACKAGES += \
    sensors.dynamic_sensor_hal
