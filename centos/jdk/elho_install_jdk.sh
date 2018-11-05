#! /bin/bash

echo 'elho_install_jdk'

# yum update
yum -y update

#同步系统时间
yum install -y ntpdate
ntpdate time.nist.gov

# install jdk
echo '================================================================================================================================='
echo '正在安装:'
echo 'jdk8:'
yum -y install java-1.8.0-openjdk-devel.x86_64
mkdir -p /usr/local/jdk/bin
ln -s /usr/lib/jvm/java/bin/java /usr/local/jdk/bin/java
echo '**********installed jdk version : ***********'
java -version

