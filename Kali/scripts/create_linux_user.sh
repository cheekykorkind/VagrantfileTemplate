#!/bin/bash

useradd --create-home --shell /bin/zsh -G sudo,root $KALI_USER_NAME
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

echo -e "$KALI_USER_PASSWORD\n$KALI_USER_PASSWORD" |passwd "$KALI_USER_NAME"