#! /bin/bash

[ ! -f /var/www/html/data/.ocdata ] && touch /var/www/html/data/.ocdata
[ -f /var/www/config/config.php ] && cp /var/www/config/config.php /var/www/html/config/config.php

/entrypoint.sh apache2-foreground
