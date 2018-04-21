FROM arm64v8/golang:1.10.1

RUN cd /go/src/ && mkdir -p gitlab.com/nerzhul && cd gitlab.com/nerzhul && git clone https://gitlab.com/nerzhul/bot.git -b 1.2
RUN cd /go/src/gitlab.com/nerzhul/bot \
        && env CGO_ENABLED=0 GOOS=linux GOARCH=arm64 make matterbot

FROM arm64v8/alpine:latest
RUN addgroup -g 750 -S matterbot && adduser -u 750 -D -S -G matterbot matterbot
USER matterbot
WORKDIR /var/lib/bot-matterbot
COPY --from=0 /artifacts/linux_arm64/matterbot /usr/bin/matterbot

CMD ["/usr/bin/matterbot", "--config=/etc/bot/matterbot.yml"]


