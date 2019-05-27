FROM arm64v8/debian:stretch

RUN apt-get update -qyy && \
	apt-get install spampd -y && \
	sed -i "/log_file => 'Sys::Syslog',/d" /usr/sbin/spampd

COPY run.sh .

ENTRYPOINT ["/run.sh"]
