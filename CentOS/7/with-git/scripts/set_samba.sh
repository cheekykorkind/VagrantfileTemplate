#!/bin/bash

yum -y install samba
(echo "password"; echo "password") | smbpasswd -s -a newuser

# cp config/smb.conf /etc/samba/smb.conf
cat <<EOF >/etc/samba/smb.conf
[global]
        smb ports = 445
        dos filetimes = yes
[homes]
        comment = Home Directories
        browseable = no
        writable = yes
EOF

sudo -u newuser /bin/bash <<\NEWUSER_BLOCK
sudo yum -y provides /usr/sbin/semanage

sudo yum -y install policycoreutils-python

sudo semanage fcontext -a -t samba_share_t "/home/newuser(/.)?"
sudo setsebool -P smbd_anon_write=1
sudo semanage fcontext -a -t public_content_rw_t "/home/newuser(/.)?"
sudo restorecon -Rv /home/newuser*
sudo setsebool -P samba_export_all_rw=1

exit
NEWUSER_BLOCK

systemctl start smb
systemctl enable smb
systemctl restart smb