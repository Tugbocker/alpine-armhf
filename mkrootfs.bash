#!/usr/bin/env bash
mirror="http://dl-cdn.alpinelinux.org/alpine"
version="2.6.7-r0"
chroot_dir="`pwd`/rootfs/"

# Check root level permissions
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Check architecture
if [[ `uname -m` != armv7* ]]
  then echo "Supported architectures ARMv7+"
  exit
fi

# Download the latest apk static package
curl ${mirror}/latest-stable/main/armhf/apk-tools-static-${version}.apk -O

# .apk packages are just gzipped tarballs
tar -xvzf apk-tools-static-*.apk sbin

# Install the alpine base installation onto the chroot
./sbin/apk.static -X ${mirror}/latest-stable/main -U --allow-untrusted --root ${chroot_dir} --initdb add alpine-base

# Set up APK repositories
echo "${mirror}/latest-stable/main/" > ${chroot_dir}/etc/apk/repositories

# save
tar -z -f rootfs.tar.gz --numeric-owner -C ${chroot_dir} -c .
chmod 666 rootfs.tar.gz
