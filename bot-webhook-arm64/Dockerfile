FROM arm64v8/golang:1.10.1

RUN cd /go/src/ && mkdir -p gitlab.com/nerzhul && cd gitlab.com/nerzhul && git clone https://gitlab.com/nerzhul/bot.git -b 1.0
RUN cd /go/src/gitlab.com/nerzhul/bot \
        && env CGO_ENABLED=0 GOOS=linux GOARCH=arm64 make webhook

FROM arm64v8/alpine:latest
RUN addgroup -g 750 -S bot-webhook && adduser -u 750 -D -S -G bot-webhook bot-webhook
USER bot-webhook
WORKDIR /var/lib/bot-webhook
COPY --from=0 /artifacts/linux_arm64/webhook /usr/bin/bot-webhook
EXPOSE 8080
CMD ["/usr/bin/bot-webhook", "--config=/etc/bot/webhook.yml"]

