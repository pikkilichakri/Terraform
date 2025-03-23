#!/bin/bash
dnf update -y
dnf install nginx -y
systemctl start nginx
systemctl status nginx

echo "<h1> hii , welcome to this is nginx image </h1> > /var/www/html/index.html"