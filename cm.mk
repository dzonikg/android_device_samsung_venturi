## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/venturi/venturi.mk)

# Inherit our vendor files dawg
$(call inherit-product, vendor/samsung/venturi/venturi-vendor.mk)

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
