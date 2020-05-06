FROM arm64v8/nextcloud:18.0.4-apache

RUN apt-get update -qy && \
	apt-get install --no-install-recommends -qy git ca-certificates && \
	cd /tmp && \
	curl -L -O  https://github.com/nextcloud/contacts/releases/download/v3.3.0/contacts.tar.gz && \
	curl -L -O https://github.com/nextcloud/calendar/releases/download/v2.0.3/calendar.tar.gz && \
	cd /usr/src/nextcloud/apps && \
	tar xvzf /tmp/contacts.tar.gz && \
	tar xvzf /tmp/calendar.tar.gz && \
	cd /usr/src/nextcloud && \
	sed -i "s/Listen 80/Listen 8080/" /etc/apache2/ports.conf && \
	apt-get purge -qy git && \
	apt-get clean && \
        rm -rf /var/lib/apt/lists/*

EXPOSE 8080

