FROM arm64v8/alpine:latest

ADD https://github.com/gohugoio/hugo/releases/download/v0.40.2/hugo_0.40.2_Linux-ARM64.tar.gz /root
WORKDIR /usr/bin
RUN tar xfz /root/hugo_0.40.2_Linux-ARM64.tar.gz hugo && rm -f /root/hugo_0.40.2_Linux-ARM64.tar.gz

CMD ["/bin/sh"]

