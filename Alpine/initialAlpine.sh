#!/bin/ash

echo "Initialize Alpine"
echo "hostname?"
read hostname

wget "https://raw.githubusercontent.com/hqvvr7391/ServerScripts/master/Alpine/initializefile"
sed -i "s/<%HOSTNAME>/$hostname/g" initializefile
setup-alpine -f initializefile

mkdir /mnt/disk
mount /dev/vg0/lv_root /mnt/disk 
cd /mnt/disk/root
wget "https://raw.githubusercontent.com/hqvvr7391/ServerScripts/master/Alpine/postinitial.sh"
chmod +x postinitial.sh

umount /mnt/disk

#reboot