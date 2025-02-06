#!/bin/bash

INSTALL_DIR="/usr/local/bin"
SERVICE_FILE="/etc/systemd/system/dirx.service"

echo "Uninstalling DirX Organizer..."

# Stop and disable the service
sudo systemctl stop dirx.service
sudo systemctl disable dirx.service

# Remove scripts
sudo rm -f "$INSTALL_DIR/dirx"
sudo rm -f "$INSTALL_DIR/watcher"

# Remove systemd service file
sudo rm -f "$SERVICE_FILE"

# Reload systemd daemon
sudo systemctl daemon-reload

echo "DirX Organizer has been successfully uninstalled."
