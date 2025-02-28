#!/bin/bash

#Установка nginx, копирование конфигов
echo "Установка nginx"
apt install -y nginx
systemctl enable nginx.service
cp -r /root/projectOtus/configs/serv_p1/nginx/* /etc/nginx/
systemctl restart nginx.service
echo "nginx установлен"

#Установка prometheus-node-exporter
echo "Установка prometheus-node-exporter"
apt install -y prometheus-node-exporter
systemctl enable --now prometheus-node-exporter
echo "prometheus-node-exporter установлен"

#Установка filebeat_8.9.1
echo "Установка filebeat_8.9.1_amd64"
dpkg -i /opt/filebeat_8.9.1_amd64-224190-bc3f59.deb
systemctl enable filebeat.service
cp ~/projectOtus/configs/serv_p1/filebeat/filebeat.yml /etc/filebeat/
systemctl restart filebeat
# не понятно надо включать или нет
#filebeat modules enable nginx
echo "filebeat_8.9.1_amd64 установлен"

#Установка и настройка MySQL
"Установка mysql-server-8.0"
apt install -y mysql-server-8.0
mysql_secure_installation
cp ~/projectOtus/configs/serv_p1/MySQL/mysqld.cnf /etc/mysql/mysql.conf.d/

echo "mysql-server-8.0 установлен"
