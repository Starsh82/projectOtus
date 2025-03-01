#!/bin/bash

#Установка apache2
echo "Установка apache2"
apt install -y apache2
cp /root/projectOtus/configs/serv_p2/apache2/*.conf /etc/apache2/
cp -r /root/projectOtus/configs/serv_p2/apache2/sites-* /etc/apache2/
cp -r /root/projectOtus/configs/serv_p2/apache2/html1 /var/www/
systemctl enable --now apache2.service
echo "apache2 установлен"

#Установка prometheus-node-exporter
echo "Установка prometheus-node-exporter"
apt install -y prometheus-node-exporter
systemctl enable --now prometheus-node-exporter
echo "prometheus-node-exporter установлен"

#Установка и настройка MySQL
"Установка mysql-server-8.0 (slave)"
apt install -y mysql-server-8.0
systemctl start mysql
#mysql_secure_installation
cp ~/projectOtus/configs/serv_p2/MySQL/mysqld.cnf /etc/mysql/mysql.conf.d/
systemctl restart mysql
mysql -e "STOP REPLICA;"
mysql -e "CHANGE REPLICATION SOURCE TO SOURCE_HOST='192.168.56.151', SOURCE_USER='repl', SOURCE_PASSWORD='Pass1234#1234', SOURCE_AUTO_POSITION = 1, GET_SOURCE_PUBLIC_KEY = 1;"
mysql -e "START REPLICA;"
#mysql CREATE USER 'repl'@'%' IDENTIFIED WITH 'caching_sha2_password' BY '123qwe';
#mysql GRANT REPLICATION SLAVE ON *.* TO repl@'%';
echo "mysql-server-8.0 установлен (slave)"
