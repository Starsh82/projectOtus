#!/bin/bash
apt install apache2

systemctl enable --now apache2.service
