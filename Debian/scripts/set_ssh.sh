#!/bin/bash

# setting .ssh

mkdir /home/$DEBIAN_USER_NAME/.ssh
ssh-keygen -t rsa -b 4096 -f "/home/$DEBIAN_USER_NAME/.ssh/$VM_NAME-key" -q -N ""

cat <<EOF >/home/$DEBIAN_USER_NAME/.ssh/config
Host *
	IdentitiesOnly yes
	ServerAliveInterval 10
	ServerAliveCountMax 12
	StrictHostKeyChecking no
	UseRoaming no
Host github.com
	HostName github.com
	User git
	IdentityFile ~/.ssh/$VM_NAME-key
EOF

chmod 700 -R /home/$DEBIAN_USER_NAME/.ssh/
chown $DEBIAN_USER_NAME:$DEBIAN_USER_NAME -R /home/$DEBIAN_USER_NAME/.ssh/

echo "setting .ssh is done"