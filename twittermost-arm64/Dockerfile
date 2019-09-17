FROM arm64v8/golang:1.12.8

RUN CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go get github.com/nerzhul/twittermost

FROM arm64v8/alpine:latest
COPY --from=0 /go/bin/twittermost /usr/bin/twittermost
RUN apk add --no-cache ca-certificates && \
	adduser -D -h /usr/local/twittermost twittermost && \
	chown -R twittermost /usr/local/twittermost

USER twittermost
WORKDIR /usr/local/twittermost
CMD ["/usr/bin/twittermost", "-config", "/etc/twittermost/config.json"]
