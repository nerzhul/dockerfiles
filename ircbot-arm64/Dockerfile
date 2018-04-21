FROM arm64v8/golang:1.10.1

RUN cd /go/src/ && mkdir -p gitlab.com/nerzhul && cd gitlab.com/nerzhul && git clone https://gitlab.com/nerzhul/bot.git -b 1.0
RUN cd /go/src/gitlab.com/nerzhul/bot \
        && env CGO_ENABLED=0 GOOS=linux GOARCH=arm64 make ircbot

FROM arm64v8/alpine:latest
RUN addgroup -g 751 -S ircbot && adduser -u 750 -D -S -G ircbot ircbot
USER ircbot
WORKDIR /var/lib/bot-ircbot
COPY --from=0 /artifacts/linux_arm64/ircbot /usr/bin/ircbot

CMD ["/usr/bin/ircbot", "--config=/etc/bot/ircbot.yml"]

