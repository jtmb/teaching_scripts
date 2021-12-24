#!/bin/bash

# updates and installs OS updates (linux debian)

apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get autoremove -y
apt-get autoclean -y
