# Inherit some common CM stuff.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# We are not actually a phone, so we do not support SMS, nor
# do we have space on /system for a bunch of live wallpapers
$(call inherit-product, vendor/cm/config/common_mini_tablet_wifionly.mk)

# Inherit device configuration.
$(call inherit-product, device/samsung/venturi/full_venturi.mk)

# Override these values once again
PRODUCT_NAME := cm_venturi
PRODUCT_DEVICE := venturi
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := YP-G70
PRODUCT_RELEASE_NAME := GalaxyPlayer
