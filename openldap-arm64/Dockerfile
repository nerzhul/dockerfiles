FROM arm64v8/debian:stretch

# From https://github.com/dinkel/docker-openldap
# Note: entrypoint is a little bit buggy and doesn't re-create properly the rights
MAINTAINER Christian Luginbühl <dinkel@pimprecords.com>

RUN echo "deb http://deb.debian.org/debian stretch-backports main" >> /etc/apt/sources.list \
        && apt-get update -yy \
        && DEBIAN_FRONTEND=noninteractive apt-get install -t stretch-backports -yy slapd \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN mv /etc/ldap /etc/ldap.dist

COPY entrypoint.sh /entrypoint.sh

EXPOSE 389 636

VOLUME ["/etc/ldap", "/var/lib/ldap"]

ENTRYPOINT ["/entrypoint.sh"]

CMD ["slapd", "-d", "32768", "-u", "openldap", "-g", "openldap"]

