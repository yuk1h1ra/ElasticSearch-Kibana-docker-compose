#!/bin/bash

# Read Password
printf "password: "
read password

# Package Update
echo "$password" | sudo -S apt-get update
echo "$password" | sudo -S apt-get upgrade

# Requirements

## Installing Python libraries
echo "$password" | sudo -S apt-get install python python-pip python-dev libffi-dev libssl-dev
echo "$password" | sudo -S apt-get install python-virtualenv python-setuptools
echo "$password" | sudo -S apt-get install libjpeg-dev zlib1g-dev swig

## Use Django-based Web Interface
echo "$password" | sudo -S apt-get install mongodb

## PostgreSQL
echo "$password" | sudo -S apt-get install postgresql libpq-dev

## Virtualbox
echo "$password" | sudo -S apt-get install virtualbox virtualbox-ext-pack

## Install tcpdump
echo "$password" | sudo -S apt-get install tcpdump apparmor-utils
echo "$password" | sudo -S aa-disable /usr/sbin/tcpdump

echo "$password" | sudo -S groupadd pcap
echo "$password" | sudo -S usermod -a -G pcap cuckoo
echo "$password" | sudo -S chgrp pcap /usr/sbin/tcpdump
echo "$password" | sudo -S setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump

echo "$password" | sudo -S apt-get install libcap2-bin
echo "$password" | sudo -S pip install m2crypto==0.24.0

## Install guacd
echo "$password" | sudo -S libguac-client-rdp0 libguac-client-vnc0 libguac-client-ssh0 guacd

# Installing Cuckoo

## add groups
echo "$password" | sudo -S usermod -a -G vboxusers $USER

## Install Cuckoo
echo "$password" | sudo -S pip install -U pip setuptools
echo "$password" | sudo -S pip install -U cuckoo

