FROM arm64v8/debian:stretch

COPY ./run.sh /run.sh
RUN apt-get update && \
	apt-get install -qyy --no-install-recommends wget libfontconfig ca-certificates && \
	wget https://github.com/fg2it/grafana-on-raspberry/releases/download/v5.1.3/grafana_5.1.3_arm64.deb && \
	dpkg -i grafana_5.1.3_arm64.deb && \
	chmod +x /run.sh && \
	apt-get purge -qyy wget && \
	apt-get autoremove -qyy && \
	rm -f *.deb && \
	rm -rf /var/lib/apt/lists/*


EXPOSE 3000
USER grafana
WORKDIR /
ENTRYPOINT [ "/run.sh" ]
