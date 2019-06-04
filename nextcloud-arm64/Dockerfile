FROM arm64v8/nextcloud:15.0.0-apache

RUN apt-get update -qy && \
	apt-get install --no-install-recommends -qy git ca-certificates && \
	cd /usr/src/nextcloud/apps && \
	git clone https://github.com/nextcloud/calendar -b v1.6.4 && \
	git clone https://github.com/nextcloud/contacts -b v2.1.8 && \
	git clone https://github.com/nextcloud/ocsms && cd ocsms && git checkout 2.1.0 && cd .. && \
	cd /usr/src/nextcloud && \
	sed -i "s/=> \$headers/=> \$headers, 'proxy' => getenv('tcp_proxy')/" lib/private/Files/ObjectStore/S3ObjectTrait.php && \
	apt-get purge -qy git && \
	apt-get clean && \
        rm -rf /var/lib/apt/lists/*


