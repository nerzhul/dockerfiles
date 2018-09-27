FROM arm64v8/nextcloud:13.0.6-apache

RUN apt-get update -qy && \
	apt-get install --no-install-recommends -qy git ca-certificates && \
	cd /usr/src/nextcloud/apps && \
	git clone https://github.com/nextcloud/calendar -b v1.6.4 && \
	git clone https://github.com/nextcloud/contacts -b v2.1.6 && \
	git clone https://github.com/nextcloud/ocsms -b 5b725032968c5d7e545e2a3d2aae9283fa9e7424 && \
	apt-get purge -qy git && \
	apt-get clean && \
        rm -rf /var/lib/apt/lists/*


