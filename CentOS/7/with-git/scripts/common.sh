#!/bin/bash

echo "set /etc/resolv.conf 8.8.8.8"

cat  /dev/null > /etc/resolv.conf
cat <<EOF >/etc/resolv.conf
# 8888
nameserver 8.8.8.8
EOF

yum -y update