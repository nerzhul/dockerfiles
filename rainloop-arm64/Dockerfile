FROM arm64v8/php:7.2.9-apache
COPY src/ /var/www/html/
COPY zzz-security.conf /etc/apache2/conf-enabled/
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql && \
	apt-get clean && rm -rf /var/cache/apt/archives/* && \
	rm -rf /var/lib/apt/lists/* && \
	chown -R www-data:www-data /var/www/html/data
