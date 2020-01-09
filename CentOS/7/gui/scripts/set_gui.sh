#!/bin/bash

echo "set GUI"

# yum groupinstall -y 'gnome desktop'
# yum install -y 'xorg*'
# yum remove -y initial-setup initial-setup-gui
# systemctl isolate graphical.target
# systemctl set-default graphical.target

yum -y groupinstall "GNOME Desktop"
yum -y epel-release
systemctl set-default graphical.target
systemctl get-default
shutdown -r now