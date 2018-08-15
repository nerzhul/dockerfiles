FROM nerzhul/archlinux:base-devel

RUN cd /tmp && \
	curl https://ftp.unix-experience.fr/archlinux/cloog-git-0.18.4-3-x86_64.pkg.tar.xz -O && \
	curl https://ftp.unix-experience.fr/archlinux/mingw-w64-binutils-2.31.1-1-x86_64.pkg.tar.xz -O && \
	curl https://ftp.unix-experience.fr/archlinux/mingw-w64-crt-bin-5.0.4-1-any.pkg.tar.xz -O && \
	curl https://ftp.unix-experience.fr/archlinux/mingw-w64-gcc-8.2.0-1-x86_64.pkg.tar.xz -O && \
	curl https://ftp.unix-experience.fr/archlinux/mingw-w64-headers-5.0.4-2-any.pkg.tar.xz -O && \
	curl https://ftp.unix-experience.fr/archlinux/mingw-w64-winpthreads-5.0.4-1-any.pkg.tar.xz -O && \
	pacman --noconfirm -U /tmp/*.pkg.tar.xz && \
	rm -f /tmp/*.pkg.tar.xz

