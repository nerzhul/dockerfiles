FROM nerzhul/archlinux:base-devel

RUN pacman -Sy --noconfirm gcc-ada ppl git && useradd -m builder

ADD https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-binutils.tar.gz https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-gcc.tar.gz https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-headers.tar.gz https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-headers.tar.gz https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-winpthreads.tar.gz https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-crt-bin.tar.gz https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-crt-bin.tar.gz https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-headers-bootstrap.tar.gz https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-gcc-base.tar.gz https://aur.archlinux.org/cgit/aur.git/snapshot/cloog-git.tar.gz /tmp/

RUN cd /tmp/ && \
	tar xzf /tmp/mingw-w64-binutils.tar.gz && chown -R builder. mingw-w64-binutils && \
	tar xzf /tmp/mingw-w64-headers.tar.gz && chown -R builder. mingw-w64-headers && \
	tar xzf /tmp/mingw-w64-winpthreads.tar.gz && chown -R builder. mingw-w64-winpthreads && \
	tar xzf /tmp/mingw-w64-crt-bin.tar.gz && chown -R builder. mingw-w64-crt-bin && \
	tar xzf /tmp/mingw-w64-headers-bootstrap.tar.gz && chown -R builder. mingw-w64-headers-bootstrap && \
	tar xzf /tmp/mingw-w64-gcc-base.tar.gz && chown -R builder. mingw-w64-gcc-base && \
	tar xzf /tmp/mingw-w64-gcc.tar.gz && chown -R builder. mingw-w64-gcc && \
	tar xzf /tmp/cloog-git.tar.gz && chown -R builder. cloog-git

USER builder
RUN gpg --recv-keys 13FCEF89DD9E3C4F && \
	gpg --recv-keys 93BDB53CD4EBC740 && \
	gpg --recv-keys A328C3A2C3C45C06 && \
	cd /tmp/cloog-git && makepkg -s && rm -Rf src/ && \
	cd /tmp/mingw-w64-binutils && makepkg -s && rm -Rf src/ && \
	cd /tmp/mingw-w64-headers && makepkg -s && rm -Rf src/ && \
	cd /tmp/mingw-w64-crt-bin && makepkg -s && rm -Rf src/

USER root
RUN pacman -U --noconfirm /tmp/cloog-git/cloog*.tar.xz \
	/tmp/mingw-w64-binutils/mingw-w64-binutils*.tar.xz /tmp/mingw-w64-headers/mingw-w64-headers*.tar.xz /tmp/mingw-w64-crt-bin/mingw-w64-crt-bin*.tar.xz

USER builder
RUN cd /tmp/mingw-w64-headers-bootstrap && makepkg -s && rm -Rf src/

USER root
RUN pacman -U --noconfirm /tmp/mingw-w64-headers-bootstrap/mingw-w64-headers*.tar.xz

USER builder
RUN cd /tmp/mingw-w64-gcc-base && makepkg -s && rm -Rf src/

USER root
RUN pacman -U --noconfirm /tmp/mingw-w64-gcc-base/mingw-w64-gcc-base*.tar.xz

USER builder
RUN cd /tmp/mingw-w64-winpthreads && makepkg -s && rm -Rf src/

USER root
RUN pacman -Rdd --noconfirm mingw-w64-headers-bootstrap && pacman -U --noconfirm /tmp/mingw-w64-winpthreads/mingw-w64-winpthreads*.tar.xz

USER builder
RUN cd /tmp/mingw-w64-gcc && sed -i 's/ftp.gnu.org/ftp.igh.cnrs.fr\/pub/g' PKGBUILD && makepkg -s

RUN find /tmp -name *.pkg.tar.xz
