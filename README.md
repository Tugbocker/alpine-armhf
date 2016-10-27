# alpine-armhf


A super small Docker image based on [Alpine chroot](https://wiki.alpinelinux.org/wiki/Installing_Alpine_Linux_in_a_chroot). The image is only 6 MB and has access to a package repository that is much more complete than other BusyBox based images

```console
REPOSITORY               TAG                 IMAGE ID                  SIZE
tugbocker/alpine-armhf   latest              9601d5b346dc              6.009 MB
```

### Pull image

```console
$ docker pull tugbocker/alpine-armhf
```

### Build

```console
$ git clone https://github.com/Tugbocker/alpine-armhf.git
$ mkdir rootfs/
$ sudo ./mkrootfs.bash
$ docker build .
```
