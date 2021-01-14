#!/bin/bash

apt install -y samba

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

# you can use samba after reboot. And sometime you need to edit /etc/reslove.conf 8.8.8.8