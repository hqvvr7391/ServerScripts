#!/bin/ash

echo "Initialize Alpine"
echo "hostname?"
read hostname

wget "https://raw.githubusercontent.com/hqvvr7391/ServerScripts/master/Alpine/initializefile"
sed -i "s/<%HOSTNAME>/$hostname/g" initializefile
setup-alpine -f initializefile

mkdir /mnt/test3
mount /dev/sda3 /mnt/test3
wget "https://raw.githubusercontent.com/hqvvr7391/ServerScripts/master/Alpine/postinitial.sh"
chmod +x postinitial.sh

umount /mnt/test3

#reboot