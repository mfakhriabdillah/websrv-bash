#!/bin/bash
# Maintainer : Muhammad Fakhri Abdillah
# github.com/mfakhriabdillah


if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   echo "The syntax must be 'sudo ./run.sh' "
   exit 1
fi

echo "Updating the system"
#sudo apt update -y

echo "Installing Web Server, Database service & Dependencies"
sudo apt install nginx php mysql-server -y

echo "Download web repository"
git clone https://github.com/sdcilsy/landing-page.git

echo "Configuring web server"
sudo cp -R ./landing-page/ /var/www/html/
sudo cp ./landing-page.local /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/landing-page.local /etc/nginx/sites-enabled

echo "Testing NGINX Configuration"
sudo nginx -t

echo "Restarting Web Server"
sudo systemctl restart nginx.service

