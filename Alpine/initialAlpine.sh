#!/bin/ash

echo "Initialize Alpine"
echo "hostname?"
read hostname

wget "https://raw.githubusercontent.com/hqvvr7391/ServerScripts/master/Alpine/initializefile"
sed -i "s/<%HOSTNAME>/$hostname/g" initializefile
setup-alpine -f initializefile

reboot