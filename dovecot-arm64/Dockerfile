FROM arm64v8/alpine:3.10

RUN apk add --no-cache dovecot dovecot-ldap dovecot-lmtpd dovecot-pigeonhole-plugin \
	dovecot-fts-solr

EXPOSE 143
EXPOSE 993

VOLUME ["/etc/dovecot", "/var/lib/dovecot"]

CMD ["/usr/sbin/dovecot", "-F", "-c", "/etc/dovecot/dovecot.conf"]
