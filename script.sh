#!/bin/bash
yum install -y epel-release
yum install -y nginx
systemctl start nginx
systemctl enable nginx
find / -perm +4000