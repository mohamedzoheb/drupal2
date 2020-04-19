#!/bin/bash
if [ "$(whoami)" != "root" ]
then
    sudo su -s "$0"
    exit
fi
sudo echo "CREATE DATABASE zippyops_db CHARACTER SET utf8 COLLATE utf8_general_ci;;" | mysql
sudo echo "CREATE USER 'zippyops'@'localhost' IDENTIFIED BY 'zippyops';" | mysql
sudo echo "GRANT ALL PRIVILEGES ON zippyops_db.* TO 'zippyops'@'localhost';" | mysql
sudo echo "FLUSH PRIVILEGES;" | mysql
cd /home/ec2-user/drupal
mysql -u zippyops -pzippyops zippyops_db < zippyops_db.sql
yes | cp -Rf drupal /var/www/html/
sudo systemctl restart httpd

