#!/bin/bash
set -e

apt-get update -y
apt-get install -y git nodejs npm

rm -rf /var/www/app
git clone https://github.com/Elwakeel-ah/EC2-b.git /var/www/app

cd /var/www/app

npm install

npm install -g pm2

pm2 delete app-b || true
pm2 start main.js --name app-b
pm2 startup systemd -u root --hp /root
pm2 save