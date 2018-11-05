#! /bin/bash

echo 'elho_install_nginx'

# install nginx
echo '================================================================================================================================='
echo '正在安装:'
echo 'nginx:'
rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
yum -y install nginx
cp -n /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.bak.conf
cp ./default.conf /etc/nginx/conf.d/ <<EOF
y
EOF
/usr/sbin/nginx -c /etc/nginx/nginx.conf
chkconfig nginx on
mkdir -p /home/www/html/res/elho
chmod 777 /home/www/html/res/elho
echo '**********installed nginx version : ***********'
/usr/sbin/nginx -V

firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=10053/tcp --permanent
firewall-cmd --reload

