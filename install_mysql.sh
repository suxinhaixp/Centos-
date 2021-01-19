#!/bin/bash
yum -y install mysql
yum -y  install mysql-server
yum -y install mysql-devel
wget http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum -y install mysql-community-server
systemctl restart mysqld

cmd="set password for 'root'@'localhost' =password('root');"
mysql -u root -e "${cmd}"
cat >>/etc/my.cnf <<EOF
[mysql]
default-character-set =utf8
EOF
password="root"
cmd1="grant all privileges on *.* to root@'%'identified by 'root';"
mysql -u root -p${password}   -e "${cmd}"
~                                           
