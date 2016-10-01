FROM base/archlinux:latest
MAINTAINER Loic Blot <loic.blot@unix-experience.fr>
RUN echo 'Server = http://archlinux.de-labrusse.fr/$repo/os/$arch' > /etc/pacman.d/mirrorlist
RUN pacman -Sy
RUN pacman --noconfirm -S archlinux-keyring && \
	pacman --noconfirm -S bash base-devel base && ln -s /usr/lib/libncursesw.so.6 /usr/lib/libncursesw.so.5 && \
	pacman-db-upgrade && \
	pacman --noconfirm -R xfsprogs vi nano dhcpcd lvm2 netctl linux mkinitcpio psmisc device-mapper cryptsetup libusb usbutils systemd-sysvcompat systemd pcmciautils reiserfsprogs procps-ng hwids pciutils fakeroot && \
	pacman --noconfirm -S git clang cmake libunistring && \
	pacman --noconfirm -Su && \
	find /var/cache/pacman/pkg/ -name "*.xz" -delete
