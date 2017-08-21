#!/bin/bash

virt-install \
	--name debian-base \
	--virt-type kvm \
	--arch x86_64 --vcpus=1 --cpu host \
	--memory 512 \
	--os-type=linux \
	--os-variant=debianwheezy \
	--disk pool=images,size=4,bus=virtio,sparse=false,cache=none,discard=unmap \
	--cdrom /home/tyler/debian-netinst.iso \
	--network bridge=br0,model=virtio \
	--graphics spice,listen=10.0.0.1 \
	--sound none

