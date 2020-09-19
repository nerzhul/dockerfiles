FROM golang:1.15.1

RUN cd /go/src/ && mkdir -p github.com/mattermost && cd github.com/mattermost && git clone https://github.com/mattermost/mattermost-server.git -b v5.27.0
RUN cd /go/src/github.com/mattermost/mattermost-server/cmd/mattermost \
        && env CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -i -o /go/bin/linux_arm64/mattermost \
                 -ldflags "-X github.com/mattermost/mattermost-server/model.BuildNumber=5.27.0 -X 'github.com/mattermost/mattermost-server/model.BuildDate=$(date)' -X github.com/mattermost/mattermost-server/model.BuildHash=3176e13b1f9b14192bef2337ff3fb9346f26ef66 -X github.com/mattermost/mattermost-server/model.BuildHashEnterprise=none -X github.com/mattermost/mattermost-server/model.BuildEnterpriseReady=false" ./
RUN mkdir /mattermost-pkg/ && cd /mattermost-pkg/ && wget -Y on "https://releases.mattermost.com/5.27.0/mattermost-5.27.0-linux-amd64.tar.gz" \
        && tar xvzf mattermost-5.27.0-linux-amd64.tar.gz

FROM arm64v8/alpine:3.11.3
WORKDIR /usr/local/www/mattermost
COPY --from=0 /go/bin/linux_arm64/mattermost /usr/bin/mattermost
COPY --from=0 /mattermost-pkg/mattermost/fonts fonts
COPY --from=0 /mattermost-pkg/mattermost/i18n i18n
COPY --from=0 /mattermost-pkg/mattermost/templates templates
COPY --from=0 /mattermost-pkg/mattermost/config/config.json /etc/mattermost-server/config.json
COPY --from=0 /mattermost-pkg/mattermost/client/ client
COPY --from=0 /mattermost-pkg/mattermost/prepackaged_plugins client/plugins

USER mattermost
CMD ["/usr/bin/mattermost", "--disableconfigwatch", "--config=/etc/mattermost-server/config.json"]

