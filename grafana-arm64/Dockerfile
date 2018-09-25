FROM arm64v8/debian:stretch

COPY ./run.sh /run.sh
RUN apt-get update && \
	apt-get install -qyy --no-install-recommends wget libfontconfig ca-certificates && \
	wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_5.2.4_arm64.deb && \
	dpkg -i grafana_5.2.4_arm64.deb && \
	chmod +x /run.sh && \
	apt-get purge -qyy wget && \
	apt-get autoremove -qyy && \
	rm -f *.deb && \
	rm -rf /var/lib/apt/lists/*


EXPOSE 3000
USER grafana
WORKDIR /
ENTRYPOINT [ "/run.sh" ]
