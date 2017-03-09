#!/bin/bash
# Description: update rootfs for jf4418

DEV=$1

if [[ $DEV == "" ]]; then
	echo "Usage: update_rootfs.sh device"
	echo "Example: update_rootfs /dev/sda"
	exit 0
else
	echo "Umount all drive of device and mount rootfs partition"
	sudo umount ${DEV}*
	if [ ! -d ./rootfs ]; then
		sudo mkdir rootfs
	fi
	sudo mount ${DEV}2 ./rootfs
	if [ ! -d ./fat ]; then
                sudo mkdir fat
        fi
        sudo mount ${DEV}1 ./fat

	echo "Remove old rootfs"
	sudo rm -rf rootfs/*
	sync

	echo "Extract new rootfs"
	sudo tar -xf /home/ryan/yocto-fido/build/tmp/deploy/images/jf4418/image-base-jf4418.tar.gz -C ./rootfs
	sudo cp -a tmp/lib/firmware/ rootfs/lib/
	sudo cp /home/ryan/yocto-fido/build/tmp/deploy/images/jf4418/uImage fat/
	sync
	
	sudo umount ${DEV}*
	echo "Task completed!"
fi

