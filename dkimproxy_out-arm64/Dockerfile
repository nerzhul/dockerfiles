FROM arm64v8/alpine:latest

COPY dkimproxy.out /usr/sbin/dkimproxy.out
COPY dkimproxy_out.conf /etc/dkimproxy/dkimproxy_out.conf

RUN apk add --no-cache dkimproxy && \
	chmod 755 /usr/sbin/dkimproxy.out

EXPOSE 10027

USER dkimproxy:dkimproxy

CMD ["/usr/sbin/dkimproxy.out", "--conf_file=/etc/dkimproxy/dkimproxy_out.conf"]

