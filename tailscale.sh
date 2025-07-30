#!/bin/bash
set -e

# 1. Install Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# 2. Auth Key: créer ici (expire 90 jours) => https://login.tailscale.com/admin/settings/keys
TAILSCALE_AUTHKEY="tskey-xxxxxxxxxxxxxxxx"

# 3. Connect
tailscale up --authkey $TAILSCALE_AUTHKEY --ssh

# 4. Check IP
tailscale ip -4
