#!/recovery/sbin/sh
# Script to load correct initramfs files for normal/recovery boot

# Move ourself out of the way
/recovery/sbin/rm /init

# Set up kernel interfaces
/recovery/sbin/mkdir /proc
/recovery/sbin/mount -t proc proc /proc
/recovery/sbin/mkdir /sys
/recovery/sbin/mount -t sysfs sysfs /sys
/recovery/sbin/mkdir /dev
/recovery/sbin/mkdir /dev/block
/recovery/sbin/mknod /dev/block/mmcblk0p15 259 7
/recovery/sbin/mount /dev/block/mmcblk0p15 /cache

# Check for recovery mode and move appropriate files
if /recovery/sbin/test -e /cache/.startrecovery || /recovery/sbin/grep -q bootmode=2 /proc/cmdline; then
	/recovery/sbin/mv /recovery/* /
	/recovery/sbin/rm -rf /normal
	/recovery/sbin/rm /cache/.startrecovery
else
	/recovery/sbin/mv /normal/* /
	/recovery/sbin/rm -rf /recovery
fi

# Clean Up
/recovery/sbin/rm -rf /dev
/recovery/sbin/umount /cache

# Run init
exec /init
