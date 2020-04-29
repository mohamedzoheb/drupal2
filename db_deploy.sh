#!/bin/bash
if [ "$(whoami)" != "root" ]
then
    sudo su -s "$0"
    exit
fi 
sudo yum update -y
sudo amazon-linux-extras install epel -y
sudo yum -y install mariadb-server
sudo systemctl start mariadb && sudo systemctl enable mariadb
sudo yum install git -y
cd /home/ec2-user/
git clone -b deploy https://github.com/1996karthick/drupal.git





