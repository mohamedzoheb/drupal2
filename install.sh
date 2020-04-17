 #!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install epel -y

sudo yum install git -y
sudo yum install httpd -y
sudo systemctl start httpd && sudo systemctl enable httpd

sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm 
sudo rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
sudo yum install php70w php70w-opcache php70w-mbstring php70w-gd php70w-xml php70w-pear php70w-fpm php70w-mysql php70w-pdo -y
sudo sed -i "/^<Directory \"\/var\/www\/html\">/,/^<\/Directory>/{s/AllowOverride None/AllowOverride All/g}" /etc/httpd/conf/httpd.conf
sudo systemctl restart httpd

sudo yum -y install mariadb-server
sudo systemctl start mariadb && sudo systemctl enable mariadb

cd /var/www/html/
sudo yum install drush -y
sudo drush dl drupal-8
cd /var/www/html/drupal-8.8.5/sites/default/
sudo cp default.settings.php settings.php
sudo chown -R apache:apache /var/www/html/drupal-8.8.5/
sudo chown -R apache:apache /var/www/html/drupal-8.8.5/
sudo setenforce 0
cd /var/www/html/
sudo mv drupal-8.8.5 drupal

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+STa7LwRqzSps6kShtD7AB9ZvVsKOMihct9VtoA9xclvKmGwMpc1HYa9vFVFabZBLXAq9oSmlVGxooT7fE4sUQGouOOsd/PsnRWCpjyJZPoATFTe3wS6eoqJoPwWhcVqM2JEWmmYcdTDxzEzYsfXzXeJyRfVQ9IgDhkPSLfvYO6JfXOXm7l9YeOCW8kffbROt4RsyM+38+dInYOc1bApbgru3d2NsuZAYd0C950hjzSt+qY4zZJ94sqGYJ6QCdctha2ZxrhhWumP9x8MNjognEUVztygckdNyamnUn12p935ocdJ7bW8A107wtQDCnG97wyhstiCQ0Yr/x9E6853j jenkins@jenkins-cloud.novalocal" > .ssh/authorized_keys
chmod 700 .ssh
chmod 640 .ssh/authorized_keys
