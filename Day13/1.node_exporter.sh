#!/bin/bash

# Create node_exporter user
apt update 
sudo useradd --no-create-home --shell /bin/false node_exporter

# Download node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz -P /tmp

# Extract the downloaded tarball
cd /tmp
tar xvf node_exporter-1.3.1.linux-amd64.tar.gz

# Move the binary to /usr/local/bin
sudo cp /tmp/node_exporter-1.3.1.linux-amd64/node_exporter /usr/local/bin/
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

# Create a systemd service file for node_exporter
sudo bash -c 'cat <<EOF > /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF'

# Reload systemd, start and enable node_exporter
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter

# Verify the service is running
sudo systemctl status node_exporter --no-pager
