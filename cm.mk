# Inherit some common MK stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

$(call inherit-product, device/huawei/viva/device_viva.mk)

# Release name
PRODUCT_RELEASE_NAME := cm_viva

# Preload bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := romfor
PRODUCT_NAME := cm_viva
PRODUCT_RELEASE_NAME := U9200
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := U9200
PRODUCT_MANUFACTURER := Huawei
