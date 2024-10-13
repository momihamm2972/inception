#!/bin/bash

mkdir -p /var/www/html

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod 744 wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

sleep 10

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# mv /wp-config.php /var/www/html/wp-config.php

wp config set DB_NAME 'Lme3win' --allow-root

wp config set DB_USER 'mo7al2ostora' --allow-root

wp config set DB_PASSWORD '91' --allow-root

# wp config set DB_HOST 'mariadb:3306' --allow-root --path='/var/www/wordpress' ; check the path is exist;

# wp core install --url=porn.ma --title=oPPo --admin_user=momihamm --admin_password=91 --admin_email=$momihamm@1337.ma --skip-email --allow-root ; Error: Error establishing a database connection. This either means that the username and password information in your `wp-config.php` file is incorrect or that contact with the database server at `localhost` could not be established. This could mean your host’s database server is down.