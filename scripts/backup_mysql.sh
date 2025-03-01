#!/bin/bash

#set -Eeuo pipefail

#for varDB in `mysql -N -e "show databases like '%\_db';"`
#for varDB in `mysql -N -e "show databases;"`
#do
#	echo $varDB
# mysqldump не может сделать дамп DB information_schema: mysqldump: Dumping 'information_schema' DB content is not supported
#	if [ "$varDB" !=  "information_schema" ]
#	then
		varDB="employees"
  		mkdir $varDB
		for varT in `mysql -N -e "show tables from $varDB;"`
		do
#			echo $varT
			mysqldump --opt --single-transaction --events --routines $varDB $varT > $varDB/$varT.sql
		done
	#fi
#done
