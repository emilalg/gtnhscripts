#!/bin/bash

# Variables
service_name="gtnh"
script_name="serve.sh"
service_file="/etc/systemd/system/${service_name}.service"
script_path="$(pwd)/gtnh/${script_name}"

# Check if script file exists
if [ ! -f "$script_path" ]; then
    echo "Error: Script file '$script_name' not found in current directory."
    exit 1
fi

# Create systemd service unit file
cat <<EOF | sudo tee "$service_file" > /dev/null
[Unit]
Description=Your Service Description
After=network.target

[Service]
Type=simple
ExecStart=$script_path
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd
sudo systemctl daemon-reload

# Start the service
sudo systemctl start "$service_name"

# Enable the service to start on boot
sudo systemctl enable "$service_name"

echo "Service '$service_name' setup successfully."
