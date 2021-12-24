#!/bin/bash

# Docker install
yum -y install yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker-ce

sudo -u $CENTOS_USER_NAME /bin/bash <<\NEWUSER_BLOCK
sudo usermod -aG docker $(whoami)
exit
NEWUSER_BLOCK

systemctl enable docker.service
systemctl start docker.service

# Docker Compose install
curl -L "https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose