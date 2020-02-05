FROM alpine:3.11.3

ENV HUGO_VERSION 0.64.0
ENV HUGO_ARCH 64bit
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-${HUGO_ARCH}.tar.gz /root
WORKDIR /usr/bin
RUN tar xfz /root/hugo_${HUGO_VERSION}_Linux-${HUGO_ARCH}.tar.gz hugo && rm -f /root/hugo_${HUGO_VERSION}_Linux-${HUGO_ARCH}.tar.gz

CMD ["/bin/sh"]

