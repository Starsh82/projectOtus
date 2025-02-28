#!/bin/bash

#Установка apache2
apt install apache2
cp /root/projectOtus/configs/serv_p3/apache2/*.conf /etc/apache2/
cp -r /root/projectOtus/configs/serv_p3/apache2/sites-* /etc/apache2/
cp -r /root/projectOtus/configs/serv_p3/apache2/html1 /var/www/
systemctl enable --now apache2.service

#Установка prometheus-node-exporter
echo "!!!!!Установка prometheus-node-exporter!!!!!"
apt install -y prometheus-node-exporter
systemctl enable --now prometheus-node-exporter
