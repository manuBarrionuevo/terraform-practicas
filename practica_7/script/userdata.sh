#!/bin/bash

echo "esto es un mensaje" > ~/mensaje.txt
yum update -y
yum install httpd -y
yum install htop -y
systemctl enable httpd
systemctl start httpd
