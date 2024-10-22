#!/bin/bash

sleep 20

mkdir -p /var/www/html
mkdir -p /run/php

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod 744 wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

sed -i 's|^listen =.*|listen = wordpress:9000|' /etc/php/7.4/fpm/pool.d/www.conf

wp core download --allow-root --path='/var/www/html'

mv wp-config-sample.php wp-config.php

wp config set DB_NAME $SQL_DATABASE --allow-root --path='/var/www/html'
wp config set DB_USER $MYSQL_USER --allow-root --path='/var/www/html'
wp config set DB_PASSWORD $MYSQL_PASSWORD --allow-root --path='/var/www/html'
wp config set DB_HOST 'mariadb:3306' --allow-root --path='/var/www/html'

wp core install \
  --url=$DOMAIN_NAME \
  --title=$WP_TITLE \
  --admin_user=$WP_ADMIN_USR \
  --admin_password=$WP_ADMIN_PWD \
  --admin_email=$WP_ADMIN_EMAIL \
  --skip-email \
  --allow-root \
  --path='/var/www/html'

wp user create $WP_USR $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root --path=/var/www/html

/usr/sbin/php-fpm7.4 -F