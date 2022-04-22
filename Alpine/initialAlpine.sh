#!/bin/ash

echo "Initialize Alpine"
echo "hostname?"
read hostname

wget https://github.com/hqvvr7391/ServerScript/blob/master/Alpine/initializefile initializefile
sed -i "s/<%HOSTNAME>/$hostname/g" initializefile
setup-alpine -f initializefile


/etc/init.d/networking --quiet start &


sed '3s/# //' /etc/apk/repositories


apk add sudo
echo "username?"
read username
adduser add $username
echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel
adduser $username wheel

apk upgrade --available && sync
apk update

passwd -l root

reboot