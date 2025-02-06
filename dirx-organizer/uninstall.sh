#!/bin/bash

echo "Uninstalling DirX Organizer..."

# Define paths
INSTALL_DIR="$HOME/.local/bin"
SERVICE_DIR="$HOME/.config/systemd/user"

# Stop and disable the service
systemctl --user stop dirx.service
systemctl --user disable dirx.service
rm -f "$SERVICE_DIR/dirx.service"

# Remove scripts
rm -f "$INSTALL_DIR/dirx.sh" "$INSTALL_DIR/watcher.sh"

echo "Uninstallation complete!"
