#!/bin/bash

centos_user_name=$1

# Docker install
yum -y install yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker-ce

sudo -u ${centos_user_name} /bin/bash <<\NEWUSER_BLOCK
sudo usermod -aG docker $(whoami)
exit
NEWUSER_BLOCK

systemctl enable docker.service
systemctl start docker.service

# Docker Compose install
yum -y install epel-release
yum -y install python-pip

pip install --upgrade pip
yes | sudo pip install docker-compose
yum -y upgrade python*