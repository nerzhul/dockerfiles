FROM alpine:3.14.1

RUN apk add --no-cache curl ca-certificates && \
	cd /tmp && \
	curl -L -O  https://github.com/nextcloud-releases/contacts/releases/download/v4.0.1/contacts.tar.gz && \
	curl -L -O https://github.com/nextcloud-releases/calendar/releases/download/v2.3.2/calendar.tar.gz && \
	curl -L -O https://github.com/nextcloud/tasks/releases/download/v0.14.1/tasks.tar.gz && \
	curl -L -o phonetrack.tar.gz https://gitlab.com/eneiluj/phonetrack-oc/-/wikis/uploads/931aaaf8dca24bf31a7e169a83c17235/phonetrack-0.6.9.tar.gz && \
	curl -L -o passman.tar.gz https://releases.passman.cc/passman_2.3.10.tar.gz && \
	curl -L -O https://git.project-insanity.org/onny/nextcloud-app-radio/-/jobs/1230/artifacts/raw/build/artifacts/radio.tar.gz # 1.0.3

RUN cd /tmp && \
	tar xvzf /tmp/contacts.tar.gz && \
	tar xvzf /tmp/calendar.tar.gz && \
	tar xvzf /tmp/tasks.tar.gz && \
	tar xvzf /tmp/phonetrack.tar.gz && \
	tar xvzf /tmp/passman.tar.gz && \
	tar xvzf /tmp/radio.tar.gz && \
	echo "Listen 8080" > /tmp/ports.conf

FROM arm64v8/nextcloud:22.1.1-apache

COPY --from=0 /tmp/contacts /usr/src/nextcloud/apps/contacts
COPY --from=0 /tmp/calendar /usr/src/nextcloud/apps/calendar
COPY --from=0 /tmp/tasks /usr/src/nextcloud/apps/tasks
COPY --from=0 /tmp/phonetrack /usr/src/nextcloud/apps/phonetrack
COPY --from=0 /tmp/passman /usr/src/nextcloud/apps/passman
COPY --from=0 /tmp/ports.conf /etc/apache2/ports.conf

EXPOSE 8080

