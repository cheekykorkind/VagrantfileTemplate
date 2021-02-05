#!/bin/bash

useradd --create-home --shell /bin/bash -G sudo,root $USER_NAME
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

echo -e "$USER_PASSWORD\n$USER_PASSWORD" |passwd "$USER_NAME"
