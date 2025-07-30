#!/bin/bash
set -e

# Install Syncthing (ARM64 compatible)
curl -s https://syncthing.net/release-key.txt | gpg --dearmor > syncthing-archive-keyring.gpg
sudo mv syncthing-archive-keyring.gpg /usr/share/keyrings/
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

sudo apt update && sudo apt install syncthing -y

# Enable auto-start
systemctl enable syncthing@$(whoami).service
systemctl start syncthing@$(whoami).service
