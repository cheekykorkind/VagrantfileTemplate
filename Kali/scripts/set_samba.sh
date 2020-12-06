#!/bin/bash

apt install -y samba ufw

(echo $KALI_USER_PASSWORD; echo $KALI_USER_PASSWORD) | smbpasswd -s -a $KALI_USER_NAME

cat <<EOF >/etc/samba/smb.conf
[global]
        smb ports = 445
        dos filetimes = yes
[homes]
        comment = Home Directories
        browseable = no
        writable = yes
EOF

# /usr/sbin/service smbd start
systemctl start smbd
systemctl enable smbd
systemctl restart smbd

ufw allow 22
ufw allow 139
ufw allow 445
ufw allow 3000
ufw allow 3001
(echo "y") | ufw enable
ufw reload
ufw status