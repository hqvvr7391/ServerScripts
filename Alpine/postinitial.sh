#!/bin/ash
echo "Post Initialize Alpine"

sed -i '3s/# //' /etc/apk/repositories

apk add sudo
echo "username?"
read username
adduser "$username"
echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel
adduser "$username" wheel

read -p "Wanna install qemu-guest-agent? [y/n]: y " qemu
qemu=${qemu:-y}
if [ $qemu = "y" ] 
then
    wget "https://raw.githubusercontent.com/hqvvr7391/ServerScripts/master/Alpine/pveqemu.sh"
    chmod +x pveqemu.sh
    ./pveqemu.sh
    rm pveqemu.sh
fi

apk upgrade --available && sync
apk update

passwd -l root
rm ./postinitial.sh