# Reload systemd and start Prometheus service
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus

# Verify Prometheus is running
sudo systemctl status prometheus

# Check Prometheus binaries
ls -ltr /usr/local/bin/ | grep prom

curl -s -XPOST localhost:9090/-/reload