FROM arm64v8/debian:stretch

RUN apt-get update -qyy && \
	apt-get install spampd -y && \
	sed -i "/log_file => 'Sys::Syslog',/d" /usr/sbin/spampd && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	chown -R debian-spamd /var/cache/spampd

COPY run.sh .

EXPOSE 10025

ENTRYPOINT ["/run.sh"]
