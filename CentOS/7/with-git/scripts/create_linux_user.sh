#!/bin/bash

centos_user_name=$1
centos_user_password=$2

echo "useradd"
useradd --create-home --shell /bin/bash -G wheel,root ${centos_user_name}
echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

echo ${centos_user_password} | passwd ${centos_user_name} --stdin