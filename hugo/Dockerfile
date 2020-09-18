FROM alpine:3.12

ADD https://github.com/gohugoio/hugo/releases/download/v0.74.3/hugo_0.74.3_Linux-64bit.tar.gz /root
WORKDIR /usr/bin
RUN tar xfz /root/hugo_0.74.3_Linux-64bit.tar.gz hugo && \
	chmod +x hugo && \
	rm -f /root/hugo_0.74.3_Linux-64bit.tar.gz && \
	apk add --no-cache git

CMD ["/bin/sh"]

