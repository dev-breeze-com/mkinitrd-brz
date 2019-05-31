##############################################################
#               CMake Project Wrapper Makefile               #
############################################################## 

PREFIX := /usr/local
SHELL := /bin/bash
RM    := rm -rf

all: ./build/Makefile
	@ tar --xz -cvf mkinitrd-brz-1.0.0.txz /etc/mkinitrd.conf /etc/mkinitrd-brz $(PREFIX)/share/mkinitrd-brz/ $(PREFIX)/share/doc/mkinitrd-brz/ $(PREFIX)/sbin/mkinitrd-brz $(PREFIX)/share/man/man5/mkinitrd.conf.5.gz $(PREFIX)/share/man/man8/mkinitrd.8.gz $(PREFIX)/share/man/man8/mkinitrd_command_generator.8.gz

./build/Makefile:
	@ (mkdir /etc/mkinitrd-brz)
	@ (cp initrd.conf /etc/mkinitrd.conf)
	@ (cp mkinitrd ${PREFIX}/sbin/mkinitrd-brz)
	@ (mkdir -p ${PREFIX}/share/mkinitrd-brz)
	@ (cp -a data/* ${PREFIX}/share/mkinitrd-brz/)
	@ (cp -a docs/man ${PREFIX}/share/)
	@ (cp -a docs/mkinitrd-brz ${PREFIX}/share/doc/)

