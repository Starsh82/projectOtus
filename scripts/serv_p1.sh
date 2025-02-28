#!/bin/bash

#Установка nginx
apt install -y nginx
systemctl enable nginx.service

#Копирование рабочих конфигов и перезпуск nginx
cp -r /root/projectOtus/configs/serv_p1/nginx/* /etc/nginx/
systemctl restart nginx.service

#Установка prometheus-node-exporter
echo "!!!!!Установка prometheus-node-exporter!!!!!"
apt install -y prometheus-node-exporter
systemctl enable --now prometheus-node-exporter
