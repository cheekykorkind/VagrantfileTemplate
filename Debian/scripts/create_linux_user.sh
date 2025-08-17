#!/bin/bash

useradd --create-home --shell /bin/bash -G sudo,root $DEBIAN_USER_NAME
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

echo -e "$DEBIAN_USER_PASSWORD\n$DEBIAN_USER_PASSWORD" |passwd "$DEBIAN_USER_NAME"

echo "✅ create_linux_user.sh is done"