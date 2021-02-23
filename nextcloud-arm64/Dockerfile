FROM alpine:3.13.2

RUN apk add --no-cache curl ca-certificates && \
	cd /tmp && \
	curl -L -O  https://github.com/nextcloud/contacts/releases/download/v3.4.3/contacts.tar.gz && \
	curl -L -O https://github.com/nextcloud/calendar/releases/download/v2.1.3/calendar.tar.gz && \
	curl -L -O https://github.com/nextcloud/tasks/releases/download/v0.13.6/tasks.tar.gz && \
	tar xvzf /tmp/contacts.tar.gz && \
	tar xvzf /tmp/calendar.tar.gz && \
	tar xvzf /tmp/tasks.tar.gz && \
	echo "Listen 8080" > /tmp/ports.conf

FROM arm64v8/nextcloud:21.0.0-apache

COPY --from=0 /tmp/contacts /usr/src/nextcloud/apps/contacts
COPY --from=0 /tmp/calendar /usr/src/nextcloud/apps/calendar
COPY --from=0 /tmp/tasks /usr/src/nextcloud/apps/tasks
COPY --from=0 /tmp/ports.conf /etc/apache2/ports.conf

EXPOSE 8080

