#!/bin/bash

# requested during the episode. Not maintained, YMMV
# probably could be much better :)
# please note, the rhel images are not publicly available
# so if you want that bit to work you have to get / make them
# see http://libguestfs.org/virt-builder-repository.1.html for ideas

VIRSH_NAME="f31-crc"
if [ $1 ]; then
   VIRSH_NAME=$1;
fi

BUILDER_NAME="fedora-31"
OS_VARIANT="fedora30"

if [ $2 = "rhel8" ]; then
    BUILDER_NAME="rhel-8.1"
    OS_VARIANT="rhel8.1"
fi

DISK_PATH="/mnt/vms"
OUTPUT_LOG="prep-machine.$VIRSH_NAME.log"
QCOW="$DISK_PATH/$VIRSH_NAME.qcow2"

LIBGUESTFS_DEBUG=1
LIBGUESTFS_TRACE=1

virsh destroy $VIRSH_NAME 2>&1 | tee $OUTPUT_LOG
virsh undefine $VIRSH_NAME 2>&1 | tee -a $OUTPUT_LOG
rm -v $QCOW 2>&1 | tee -a $OUTPUT_LOG
#i am not super confident that this works
#correctly, but i think so
qemu-img create -f qcow2 $QCOW 100G
virt-builder $BUILDER_NAME \
	-o $QCOW \
	--format qcow2 \
	--hostname $VIRSH_NAME.langdon.rht.com \
	--size 100G \
	--selinux-relabel \
	--firstboot-command \
	            'useradd -m -G wheel -p "" lwhite ; chage -d 0 lwhite; cp -R ~/.ssh /home/lwhite/ && chown -R lwhite:lwhite /home/lwhite/.ssh' \
	--ssh-inject "root:file:/home/lwhite/.ssh/rht.id_rsa.pub" \
	2>&1 | tee -a $OUTPUT_LOG
virt-install \
	--name "$VIRSH_NAME" \
	--memory 8192 \
	--vcpus 4 \
	--disk $QCOW \
	--import \
	--noautoconsole \
	--os-variant $OS_VARIANT \
	2>&1 | tee -a $OUTPUT_LOG
echo "sleeping 5 seconds to get an ip"
sleep 5
echo attempting to get ip using: virsh net-dhcp-leases default
virsh net-dhcp-leases default 2>&1 | tee -a $OUTPUT_LOG
