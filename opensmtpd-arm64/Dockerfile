# Build image
FROM arm64v8/debian:stretch

RUN apt-get update -yy && apt-get install git automake autoconf libtool libasr-dev libevent-dev \
                zlib1g-dev make bison libpq-dev git libdb5.3-dev -yy

RUN git clone https://github.com/libressl-portable/portable -b OPENBSD_6_4 libressl && cd libressl && \
	./autogen.sh && ./configure --prefix=/usr && make && make install && \
	cd ..

RUN git clone https://gitlab.com/nerzhul/opensmtpd.git -b 6.4.0-portable-nrz opensmtpd

RUN      cd opensmtpd \
        && ./bootstrap \
        && ./configure --prefix=/docker-usr \
                --sysconfdir=/etc/smtpd \
                --libexecdir=/usr/lib \
		--with-table-db \
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
		--with-table-db \
                --with-table-ldap \
                --with-table-postgres \
                --with-table-socketmap \
                --with-table-passwd \
                --with-scheduler-ram \
        && sed -i '/static int ldap_run_query/a static int ldap_open(void);' extras/tables/table-ldap/table_ldap.c \
        && make && make install

# Runtime image
FROM arm64v8/debian:stretch
RUN apt-get update -yy && apt-get install libasr0 libevent-2.0-5 zlib1g libpq5 libdb5.3 ca-certificates -yy \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*
RUN useradd -c "SMTP Daemon" -d /var/lib/opensmtpd/empty -s /sbin/nologin _smtpd \
        && useradd -c "SMTPD Queue" -d /var/lib/opensmtpd/empty -s /sbin/nologin _smtpq \
        && mkdir -p /var/lib/opensmtpd/empty /var/empty /usr/lib/smtpd /var/spool/smtpd /var/spool/smtpd/purge \
		/var/spool/smtpd/offline /var/spool/smtpd/temporary /var/spool/smtpd/queue /var/spool/smtpd/incoming \
	&& chmod 711 /var/spool/smtpd \
	&& chmod 700 /var/spool/smtpd/purge /var/spool/smtpd/temporary /var/spool/smtpd/queue /var/spool/smtpd/incoming \
	&& chown _smtpq:root /var/spool/smtpd/purge /var/spool/smtpd/temporary /var/spool/smtpd/queue \
		/var/spool/smtpd/incoming \
	&& chown root:_smtpq /var/spool/smtpd/offline \
	&& chmod 770 /var/spool/smtpd/offline

EXPOSE 25 465 587

VOLUME ["/etc/smtpd"]

COPY --from=0 /docker-usr/sbin /usr/sbin
COPY --from=0 /docker-usr/share /usr/share
COPY --from=0 /usr/lib/opensmtpd /usr/lib/opensmtpd
COPY --from=0 /usr/lib/libcrypto.so* /usr/lib/libssl.so* /usr/lib/libtls.so* /usr/lib/

CMD ["/usr/sbin/smtpd", "-d", "-f", "/etc/smtpd/smtpd.conf"]

