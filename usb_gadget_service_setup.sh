# usb_gadget_service_setup.sh

# Create the systemd service for the USB gadget setup
sudo tee /etc/systemd/system/usb_gadget.service > /dev/null <<EOF
[Unit]
Description=USB Gadget Setup
After=network.target

[Service]
ExecStart=/usr/local/bin/usb_gadget_setup.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd, enable, and start the service
sudo systemctl daemon-reload
sudo systemctl enable usb_gadget.service
sudo systemctl start usb_gadget.service
