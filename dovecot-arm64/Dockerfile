FROM arm64v8/debian:stretch

ENV DOVECOT_VERSION 2.2.27

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        dovecot-core=${DOVECOT_VERSION}* dovecot-imapd=${DOVECOT_VERSION}* dovecot-ldap=${DOVECOT_VERSION}* \
        dovecot-lmtpd=${DOVECOT_VERSION}* dovecot-managesieved=${DOVECOT_VERSION}* dovecot-sieve=${DOVECOT_VERSION}* \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 143
EXPOSE 993

VOLUME ["/etc/dovecot", "/var/lib/dovecot"]

CMD ["/usr/sbin/dovecot"]