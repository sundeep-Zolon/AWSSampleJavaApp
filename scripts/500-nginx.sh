#!/bin/bash
web_root="/web"

echo "Installing nginx"
yum install -y nginx
echo "Adding lucee nginx configuration files"
cp etc/nginx/conf.d/lucee-global.conf /etc/nginx/conf.d/lucee-global.conf
cp etc/nginx/lucee.conf /etc/nginx/lucee.conf
cp etc/nginx/lucee-proxy.conf /etc/nginx/lucee-proxy.conf

echo "Configuring modcfml shared secret in nginx"
shared_secret=`cat /opt/lucee/modcfml-shared-key.txt`
sed -i "s/SHARED-KEY-HERE/$shared_secret/g" /etc/nginx/lucee-proxy.conf

echo "updating nginx configuration"
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup
cp etc/nginx/nginx.conf /etc/nginx/nginx.conf 

service nginx restart
