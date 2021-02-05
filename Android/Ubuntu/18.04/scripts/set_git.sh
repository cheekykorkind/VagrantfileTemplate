#!/bin/bash

# setting .gitconfig
apt install -y git

git config --global user.name $GIT_NAME
git config --global user.email $GIT_EMAIL
git config --global color.ui auto
git config --global color.ui true

echo "setting .gitconfig is done"