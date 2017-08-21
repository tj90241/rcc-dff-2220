#!/bin/bash

if [ -z "${1}" ] || [ -z "${2}" ] || [ -z "${3}" ]; then
	echo "Usage: ${0} <source-domain> <dest-domain> <cloned-image>"
	echo "ex: ${0} debian-base dhcp /var/ssd/libvirt/images/dhcp.qcow2"
	exit 0
fi

virt-clone \
	-o ${1}
	-n ${2}
	-f ${3}

