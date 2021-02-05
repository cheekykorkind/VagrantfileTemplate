#!/bin/bash

apt install -y samba

(echo $USER_PASSWORD; echo $USER_PASSWORD) | smbpasswd -s -a $USER_NAME

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