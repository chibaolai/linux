#! /bin/bash

# yum update
yum -y update


# install redis
echo '================================================================================================================================='
echo '正在安装:'
echo 'redis:'
yum install -y epel-release
yum install -y redis
cp -n /etc/redis.conf /etc/redis.bak.conf
cp ./redis.conf /etc/ <<EOF
y
EOF
chown redis:root /etc/redis.conf
service redis start
chkconfig redis on
echo '**********installed redis version : ***********'
redis-server -v

firewall-cmd --zone=public --add-port=10062/tcp --permanent
firewall-cmd --reload

