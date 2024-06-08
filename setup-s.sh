#!/bin/bash

# Variables for memory settings
MEMORY_XMX="12G"
MEMORY_XMS="12G"

# Service related variables
service_name="gtnh"
service_file="/etc/systemd/system/${service_name}.service"
working_directory="$(pwd)/gtnh"  # Dynamically set to the 'gtnh' subfolder of the current directory


# Create systemd service unit file
sudo tee "$service_file" > /dev/null <<EOF
[Unit]
Description=GTNH Minecraft Server
After=network.target

[Service]
Type=simple
WorkingDirectory=$working_directory
ExecStart=/bin/bash -c 'java -Xmx$MEMORY_XMX -Xms$MEMORY_XMS @java9args.txt -jar lwjgl3ify-forgePatches.jar nogui'
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

echo "Service '$service_name' setup successfully with XMX=$MEMORY_XMX and XMS=$MEMORY_XMS."