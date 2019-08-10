FROM arm64v8/alpine:latest

WORKDIR /tmp
RUN apk add --no-cache wget unzip
RUN mkdir src && \
	wget https://github.com/RainLoop/rainloop-webmail/releases/download/v1.13.0/rainloop-1.13.0.zip && \
	unzip -d src rainloop-1.13.0.zip && find .

FROM arm64v8/php:7.3-apache
COPY --from=0 /tmp/src/ /var/www/html/
COPY zzz-security.conf /etc/apache2/conf-enabled/
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql && \
	apt-get clean && rm -rf /var/cache/apt/archives/* && \
	rm -rf /var/lib/apt/lists/*

RUN chown -R www-data:www-data /var/www/html/data
