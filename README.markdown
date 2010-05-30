Buildroot for the Bifferboard
=============================

This is a fork of the [Buildroot GIT repository][] to add support for
Bifferboard targets.

[Buildroot][] is a set of Makefiles and patches that makes it easy to setup
a cross-compiler toolchain and generate complete embedded Linux system
images. It provides an easy to use Linux-kernel-like configuration system
and comes with a large selection of preconfigured packages that can be
compiled for the target platform. As output, Buildroot can generate kernel
images, ramdisk images, root filesystems, and boot loaders. It supports a
variety of CPU architectures including x86, ARM, MIPS, etc.

The [Bifferboard][] is a i486-based embedded computer with a very low power
consumption of only 1W. Is comes with 32MB of RAM, 8MB of Flash storage,
100 MBit/s Ethernet and provides up to two USB 2.0 ports for extensions. By
default the Bifferboard ships with the [Bifferboard Mini Distribution][] on
Flash and the [Bifferboard Wiki][] contains instructions for installing a
variety of other Linux variants on the board.

This fork of Buildroot adds support for the Bifferboard as a default
target. It includes a number of Linux kernel patches required to support
the Bifferboard's CPU and other features provided by the board, such as
control of GPIO pins. In addition to making the Bifferboard a configurable
target, this distribution also includes a selection of sensible default
configurations for different application scenarios. At the same time board
system developers have full control over every aspect of the target's
configuration and can benefit from Buildroot's vast selection of different
packages.

[Buildroot]: http://buildroot.uclibc.org/
[Buildroot GIT repository]: git://git.buildroot.net/buildroot

[Bifferboard]: http://bifferos.bizhat.com/
[Bifferboard Wiki]: http://sites.google.com/site/bifferboard/
[Bifferboard Mini Distribution]: http://sites.google.com/site/bifferboard/Home/bifferboard-mini-distribution

Getting Started
---------------

1. Clone the repository:

        $ git clone git://github.com/nobits/buildroot-bifferboard.git

2. Initial configuration using defaults. The following default 
   configurations are currently available:
   
   * `bifferboard_minimal_defconfig`: A minimal configuration with a default
     Busybox configuration and no additional packages.
   * `bifferboard_ssh_defconfig`: A minimal configuration + SSH server and
     the default 'root' password set to 'bifferboard.
 
   To use a default configuration, execute the following:

        $ cd buildroot-bifferboard
        $ make bifferboard_ssh_defconfig

3. Optionally customize the configuration:

        $ make menuconfig

4. Build the target kernel image and root filesystem image:

        $ make

5. Upload the kernel image to the Bifferboard:

        $ sudo python target/device/bifferboard/tools/bb_eth_upload8.py \
              eth0 <BIFFERBOARD_MAC_ADDRESS> output/images/bzImage

  Now power up your Bifferboard and ensure it is connected to the network.

6. Copy the root filesystem image to a USB stick (`/dev/sdb1`):

        $ sudo dd if=output/images/rootfs.ext2 of=/dev/sdb1

7. Plug the USB stick into the Bifferboard and reboot.
