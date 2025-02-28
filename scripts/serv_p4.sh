#!/bin/bash

#Установка prometheus
apt install -y prometheus
systemctl enable --now prometheus-node-exporter

#Установка grafana
apt install -y adduser libfontconfig1
dpkg -i /opt/grafana_11.4.0_amd64.deb
systemctl enable --now grafana-server.service

#Установка ELK
#Установка ES
dpkg -i /opt/elasticsearch_8.9.1_amd64-224190-f79e75.deb
#Память+конфиги
systemctl daemon-reload
systemctl enable --now elasticsearch.service

#Установка kibana
dpkg -i /opt/kibana_8.9.1_amd64-224190-f7ebba.deb
systemctl daemon-reload
systemctl enable --now kibana.service
#sudo nano /etc/kibana/kibana.yml
#server.port: 5601
#server.host: "0.0.0.0"
systemctl restart kibana

#Установка logstash
dpkg -i /opt/logstash_8.9.1_amd64-224190-11b1b0.deb
ystemctl enable --now logstash.service
#sudo nano /etc/logstash/logstash.yml
systemctl restart logstash.service


#Установка prometheus-node-exporter
#echo "!!!!!Установка prometheus-node-exporter!!!!!"
#apt install -y prometheus-node-exporter
#systemctl enable --now prometheus-node-exporter

#Установка grafana
