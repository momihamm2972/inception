#! /bin/bash

# Start the MariaDB service
service mariadb start

# Wait for the database service to be up
sleep 10

# Create or replace the database
mysql -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"

# Create the user with a password (or recreate it)
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

# Grant all privileges to the user on the specified database
mysql -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$MYSQL_USER'@'%';"

# Flush privileges to apply changes
mysql -e "FLUSH PRIVILEGES;"

exec mysqld_safe
