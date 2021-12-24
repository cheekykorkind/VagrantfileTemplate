#!/bin/bash

# Docker install
apt update
apt -y install curl gnupg2 apt-transport-https software-properties-common ca-certificates  
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" | sudo tee  /etc/apt/sources.list.d/docker.list
apt update
apt -y install docker-ce docker-ce-cli containerd.io

sudo -u $USER_NAME /bin/bash <<\NEWUSER_BLOCK
sudo usermod -aG docker $(whoami)
exit
NEWUSER_BLOCK
newgrp docker

systemctl enable docker.service
systemctl start docker.service


# Docker Compose install
curl -L "https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
