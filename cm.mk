# Inherit some common CM stuff.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration.
$(call inherit-product, device/samsung/venturi/full_venturi.mk)

# Override these values once again
PRODUCT_NAME := cm_venturi
PRODUCT_DEVICE := venturi
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := YP-G70
PRODUCT_RELEASE_NAME := GalaxyPlayer
