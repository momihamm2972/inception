#! /bin/bash

service mariadb start

sleep 5

mysql -e "Create or Replace Database "Lme3win""

mysql -e "CREATE USER IF NOT EXISTS 'momihamm'@'localhost' IDENTIFIED BY '91';"

mysql -e "GRANT ALL PRIVILEGES ON "Lme3win".* TO 'momihamm@1337.ma' IDENTIFIED BY '91';"

mysql -e "ALTER USER 'momihamm'@'localhost' IDENTIFIED BY '91';"

mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p91 shutdown

exec mysqld_safe