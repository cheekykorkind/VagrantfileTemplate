#!/bin/bash

echo "set /etc/resolv.conf 8.8.8.8"
cp config/resolv.conf /etc/resolv.conf

yum -y update