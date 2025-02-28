#!/bin/bash

#Установка prometheus
echo "Установка prometheus"
apt install -y prometheus
systemctl enable --now prometheus-node-exporter
cp ./configs/serv_p4/prometheus/prometheus.yml /etc/prometheus/
systemctl restart prometheus
echo "prometheus установлен"

#Установка grafana
echo "Установка grafana_11.4.0_amd64"
apt install -y adduser libfontconfig1
apt install -y musl
dpkg -i /opt/grafana_11.4.0_amd64.deb
systemctl daemon-reload
systemctl enable --now grafana-server
echo "grafana_11.4.0_amd64 установлен"

#Установка ELK
#Установка ES
echo "Установка elasticsearch_8.9.1_amd64"
dpkg -i /opt/elasticsearch_8.9.1_amd64-224190-f79e75.deb
#Память+конфиги
cp -r ~/projectOtus/configs/serv_p4/elasticsearch/* /etc/elasticsearch/
systemctl daemon-reload
systemctl enable --now elasticsearch.service
echo "elasticsearch_8.9.1_amd64 установлен"

#Установка kibana
echo "Установка kibana_8.9.1_amd64"
dpkg -i /opt/kibana_8.9.1_amd64-224190-f7ebba.deb
systemctl daemon-reload
systemctl enable --now kibana.service
cp ~/projectOtus/configs/serv_p4/kibana/kibana.yml /etc/kibana/
systemctl restart kibana
echo "kibana_8.9.1_amd64 установлен"

#Установка logstash
echo "Установка logstash_8.9.1_amd64"
dpkg -i /opt/logstash_8.9.1_amd64-224190-11b1b0.deb
sytemctl enable --now logstash.service
cp -r ~/projectOtus/configs/serv_p4/logstash/* /etc/logstash/
systemctl restart logstash.service
echo "logstash_8.9.1_amd64 установлен"
