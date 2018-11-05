#! /bin/bash

echo 'elho_install_mongo'

yum -y update

echo '================================================================================================================================='
echo '正在安装:'
echo 'mongo:'
cp ./mongodb-org-3.2.repo /etc/yum.repos.d/ <<EOF
y
EOF
yum -y install mongodb-org
chkconfig mongo on
echo '**********installed mongo version : ***********'
/usr/bin/mongod -version

firewall-cmd --zone=public --add-port=10063/tcp --permanent
firewall-cmd --reload
