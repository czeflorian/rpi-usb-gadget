#!/bin/bash

# Install dnsmasq to allow for dhcp assignment
sudo apt update
sudo apt install -y dnsmasq

# Configure dnsmasq for USB gadget
sudo tee /etc/dnsmasq.d/usb_gadget.conf > /dev/null <<EOF
interface=usb0
bind-interfaces

dhcp-range=192.168.7.10,192.168.7.50,255.255.255.0,24h
EOF

# Restart dnsmasq & start on boot
sudo systemctl restart dnsmasq
sudo systemctl enable dnsmasq
