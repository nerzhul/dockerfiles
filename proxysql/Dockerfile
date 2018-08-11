FROM debian:stretch
MAINTAINER Loic BLOT <loic.blot@unix-experience.fr>

RUN apt-get update && \
	apt-get install -y wget && \
	wget https://github.com/sysown/proxysql/releases/download/v1.4.10/proxysql_1.4.10-debian9_amd64.deb -O /opt/proxysql_1.4.10-debian9_amd64.deb && \
	dpkg -i /opt/proxysql_1.4.10-debian9_amd64.deb && \
	rm -f /opt/proxysql_1.4.10-debian9_amd64.deb && \
	rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["proxysql", "-f"]

EXPOSE 6032 6033
