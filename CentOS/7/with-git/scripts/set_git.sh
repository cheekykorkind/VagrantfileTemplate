#!/bin/bash

yum -y install git 

git_user_name=$1
git_user_email=$2
vm_name=$3
centos_user_name=$4

sudo -u ${centos_user_name} /bin/bash <<\NEWUSER_BLOCK
sudo git config --global user.name ${git_user_name}
sudo git config --global user.email ${git_user_email}
sudo git config --global color.ui auto
sudo git config --global color.ui true

exit
NEWUSER_BLOCK

mkdir /home/${centos_user_name}/.ssh
ssh-keygen -t rsa -b 4096 -f "/home/${centos_user_name}/.ssh/${vm_name}-key" -q -N ""

cat <<EOF >/home/${centos_user_name}/.ssh/config
Host *
	IdentitiesOnly yes
	ServerAliveInterval 10
	ServerAliveCountMax 12
	StrictHostKeyChecking no
	UseRoaming no

Host github.com
	HostName github.com
	User git
	IdentityFile ~/.ssh/${vm_name}-key
EOF

chmod 700 -R /home/${centos_user_name}/.ssh/
chown ${centos_user_name}:${centos_user_name} -R /home/${centos_user_name}/.ssh/

echo "setting .gitconfig is done"