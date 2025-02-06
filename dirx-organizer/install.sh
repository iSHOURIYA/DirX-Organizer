#!/bin/bash

echo "Installing DirX Organizer..."

# Ensure dependencies are installed
if ! command -v inotifywait &> /dev/null; then
    echo "Installing inotify-tools..."
    sudo apt update && sudo apt install -y inotify-tools
else
    echo "inotify-tools is already installed."
fi

# Define installation paths
BIN_DIR="$HOME/.local/bin"
SYSTEMD_DIR="$HOME/.config/systemd/user"

mkdir -p "$BIN_DIR" "$SYSTEMD_DIR"

# Copy scripts
cp dirx-organizer/dirx.sh "$BIN_DIR/dirx.sh"
cp dirx-organizer/watcher.sh "$BIN_DIR/watcher.sh"
chmod +x "$BIN_DIR/dirx.sh" "$BIN_DIR/watcher.sh"

# Copy systemd service file
cp dirx-organizer/dirx.service "$SYSTEMD_DIR/dirx.service"

# Reload systemd daemon and enable service
systemctl --user daemon-reload
systemctl --user enable dirx.service
systemctl --user start dirx.service

echo "Installation complete! DirX Organizer is now running."
echo "To check its status, use: systemctl --user status dirx.service"
