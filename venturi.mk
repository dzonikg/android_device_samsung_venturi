# Copyright (C) 2010 The Android Open Source Project
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

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.

# Inherit our vendor files
$(call inherit-product, vendor/samsung/venturi/venturi-vendor.mk)

#DEVICE_PACKAGE_OVERLAYS := device/samsung/venturi/overlay
#DEVICE_PACKAGE_OVERLAYS += device/samsung/venturi/overlay

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-480x800

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/venturi/init.rc:root/init.rc \
	device/samsung/venturi/init.venturi.rc:root/init.venturi.rc \
	device/samsung/venturi/init.venturi.gps.rc:root/init.venturi.gps.rc \
	device/samsung/venturi/init.venturi.usb.rc:root/init.venturi.usb.rc \
	device/samsung/venturi/lpm.rc:root/lpm.rc \
	device/samsung/venturi/ueventd.venturi.rc:root/ueventd.venturi.rc

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
	device/samsung/venturi/asound.conf:system/etc/asound.conf \
	device/samsung/venturi/vold.fstab:system/etc/vold.fstab \
	device/samsung/venturi/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_PACKAGES += \
	audio.primary.s5pc110 \
	audio.a2dp.default \
	audio.usb.default \
	hwcomposer.s5pc110 \
	libaudiohw_legacy \
	libhardware_legacy \
	libaudioutils \
	libs3cjpeg \
	libstagefrighthw \
	libtinyalsa \
	power.s5pc110 \
	tvouthack

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PACKAGES += \
	Superuser \
	Trebuchet \
	su

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	device/samsung/venturi/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl \
	device/samsung/venturi/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	device/samsung/venturi/cytma340_input.idc:system/usr/idc/cytma340_input.idc \
	device/samsung/venturi/cytma340_input.kl:system/usr/keylayout/cytma340_input.kl

# Generated kcm keymaps
PRODUCT_PACKAGES := \
       cypress-touchkey.kcm \
       s3c-keypad.kcm

# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/samsung/venturi/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/venturi/media_codecs.xml:system/etc/media_codecs.xml

PRODUCT_COPY_FILES += \
	device/samsung/venturi/audio_policy.conf:system/etc/audio_policy.conf

# Libs
PRODUCT_PACKAGES += \
	libcamera \
	libstagefrighthw \
	Torch

# Bluetooth MAC Address
PRODUCT_PACKAGES += \
	bdaddr_read

# Device-specific packages
PRODUCT_PACKAGES += \
	SamsungServiceMode \

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
        frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
       wifi.interface=wlan0 \
       wifi.supplicant_scan_interval=15 \
       dalvik.vm.heapsize=128m

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.locationfeatures=1 \
        ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.android.checkjni=0 \
	dalvik.vm.checkjni=false \
	persist.sys.vold.switchexternal=1

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Include additional hardware makefiles
# Broadcom Wi-Fi
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/Android.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# Samsung
$(call inherit-product-if-exists, hardware/samsung/Android.mk)

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/venturi/venturi-vendor.mk)
