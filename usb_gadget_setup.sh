#!/bin/bash

# Define gadget directory
GADGET_DIR="/sys/kernel/config/usb_gadget/pi_gadget"

# Create the gadget directory
mkdir -p $GADGET_DIR
cd $GADGET_DIR

# Define USB gadget attributes
echo 0x1d6b > idVendor    # Linux Foundation
echo 0x0104 > idProduct   # Multifunction Composite Gadget
echo 0x0100 > bcdDevice   # v1.0.0
echo 0x0200 > bcdUSB      # USB2

# Create English strings for manufacturer, product, and serial number
mkdir -p strings/0x409
echo "fedcba9876543210" > strings/0x409/serialnumber
echo "Raspberry Pi" > strings/0x409/manufacturer
echo "Pi Gadget" > strings/0x409/product

# Create configuration
mkdir -p configs/c.1/strings/0x409
echo "Config 1: RNDIS network" > configs/c.1/strings/0x409/configuration
echo 250 > configs/c.1/MaxPower

# Create function for RNDIS (network over USB)
mkdir -p functions/rndis.usb0
echo "RNDIS" > functions/rndis.usb0/os_desc/interface.rndis/compatible_id
echo "5162001" > functions/rndis.usb0/os_desc/interface.rndis/sub_compatible_id

# Link function to configuration
ln -s functions/rndis.usb0 configs/c.1

# Enable the gadget
ls /sys/class/udc > UDC

# Set static IP address for usb0 interface (Raspberry Pi's IP)
sudo ifconfig usb0 192.168.7.2 netmask 255.255.255.0 up