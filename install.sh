#!/bin/bash

sudo service tomcat7 stop

sudo rm /var/lib/tomcat7/webapps/shderp.war

sudo mkdir /var/lib/tomcat7/backup

sudo cp -r /var/lib/tomcat7/webapps/shderp/upload /var/lib/tomcat7/backup

sudo rm -r /var/lib/tomcat7/webapps/shderp

sudo cp ./shderp.war /var/lib/tomcat7/webapps/

cd /var/lib/tomcat7/webapps

sudo mkdir shderp

cd shderp

sudo jar -xvf ../shderp.war

sudo cp -r ../../backup/upload .
sudo chmod 777 -R upload/
sudo chown tomcat7:staff upload/

sudo rm -r ../../backup

sudo service tomcat7 start

