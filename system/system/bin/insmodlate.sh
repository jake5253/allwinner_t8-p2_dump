#! /system/bin/sh
#gpio driver
#cat /sys/devices/platform/soc/usbc0/usb_device
#sw-keyboard
#echo usb_host > sys/devices/platform/soc/usbc0/otg_role
#usb camera module
#`insmod /system/vendor/modules/videobuf2-vmalloc.ko`&
#`insmod /system/vendor/modules/uvcvideo.ko`&

#touch 
#`insmod /system/vendor/modules/goodix_touch.ko`&

#sw-keystore
mount -o rw,remount /dev/root
mkdir /bootloader
chown system:system /bootloader
chmod 777 /bootloader
mount -o ro,remount /dev/root
#bt

#tvin


#csi


#wifi
`insmod /vendor/modules/8188fu.ko ifname=wlan0 if2name=p2p0`&
`insmod /vendor/modules/8188eu.ko ifname=wlan0 if2name=p2p0`&


#radio
#cat /sys/devices/platform/soc/usbc0/usb_host