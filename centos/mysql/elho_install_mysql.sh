#! /bin/bash

echo 'elho_install_mysql'

echo '================================================================================================================================='
echo '正在安装:'
echo 'mysql:'
rpm -ivh http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
yum install -y mysql-community-server
yum install -y mysql-devel
yum install -y mysql
cp -n /etc/my.cnf /etc/my.bak.cnf
cp ./my.cnf /etc/my.cnf <<EOF
y
EOF
service mysqld start
/usr/bin/mysqladmin -u root password 'PlB;5{71Y573'
chkconfig mysqld on
echo '**********installed mysql version : ***********'
mysql -V

firewall-cmd --zone=public --add-port=10061/tcp --permanent
firewall-cmd --reload
