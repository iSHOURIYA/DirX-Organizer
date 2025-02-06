#!/bin/bash

echo "Installing DirX Organizer..."

# Define paths
INSTALL_DIR="$HOME/.local/bin"
SERVICE_DIR="$HOME/.config/systemd/user"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"  # Get script location

# Ensure required directories exist
mkdir -p "$INSTALL_DIR" "$SERVICE_DIR"

# Check for required dependencies
echo "Checking for required dependencies..."
if ! command -v inotifywait &>/dev/null; then
    echo "inotify-tools not found. Installing..."
    sudo apt update && sudo apt install -y inotify-tools
else
    echo "inotify-tools is already installed."
fi

# Copy scripts to the user's bin folder
echo "Copying scripts to $INSTALL_DIR..."
cp "$SCRIPT_DIR/dirx.sh" "$INSTALL_DIR/"
cp "$SCRIPT_DIR/watcher.sh" "$INSTALL_DIR/"
chmod +x "$INSTALL_DIR/dirx.sh" "$INSTALL_DIR/watcher.sh"

# Add $INSTALL_DIR to PATH if not already present
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
fi

# Set up systemd user service
echo "Setting up systemd service..."
cp "$SCRIPT_DIR/dirx.service" "$SERVICE_DIR/"
systemctl --user daemon-reload
systemctl --user enable dirx.service
systemctl --user start dirx.service

# Enable lingering to allow user services at startup
loginctl enable-linger "$USER"

echo "Installation complete! DirX Organizer is now running in the background."
echo "You can check its status with: systemctl --user status dirx.service"
