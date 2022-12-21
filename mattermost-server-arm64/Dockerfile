FROM golang:1.18

ENV MATTERMOST_VERSION 7.5.2

RUN cd /go/src/ && mkdir -p github.com/mattermost && cd github.com/mattermost && git clone https://github.com/mattermost/mattermost-server.git -b v${MATTERMOST_VERSION}
RUN cd /go/src/github.com/mattermost/mattermost-server/cmd/mattermost \
        && env CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -i -o /go/bin/linux_arm64/mattermost \
                 -ldflags "-X github.com/mattermost/mattermost-server/v6/model.BuildNumber=${MATTERMOST_VERSION} -X 'github.com/mattermost/mattermost-server/v6/model.BuildDate=$(date)' -X github.com/mattermost/mattermost-server/model.BuildHash=3176e13b1f9b14192bef2337ff3fb9346f26ef66 -X github.com/mattermost/mattermost-server/v6/model.BuildHashEnterprise=none -X github.com/mattermost/mattermost-server/v6/model.BuildEnterpriseReady=false" ./
RUN mkdir /mattermost-pkg/ && cd /mattermost-pkg/ && wget -Y on "https://releases.mattermost.com/${MATTERMOST_VERSION}/mattermost-${MATTERMOST_VERSION}-linux-amd64.tar.gz" \
        && tar xvzf mattermost-${MATTERMOST_VERSION}-linux-amd64.tar.gz

FROM arm64v8/alpine:3.17.0
WORKDIR /usr/local/www/mattermost
COPY --from=0 /go/bin/linux_arm64/mattermost /usr/bin/mattermost
COPY --from=0 /mattermost-pkg/mattermost/fonts fonts
COPY --from=0 /mattermost-pkg/mattermost/i18n i18n
COPY --from=0 /mattermost-pkg/mattermost/templates templates
COPY --from=0 --chown=8080:8080 /mattermost-pkg/mattermost/config/config.json /etc/mattermost-server/config.json
COPY --from=0 /mattermost-pkg/mattermost/client/ client
COPY --from=0 /mattermost-pkg/mattermost/prepackaged_plugins client/plugins

RUN mkdir plugins data && chown 8080:8080 plugins data

USER 8080:8080
CMD ["/usr/bin/mattermost", "--config=/etc/mattermost-server/config.json"]

