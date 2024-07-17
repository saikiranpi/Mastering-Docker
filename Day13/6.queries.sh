up

# Total CPU Usage
# This query calculates the total CPU usage by subtracting the idle CPU time from 100%.
100 - (avg by(instance) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)


# Per-CPU Usage:
# This query provides CPU usage per CPU core.
100 - (avg by(cpu) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)


# Memory Usage Percentage
# This query shows the percentage of memory used.
100 * (1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes))


# Free Memory:
# This query returns the amount of free memory in bytes.
node_memory_MemFree_bytes


# Disk Space Usage Percentage:
# This query shows the percentage of disk space used on the root filesystem.
100 - ((node_filesystem_free_bytes{mountpoint="/"} / node_filesystem_size_bytes{mountpoint="/"}) * 100)


# Disk I/O Utilization
# This query shows the disk I/O utilization percentage over the last 5 minutes.
irate(node_disk_io_time_seconds_total[5m]) * 100


# Network Traffic (Incoming and Outgoing):
# These queries show the rate of incoming and outgoing network traffic in bytes per second.
rate(node_network_receive_bytes_total[5m])
rate(node_network_transmit_bytes_total[5m])


# System Load
# This query shows the 1-minute load average of the system.
node_load1


# Filesystem Usage
# This query shows the used filesystem space in bytes on the root filesystem.
node_filesystem_size_bytes{mountpoint="/"} - node_filesystem_free_bytes{mountpoint="/"}


# Number of Running Processes
# This query returns the number of running processes on the system.
node_procs_running


# Node Exporter Uptime
# Uptime of Node Exporter
time() - node_boot_time_seconds