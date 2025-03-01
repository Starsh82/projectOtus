# projectOtus
## Репозиторий для проектной работы по курсу Linux Administrator Basic.  
Тема проектной работы: Аварийное восстановление тестового web-стенда с балансировкой нагрузки, MySQL сервера с репликацией, сервисов мониторинга и логирования.  
Легенда: имеется рабочая система включающая в себя web-сервер с настроенной балансировкой нагрузки, на фронте находится Nginx, на двух бэкендах Apache2. Также имеется БД MySQL с настроенной репликацией. И сервер выполняющий функции мониторинга и логирования.  
Происходит disaster!!!  
Необходимо подготовить "дорожую карту" по восстановлению всех серверов "с нуля". Автоматизировать установку и настройку сервисов. И восстановить работу системы.  

Система состоит из 4 серверов:  
Сервер № 1: Nginx, MySQL (master), prometheus-node-exporter, filebeat (логи Nginx)  
Сервер № 2: Apache2, MySQL (slave), prometheus-node-exporter  
Сервер № 3: Apache2, prometheus-node-exporter  
Сервер № 4: Prometheus + Grafana,  Elasticsearch + Logstash + Kibana, prometheus-node-exporter, filebeat???  


Порядок действий по восстановлению:  

    wget https://raw.githubusercontent.com/Starsh82/projectOtus/refs/heads/main/bash-git-promt.sh

Сервер 1:

    hostnamectl hostname p1-nginx-mysql-master
    hostnamectl hostname p2-apache21-mysql-slave
    hostnamectl hostname p3-apache22
    hostnamectl hostname p4-mon-logs

Mysql:
Создание схемы бд:

    mysqldump --no-data employees > schema.sql

Бэкап потабличный:

    varDB="employees"
  	mkdir $varDB
	for varT in `mysql -N -e "show tables from $varDB;"`
	    do
			mysqldump --opt --single-transaction --events --routines $varDB $varT > $varDB/$varT.sql
		done
