#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get update -y && apt install -y sudo curl unzip zip git xfce4 gdm3

echo "✅ common.sh is done"