README
======

1. Introduction
2. Examples
3. Authors
4. Original Authors
5. Repository

INTRODUCTION
============

**mkinitrd** is used to build an initial ramdisk. An initial ramdisk is a very small
set of files that are loaded into RAM and 'mounted' (as initramfs doesn't
actually use a filesystem) as the kernel boots (before the main root
filesystem is mounted).  The usual reason to use an initrd is because
you need to load kernel modules before mounting the root partition.
Usually these modules are required to support the filesystem used by the
root partition (ext3, reiserfs, xfs), or perhaps the controller that the
hard drive is attached to (SCSI, RAID, etc).  Essentially, there are so many
different options available in modern Linux kernels that it isn't practical
to try to ship many different kernels to try to cover everyone's needs.
It's a lot more flexible to ship a generic kernel and a set of kernel
modules for it. This version remains comptible with Slackware created
initramfs archives.


EXAMPLES
========

A simple example:  Build an initrd for a reiserfs root partition:  

  mkinitrd -c -m reiserfs  

Another example:  Build an initrd image using Linux 2.6.33.1 kernel
modules for a system with an ext3 root partition on /dev/sdb3:

  mkinitrd -c -k 2.6.33.1 -m ext3 -f ext3 -r /dev/sdb3

An example of a single encrypted partition setup:  

As a user convenience, the value for the '-r' option may also be specified as
'/dev/sda2' in this example:

  mkinitrd -c -k 2.6.33.1 \  
	 -m ext4:ehci-hcd:uhci-hcd:usbhid \  
	 -f ext4 -r /dev/mapper/lukssda2 \  
	 -C /dev/sda2

Finally, A more complex example:  

This one is for a LVM Volume Group (rootvg) comprising of two LVM Physical
Volumes, each of which is on a LUKS encrypted partition that will need to be
unlocked before the root filesystem (/dev/rootvg/lvroot) can be accessed.

  mkinitrd -c -k 2.6.29.6 \  
	 -m ext4:ehci-hcd:uhci-hcd:usbhid \  
	 -f ext4 -r /dev/rootvg/lvroot \  
	 -L -C /dev/sda2:/dev/sdb2

If run without options, mkinitrd will rebuild an initrd image using
the contents of the $SOURCE_TREE directory, or, if that directory
does not exist it will be created and populated, and then mkinitrd
will exit.  These options are handy for building an initrd mostly
by hand.  After creating /boot/initrd-tree/, you can add modules and
edit files by hand, and then rerun mkinitrd to create the initrd.


AUTHORS
=======

Pierre Innocent &lt;<A HREF="mailto:dev@breezeos.com">dev@breezeos.com</A>&gt;  

ORIGINAL AUTHORS
================

Patrick J. Volkerding &lt;<A HREF="mailto:volkerdi@slackware.com">volkerdi@slackware.com</A>&gt;  

REPOSITORY
==========

   Mkinitrd-brz github.io: https://dev-breeze-com.github.io/mkinitrd-brz  
   Mkinitrd-brz v1.0.0: https://www.github.com/dev-breeze-com/mkinitrd-brz  

