## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

DEVICE_PACKAGE_OVERLAYS := device/samsung/venturi/overlay

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_venturi
PRODUCT_DEVICE := venturi
PRODUCT_BRAND := Android
PRODUCT_MANUFACTURER := Samsung
PRODUCT_MODEL := YP-G70

# Release name and versioning
PRODUCT_RELEASE_NAME := GalaxyPlayer

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-480x800

UTC_DATE := $(shell date +%s)
DATE := $(shell date +%Y%m%d)

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
	device/samsung/venturi/prebuilt/etc/asound.conf:system/etc/asound.conf \
	device/samsung/venturi/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
	device/samsung/venturi/prebuilt/etc/vold.conf:system/etc/vold.conf \
	device/samsung/venturi/prebuilt/lib/egl/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_PACKAGES += \
    audio.primary.s5pc110 \
    libaudiohw_legacy \
    audio.a2dp.default \
    audio.usb.default \
    hwcomposer.s5pc110 \
    Torch \
    libaudioutils

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/venturi/initramfs/init.venturi.rc:root/init.venturi.rc \
	device/samsung/venturi/initramfs/init.venturi.usb.rc:root/init.venturi.rc \
	device/samsung/venturi/initramfs/init.usb.rc:root/init.venturi.rc \
	device/samsung/venturi/initramfs/init.trace.rc:root/init.venturi.rc \
	device/samsung/venturi/initramfs/lpm.rc:root/lpm.rc \
	device/samsung/venturi/initramfs/ueventd.rc:root/ueventd.rc \
	device/samsung/venturi/initramfs/ueventd.venturi.rc:root/ueventd.venturi.rc

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PACKAGES += \
    Superuser \
    Trebuchet \
    su \

# Audio
PRODUCT_COPY_FILES += \
	device/samsung/venturi/audio/libasound.so:system/lib/libasound.so \
	device/samsung/venturi/audio/libaudio.so:system/lib/libaudio.so \
	device/samsung/venturi/audio/libaudiopolicy.so:system/lib/libaudiopolicy.so

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	device/samsung/venturi/prebuilt/usr/keylayout/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl \
	device/samsung/venturi/prebuilt/usr/idc/cytma340_input.idc:system/usr/idc/cytma340_input.idc \
	device/samsung/venturi/prebuilt/usr/keylayout/cytma340_input.kl:system/usr/keylayout/cytma340_input.kl

# Generated kcm keymaps
PRODUCT_PACKAGES := \
       cypress-touchkey.kcm \
       s3c-keypad.kcm

# Filesystem management tools
#PRODUCT_PACKAGES += \
#	make_ext4fs \
#	setup_fs

# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/samsung/venturi/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# Libs
PRODUCT_PACKAGES += \
        audio.primary.s5pc110 \
	libcamera \
	libstagefrighthw

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

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product, vendor/samsung/venturi/venturi-vendor.mk)
