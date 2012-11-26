LOCAL_PATH := $(call my-dir)

# Add ramdisk dependencies to kernel
TARGET_KERNEL_BINARIES: $(recovery_ramdisk) $(INSTALLED_RAMDISK_TARGET)

$(INSTALLED_BOOTIMAGE_TARGET): $(INSTALLED_KERNEL_TARGET)
	$(call pretty,"Boot image: $@")
	$(hide) device/samsung/venturi_usa/mkshbootimg.py $@ $(INSTALLED_KERNEL_TARGET) $(INSTALLED_RAMDISK_TARGET) $(recovery_ramdisk)

$(INSTALLED_RECOVERYIMAGE_TARGET): $(INSTALLED_BOOTIMAGE_TARGET) | $(ACP)
	$(ACP) $(INSTALLED_BOOTIMAGE_TARGET) $@
