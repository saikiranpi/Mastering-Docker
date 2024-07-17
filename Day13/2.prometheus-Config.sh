# Create Prometheus user and directories
sudo useradd --no-create-home --shell /bin/false prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus

# Download Prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.36.2/prometheus-2.36.2.linux-amd64.tar.gz -P /tmp

# Extract the archive
cd /tmp
tar xvf prometheus-2.36.2.linux-amd64.tar.gz

# Move binaries to /usr/local/bin and set ownership
sudo cp /tmp/prometheus-2.36.2.linux-amd64/prometheus /usr/local/bin/
sudo cp /tmp/prometheus-2.36.2.linux-amd64/promtool /usr/local/bin/
sudo chown prometheus:prometheus /usr/local/bin/prometheus /usr/local/bin/promtool

# Move consoles and console libraries to /etc/prometheus and set ownership
sudo cp -r /tmp/prometheus-2.36.2.linux-amd64/consoles /etc/prometheus/
sudo cp -r /tmp/prometheus-2.36.2.linux-amd64/console_libraries /etc/prometheus/
sudo chown -R prometheus:prometheus /etc/prometheus/consoles /etc/prometheus/console_libraries

