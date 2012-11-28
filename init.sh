#!/busybox sh
# Script to load correct initramfs files for normal/recovery boot

# Set up environment
export _PATH="$PATH"
export PATH="/"

# Log our output
busybox date >> /boot.txt
exec >> /boot.txt 2>&1

# Set up kernel interfaces
busybox mount -t proc proc /proc
busybox mount -t sysfs sysfs /sys

# Move ourself out of the way
busybox rm /init

# Mount /cache
busybox mkdir /dev/block
busybox mknod /dev/block/mmcblk0p15 b 259 7
# busybox mount /dev/block/mmcblk0p15 /cache
busybox mount -t ext4 /dev/block/mmcblk0p15 /cache

# Check for recovery mode and move appropriate files
if busybox test -e /cache/.startrecovery || busybox grep -q bootmode=2 /proc/cmdline; then
	# Recovery boot
	busybox mv /recovery/* /
#	busybox rm -rf /normal
	busybox rm /cache/.startrecovery

	# Disable lpm
	busybox echo 0 > /sys/class/power_supply/battery/charging_mode_booting
else
	busybox mv /normal/* /
#	busybox rm -rf /recovery
fi

# Should we enter low power mode?
if busybox grep -q 1 /sys/class/power_supply/battery/charging_mode_booting ; then
	busybox cp -f lpm.rc init.rc
fi

# Clean Up
busybox umount /cache
busybox umount /sys
busybox umount /proc
busybox date >> /boot.txt

# Final stage - remove busybox
busybox rm /busybox

# Run init
export PATH="${_PATH}"
exec /init
