#! /bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl start nginx
sudo curl -u admin:admin http://10.0.0.4:8080/job/mdt_multibranch/job/master/lastSuccessfulBuild/artifact/www.tar.gz --output /var/www/html/www.tar.gz
sudo tar -zxvf /var/www/html/www.tar.gz -C /var/www/html/
sudo mv /var/www/html/www/* /var/www/html