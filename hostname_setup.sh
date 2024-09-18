#!/bin/bash

# Install Avahi for mDNS support
sudo apt update
sudo apt install -y avahi-daemon

# Set a hostname for the Raspberry Pi
# You can change this for whatever you like and use it for the ssh connection (ssh <user>@<hostname>.local)
sudo hostnamectl set-hostname raspberrypi

# Ensure Avahi daemon is running & enable on boot
sudo systemctl restart avahi-daemon
sudo systemctl enable avahi-daemon
