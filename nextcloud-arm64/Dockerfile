FROM arm64v8/nextcloud:13.0.2-apache

RUN apt-get update -qy && \
	apt-get install --no-install-recommends -qy git ca-certificates && \
	cd /usr/src/nextcloud/apps && \
	git clone https://github.com/nextcloud/calendar -b v1.6.1 && \
	git clone https://github.com/nextcloud/contacts -b v2.1.3 && \
	apt-get purge -qy git && \
	apt-get clean && \
        rm -rf /var/lib/apt/lists/*


