#!/bin/ash
echo "remove SwapMemory"

apk add e2fsprogs-extra
swapoff -a
#/etc/fstab
lvremove /dev/vg0/lv_swap
lvextend -l +100%FREE /dev/vg0/lv_root
resize2fs /dev/vg0/lv_root

free -m
lvdisplay