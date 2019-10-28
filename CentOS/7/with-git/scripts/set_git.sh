#!/bin/bash

yum -y install git 

git_user_name=$1
git_user_email=$2

# echo "git_user_name is unset or set to the empty string" > /dev/stderr
# exit 1

cat <<EOF >/home/newuser/.gitconfig
[color]
    ui = auto
[user]
    name = ${git_user_name}
    email = ${git_user_email}
EOF

chown newuser /home/newuser/.gitconfig

echo "setting .gitconfig is done"