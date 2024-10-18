#!/bin/bash

# Wait for services to initialize
sleep 20

# Create necessary directories
mkdir -p /var/www/html
mkdir -p /run/php

# Move to the HTML directory
cd /var/www/html

# Download WP CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Set permissions and move it to a global location
chmod 744 wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

sed -i 's|^listen =.*|listen = wordpress:9000|' /etc/php/7.4/fpm/pool.d/www.conf

# Download WordPress core files
wp core download --allow-root --path='/var/www/html'

# Create wp-config file by moving the sample file

mv wp-config-sample.php wp-config.php

# sleep infinity
# Set up WordPress configuration with environment variables

wp config set DB_NAME $SQL_DATABASE --allow-root --path='/var/www/html'
wp config set DB_USER $MYSQL_USER --allow-root --path='/var/www/html'
wp config set DB_PASSWORD $MYSQL_PASSWORD --allow-root --path='/var/www/html'
wp config set DB_HOST 'mariadb:3306' --allow-root --path='/var/www/html'


# sleep infinity

# Install WordPress using environment variables
wp core install \
  --url=$DOMAIN_NAME \
  --title=$WP_TITLE \
  --admin_user=$WP_ADMIN_USR \
  --admin_password=$WP_ADMIN_PWD \
  --admin_email=$WP_ADMIN_EMAIL \
  --skip-email \
  --allow-root \
  --path='/var/www/html'

# Start PHP FastCGI Process Manager

/usr/sbin/php-fpm7.3 -F