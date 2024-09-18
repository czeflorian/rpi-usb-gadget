#!/bin/bash

# Exit on error
set -e

# check if the script is running as root, as it needs elevated permissions
if [ "$EUID" -ne 0 ]; then
  echo "Error: This script must be run as root. Please run it with sudo."
  exit 1
fi

echo "Starting full USB gadget setup..."

# 1. Run USB gadget setup
echo "Running USB gadget setup script..."
sudo ./usb_gadget_setup.sh

# 2. Run DHCP and DNS setup
echo "Running DHCP/DNS setup script..."
sudo ./dhcp_dns_setup.sh

# 3. Run hostname setup
echo "Running hostname setup script..."
sudo ./hostname_setup.sh

# 4. Run USB gadget service setup
echo "Setting up the USB gadget systemd service..."
sudo ./usb_gadget_service_setup.sh

echo "Setup completed!"
