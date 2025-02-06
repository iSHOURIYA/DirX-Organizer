#!/bin/bash

echo "Uninstalling DirX Organizer..."

# Define installation paths
BIN_DIR="$HOME/.local/bin"
SYSTEMD_DIR="$HOME/.config/systemd/user"

# Stop and disable service
systemctl --user stop dirx.service
systemctl --user disable dirx.service
rm "$SYSTEMD_DIR/dirx.service"

# Remove scripts
rm "$BIN_DIR/dirx.sh" "$BIN_DIR/watcher.sh"

# Reload systemd daemon
systemctl --user daemon-reload

echo "DirX Organizer has been completely removed."
