#!/bin/bash

#Установка prometheus
apt install -y prometheus
systemctl enable --now prometheus-node-exporter
cp ./configs/serv_p4/prometheus/prometheus.yml /etc/prometheus/
systemctl restart prometheus

#Установка grafana
apt install -y adduser libfontconfig1
dpkg -i /opt/grafana_11.4.0_amd64.deb
systemctl daemon-reload
systemctl start grafana-server

#Установка ELK
#Установка ES
dpkg -i /opt/elasticsearch_8.9.1_amd64-224190-f79e75.deb
#Память+конфиги
cp -r ~/projectOtus/configs/serv_p4/elasticsearch/* /etc/elasticsearch/
systemctl daemon-reload
systemctl enable --now elasticsearch.service

#Установка kibana
dpkg -i /opt/kibana_8.9.1_amd64-224190-f7ebba.deb
systemctl daemon-reload
systemctl enable --now kibana.service
cp ~/projectOtus/configs/serv_p4/kibana/kibana.yml /etc/kibana/
systemctl restart kibana

#Установка logstash
dpkg -i /opt/logstash_8.9.1_amd64-224190-11b1b0.deb
sytemctl enable --now logstash.service
cp -r ~/projectOtus/configs/serv_p4/logstash/* /etc/logstash/
systemctl restart logstash.service
