#!/bin/bash
if [ "$(whoami)" != "root" ]
then
    sudo su -s "$0"
    exit
fi

cd /home/ec2-user/drupal
mysql -u zippyops -pzippyops zippyops_db < zippyops_db.sql
yes | cp -Rf drupal /var/www/html/
sudo systemctl restart httpd

