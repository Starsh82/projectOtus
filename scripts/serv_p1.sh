#!/bin/bash

#Установка nginx, копирование конфигов
apt install -y nginx
systemctl enable nginx.service
cp -r /root/projectOtus/configs/serv_p1/nginx/* /etc/nginx/
systemctl restart nginx.service

#Установка prometheus-node-exporter
echo "!!!!!Установка prometheus-node-exporter!!!!!"
apt install -y prometheus-node-exporter
systemctl enable --now prometheus-node-exporter

#Установка filebeat_8.9.1
dpkg -i /opt/filebeat_8.9.1_amd64-224190-bc3f59.deb
systemctl enable filebeat.service
cp ~/projectOtus/configs/serv_p1/filebeat/filebeat.yml /etc/filebeat/
systemctl restart filebeat
# не понятно надо включать или нет
#filebeat modules enable nginx

#Установка и настройка MySQL
