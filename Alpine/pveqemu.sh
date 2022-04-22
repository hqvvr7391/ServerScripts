#!/bin/ash

apk add qemu-guest-agent
rc-update add qemu-guest-agent boot
