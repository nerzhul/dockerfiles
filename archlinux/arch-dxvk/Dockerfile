FROM nerzhul/archlinux-mingw64-gcc:5.0.4

RUN echo -e "[multilib]\nSigLevel = PackageRequired\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf && \
	pacman -Sy --noconfirm vulkan-icd-loader wine git ninja meson glslang && useradd -m builder

ADD https://aur.archlinux.org/cgit/aur.git/snapshot/dxvk-git.tar.gz /tmp/

RUN cd /tmp/ && \
	tar xzf /tmp/dxvk-git.tar.gz && chown -R builder. dxvk-git

USER builder
RUN cd /tmp/dxvk-git && makepkg -s && rm -Rf src/ && \
	find /tmp/dxvk-git -name "*.pkg.tar.xz"

