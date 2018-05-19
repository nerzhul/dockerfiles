FROM arm64v8/debian:stretch

RUN apt-get update -yy && apt-get install git automake autoconf libtool libasr-dev libevent-dev libssl1.0-dev \
                zlib1g-dev make bison libpq-dev -yy \
        && git clone https://gitlab.com/nerzhul/opensmtpd.git -b 6.0.3p1-ldap-rbl opensmtpd
RUN      cd opensmtpd \
        && ./bootstrap \
        && ./configure --prefix=/docker-usr \
                --sysconfdir=/etc/smtpd \
                --libexecdir=/usr/lib \
                --with-path-empty=/var/lib/opensmtpd/empty \
        && make && make install
RUN cd .. && git clone https://gitlab.com/nerzhul/OpenSMTPD-extras.git -b custom
RUN cd OpenSMTPD-extras \
        && ./bootstrap \
        && ./configure --libexecdir=/usr/lib \
                --sysconfdir=/etc/smtpd \
                --with-path-empty=/var/lib/opensmtpd/empty \
                --with-filter-clamav \
                --with-filter-dkim-signer \
                --with-filter-dnsbl  \
                --with-filter-monkey \
                --with-filter-pause \
                --with-filter-regex \
                --with-filter-trace \
                --with-filter-void \
                --with-queue-null \
                --with-queue-ram \
                --with-table-ldap \
                --with-table-postgres \
                --with-table-socketmap \
                --with-table-passwd \
                --with-scheduler-ram \
        && sed -i '/static int ldap_run_query/a static int ldap_open(void);' extras/tables/table-ldap/table_ldap.c \
        && make && make install

FROM arm64v8/debian:stretch
RUN apt-get update -yy && apt-get install libasr0 libevent-2.0-5 libssl1.0.2 zlib1g libpq5 -yy \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*
RUN useradd -c "SMTP Daemon" -d /var/lib/opensmtpd/empty -s /sbin/nologin _smtpd \
        && useradd -c "SMTPD Queue" -d /var/lib/opensmtpd/empty -s /sbin/nologin _smtpq \
        && mkdir -p /var/lib/opensmtpd/empty /var/empty /usr/lib/smtpd

EXPOSE 25 465 587

VOLUME ["/etc/smtpd"]

COPY --from=0 /docker-usr/sbin /usr/sbin
COPY --from=0 /docker-usr/share /usr/share
COPY --from=0 /usr/lib/opensmtpd /usr/lib/opensmtpd

CMD ["/usr/sbin/smtpd", "-d", "-f", "/etc/smtpd/smtpd.conf"]

