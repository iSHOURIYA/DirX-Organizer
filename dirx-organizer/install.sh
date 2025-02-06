#!/bin/bash

# Define installation paths
INSTALL_DIR="/usr/local/bin"
SERVICE_FILE="/etc/systemd/system/dirx.service"

echo "Installing DirX Organizer..."

# Ensure necessary packages are installed
echo "Checking for required dependencies..."
if ! command -v inotifywait &> /dev/null; then
    echo "Installing inotify-tools..."
    sudo apt update && sudo apt install -y inotify-tools
else
    echo "inotify-tools is already installed."
fi

# Copy scripts to /usr/local/bin
echo "Copying scripts to $INSTALL_DIR..."
sudo cp dirx.sh watcher.sh "$INSTALL_DIR"
sudo chmod +x "$INSTALL_DIR/dirx.sh" "$INSTALL_DIR/watcher.sh"

# Copy systemd service file
echo "Setting up systemd service..."
sudo cp dirx.service "$SERVICE_FILE"
sudo chmod 644 "$SERVICE_FILE"

# Reload systemd, enable and start the service
sudo systemctl daemon-reload
sudo systemctl enable dirx.service
sudo systemctl start dirx.service

echo "Installation complete! DirX Organizer is now running in the background."
echo "You can check its status with: sudo systemctl status dirx.service"
