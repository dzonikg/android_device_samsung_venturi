LOCAL_PATH := $(call my-dir)

# Make a combined ramdisk
COMBINED_RD := $(PRODUCT_OUT)/combined
$(COMBINED_RD) : $(recovery_ramdisk) $(INSTALLED_RAMDISK_TARGET)
	rm -rf $(COMBINED_RD)
	mkdir -pv $(COMBINED_RD)/{,recovery,normal,dev,proc,sys,cache}
	cp -rfa $(PRODUCT_OUT)/root/* -t $(COMBINED_RD)/normal/
	cp -rfa $(PRODUCT_OUT)/recovery/root/* -t $(COMBINED_RD)/recovery/
	cp -f $(TARGET_DEVICE_DIR)/init.sh $(COMBINED_RD)/init
	cp -f $(PRODUCT_OUT)/recovery/root/sbin/recovery $(COMBINED_RD)/busybox
	chmod 755 $(COMBINED_RD)/init $(COMBINED_RD)/busybox

# Add ramdisk dependencies to kernel
TARGET_KERNEL_BINARIES: $(COMBINED_RD)

$(INSTALLED_BOOTIMAGE_TARGET): $(INSTALLED_KERNEL_TARGET) | $(ACP)
	$(call pretty,"Boot image: $@")
	$(ACP) $(INSTALLED_KERNEL_TARGET) $@

$(INSTALLED_RECOVERYIMAGE_TARGET): $(INSTALLED_BOOTIMAGE_TARGET) | $(ACP)
	$(ACP) $(INSTALLED_BOOTIMAGE_TARGET) $@
