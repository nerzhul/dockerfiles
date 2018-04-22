FROM arm64v8/debian:stretch

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        dovecot-core dovecot-imapd dovecot-ldap \
        dovecot-lmtpd dovecot-managesieved dovecot-sieve \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 143
EXPOSE 993

VOLUME ["/etc/dovecot", "/var/lib/dovecot"]

CMD ["/usr/sbin/dovecot", "-F", "-c", "/etc/dovecot/dovecot.conf"]