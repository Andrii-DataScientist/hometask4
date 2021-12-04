#!/bin/bash
yum install -y epel-release
yum install -y nginx
systemctl start nginx
systemctl enable nginx
adduser adminuser
echo "hellodevops" | passwd --stdin adminuser
#echo '%wheel        ALL=(ALL)       ALL /usr/sbin'
usermod -a -G adminuser adminuser
adduser poweruser
echo 'poweruser ALL=(ALL:ALL) /usr/sbin/iptables' >> /etc/sudoers
setfacl -m poweruser:r /home/adminuser
find / -type d -perm 4000 -exec ls -ld {} \;