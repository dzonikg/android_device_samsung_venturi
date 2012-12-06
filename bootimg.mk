LOCAL_PATH := $(call my-dir)

$(INSTALLED_BOOTIMAGE_TARGET): $(INSTALLED_KERNEL_TARGET) $(recovery_ramdisk) $(INSTALLED_RAMDISK_TARGET) | $(ACP)
	$(call pretty,"Boot image: $@")
	$(hide) ./device/samsung/venturi/mkbootimg.py $@ $(TARGET_PREBUILT_KERNEL) $(INSTALLED_RAMDISK_TARGET) $(recovery_ramdisk)

$(INSTALLED_RECOVERYIMAGE_TARGET): $(INSTALLED_BOOTIMAGE_TARGET)
	$(ACP) $(INSTALLED_BOOTIMAGE_TARGET) $@
