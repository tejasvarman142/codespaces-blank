#!/bin/bash
# Startup script to start port 1000 HTTP server

echo "Starting HTTP server on port 1000..."

# Port 1000 is a privileged port; start it with sudo in this dev container.
sudo -n python3 -m http.server 1000 --directory /workspaces/codespaces-blank > /tmp/port1000.log 2>&1 &

# Give it a moment to start
sleep 2

# Verify it's running
if netstat -tuln | grep -q ":1000 "; then
    echo "✓ Port 1000 is running successfully!"
else
    echo "✗ Port 1000 failed to start, check /tmp/port1000.log"
fi
