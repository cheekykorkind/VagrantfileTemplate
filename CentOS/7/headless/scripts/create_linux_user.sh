#!/bin/bash

echo "useradd"
useradd --create-home --shell /bin/bash -G wheel,root $CENTOS_USER_NAME
echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

echo $CENTOS_USER_PASSWORD | passwd $CENTOS_USER_NAME --stdin