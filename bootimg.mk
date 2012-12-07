LOCAL_PATH := $(call my-dir)

$(INSTALLED_BOOTIMAGE_TARGET): $(INSTALLED_KERNEL_TARGET) $(recovery_ramdisk) $(INSTALLED_RAMDISK_TARGET)
	$(call pretty,"Boot image: $@")
	$(hide) ./device/samsung/venturi/mkbootimg.py $@ $(INSTALLED_KERNEL_TARGET) $(INSTALLED_RAMDISK_TARGET) $(recovery_ramdisk)

$(INSTALLED_RECOVERYIMAGE_TARGET): $(INSTALLED_BOOTIMAGE_TARGET) | $(ACP)
	$(ACP) $(INSTALLED_BOOTIMAGE_TARGET) $@
