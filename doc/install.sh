#!/bin/bash

pwd > pwd.txt
DIR=`cat pwd.txt`

# --データベース作成
sudo -u postgres psql < dump/CREATE_DATABASE.sql
PGPASSWORD=password psql -h 127.0.0.1 -U userid log_customer < dump/log_customer.ddl
PGPASSWORD=password psql -h 127.0.0.1 -U userid log_customer < dump/holiday.txt

# Tomcat連携
cp conf/logcustomer.conf /etc/nginx/default.d/.
# systemctl restart nginx

# LogCustomer
# systemctl stop tomcat
cd /usr/local/tomcat/webapps
rm -rf LogCustomer.war
rm -rf LogCustomer
cp $DIR/LogCustomer.war /usr/local/tomcat/webapps/.
chown tomcat:tomcat /usr/local/tomcat/webapps/LogCustomer.war
# systemctl start tomcat

rm pwd.txt
