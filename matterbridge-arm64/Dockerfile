FROM alpine:3.12.0

ENV MATTERBRIDGE_VERSION 1.18.3

ADD https://github.com/42wim/matterbridge/releases/download/v${MATTERBRIDGE_VERSION}/matterbridge-${MATTERBRIDGE_VERSION}-linux-arm64 /usr/bin/matterbridge

RUN apk add --no-cache ca-certificates && \
	chmod +x /usr/bin/matterbridge

ENTRYPOINT ["/usr/bin/matterbridge", "-config", "/etc/matterbridge.toml"]
