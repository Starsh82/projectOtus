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
Сервер № 4: Prometheus + Grafana,  Elasticsearch + Logstash + Kibana, prometheus-node-exporter

Настройка серверов производится под пользователем root.  
Порядок действий по восстановлению
**Меняем hostname для серверов:**  
   Сервер № 1:
   
		hostnamectl hostname p1-nginx-mysql-master
   Сервер № 2:
   
		hostnamectl hostname p2-apache21-mysql-slave
   Сервер № 3:
   
		hostnamectl hostname p3-apache22
   Сервер № 4:
   
		hostnamectl hostname p4-mon-logs
  
**Скачиваем и выполняем скрипт на каждом сервере**

   		apt update
   		apt uprade -y
		wget https://raw.githubusercontent.com/Starsh82/projectOtus/refs/heads/main/bash-git-promt.sh
		bash /root/bash-git-promt.sh
**Настройка сервера № 1:**

		bash /root/scripts/serv_p1.sh
**Настройка сервера № 1:**

		bash /root/scripts/serv_p1.sh
**Настройка сервера № 2:**

		bash /root/scripts/serv_p2.sh
**Настройка сервера № 3:**
   
		bash /root/scripts/serv_p3.sh
**Настройка сервера № 4:**
   
		bash /root/scripts/serv_p4.sh
    
    
    
    

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


Потабличный dump:

	#!/bin/bash
	
	mysql -e "stop slave;"
	mysql -e "show slave status\G" > $varDB/slave_info
	varDB="employees"
	mkdir $varDB
	mysqldump --no-data $varDB > $varDB/schema.sql
	for varT in `mysql -N -e "show tables from $varDB;"`
	do mysqldump --opt --single-transaction --events --routines $varDB $varT > $varDB/$varT.sql
	done
	mysql -e "start slave;"
