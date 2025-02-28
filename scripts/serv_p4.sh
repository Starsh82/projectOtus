#!/bin/bash

#Установка prometheus
apt install -y prometheus
systemctl enable --now prometheus-node-exporter

#Установка grafana
apt install -y adduser libfontconfig1
dpkg -i /opt/grafana_11.4.0_amd64.deb

#Установка prometheus-node-exporter
#echo "!!!!!Установка prometheus-node-exporter!!!!!"
#apt install -y prometheus-node-exporter
#systemctl enable --now prometheus-node-exporter

#Установка grafana
