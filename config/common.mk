#
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
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

# Gboard configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.theme_id=5 \
    ro.com.google.ime.system_lm_dir=/product/usr/share/ime/google/d3_lms

# SetupWizard configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.esim_cid_ignore=00000001 \
    ro.setupwizard.rotation_locked=true \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    setupwizard.feature.day_night_mode_enabled=true \
    setupwizard.feature.portal_notification=true \
    setupwizard.feature.show_pai_screen_in_main_flow.carrier1839=false \
    setupwizard.feature.show_pixel_tos=true \
    setupwizard.feature.show_support_link_in_deferred_setup=false \
    setupwizard.feature.skip_button_use_mobile_data.carrier1839=true \
    setupwizard.theme=glif_v3_light

# StorageManager configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.storage_manager.show_opt_in=false

# OPA configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.opa.eligible_device=true

# Google Play services configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=android-google \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent

# CarrierSetup configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.carriersetup.vzw_consent_page=true

# Use gestures by default
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural;com.google.android.systemui.gxoverlay

# Turn off storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=false

# DRM Service
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    media.mediadrmservice.enable=true

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    NexusLauncherRelease \
    SettingsGoogle \
    SystemUIGoogle

# SystemUI
PRODUCT_SYSTEM_PROPERTIES += \
    dalvik.vm.systemuicompilerfilter=speed

# libpowerstatshaldataprovider
PRODUCT_PACKAGES += \
    libpowerstatshaldataprovider

# Black theme
PRODUCT_PACKAGES += \
    AndroidBlackThemeOverlay

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED ?= true
ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    FaceUnlockService
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face_unlock_service.enabled=$(TARGET_FACE_UNLOCK_SUPPORTED)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/vortex/overlay

# VortexAOSP specific broadcast actions whitelist
PRODUCT_COPY_FILES += \
    vendor/vortex/config/permissions/vortex-sysconfig.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/vortex-sysconfig.xml

ifeq ($(TARGET_BUILD_LINEAGEHW), true)
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/vortex/config/device_framework_matrix.xml

# LineageHW permission
PRODUCT_COPY_FILES += \
    vendor/vortex/config/permissions/privapp-permissions-lineagehw.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-lineagehw.xml

# Permissions for lineage sdk services
PRODUCT_COPY_FILES += \
    vendor/vortex/config/permissions/org.lineageos.health.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.lineageos.health.xml \
    vendor/vortex/config/permissions/org.lineageos.livedisplay.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.lineageos.livedisplay.xml
endif

# Inherit from lewdboratory config
$(call inherit-product-if-exists, vendor/lewdboratory/packages.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Inherit from apex config
$(call inherit-product, vendor/vortex/config/apex.mk)

# Inherit from audio config
$(call inherit-product, vendor/vortex/config/audio.mk)

# Inherit from bootanimation config
$(call inherit-product, vendor/vortex/config/bootanimation.mk)

# Inherit from gfonts config
$(call inherit-product, vendor/vortex/config/gfonts.mk)

# Inherit from packages config
$(call inherit-product, vendor/vortex/config/packages.mk)

# Inherit from fonts config
$(call inherit-product, vendor/vortex/config/fonts.mk)

# Inherit from rro_overlays config
$(call inherit-product, vendor/vortex/config/rro_overlays.mk)

# Inherit from sepolicy config
$(call inherit-product, vendor/vortex/config/sepolicy.mk)

# Inherit from our versioning
$(call inherit-product, vendor/vortex/config/versioning.mk)

# Inherit from GMS product config
$(call inherit-product, vendor/gms/gms_full.mk)

# Inherit from Pixel-Framework
$(call inherit-product, vendor/pixel-framework/config.mk)