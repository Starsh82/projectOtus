#!/bin/bash

#Установка nginx
apt install -y nginx
systemctl enable --now nginx.service
