#!/bin/bash

echo "useradd"
useradd --create-home --shell /bin/bash -G wheel,root newuser
echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

echo 'password' | passwd newuser --stdin