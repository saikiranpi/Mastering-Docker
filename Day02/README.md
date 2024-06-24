![02](https://github.com/saikiranpi/Mastering-Docker/assets/109568252/7d18cf0c-2c71-4d4a-bff9-aed6fab5d8d7)

# Why We Need Separate Utilization for Docker Data
The default directory for Docker is /var/lib/docker. As you continue downloading images and generating logs, this directory will consume more space and eventually get busy. To prevent this, we can store all our Docker data in a separate directory.

# Steps To Create EBS Volume and Attaching it to the instance
Create EBS volume GP2 and atatch it to Instance

lsblk 

fdisk /dev/xvdf  

n > p > w > 

lsblk 

mkfs.ext4 /dev/xvdf1 

copy UUID Somewhere 

mkdir /dockerdata 

nano /etc/fstab 

Paste Like below

![image](https://github.com/saikiranpi/Mastering-Docker/assets/109568252/1ad08bf8-593e-4579-921c-0f7d8938c8ee)

# Why We Need a Custom Network for Containers

With the default bridge network, containers can communicate with each other using IP addresses but not with container names. To enable communication using container names, we need to create a custom network.

First create a customer network 

Docker network create myapp --driver bridge

Docker network inspect myapp

Now run containers with including the custom network

docker run –rm -d –name app3 -p 8001 –network myapp  kiran2361993:troubleshootingtools:v1

docker run –rm -d –name app4 -p 8002 –network myapp  kiran2361993:troubleshootingtools:v1

If you login to the container with docker exec -it containername bash and you can ping with the container name instead of IP, It should work. 

# Using the HOST Network Mode

The HOST network mode means the container shares the host's IP address. This eliminates the need for port forwarding when running the container. For example, when using Prometheus with Node Exporter, it utilizes the host IP for metric collection, making it easier to access the metrics.

Example Command

docker run --rm -d --name node-exporter --network host prom/node-exporter

You can access the Node Exporter from the host's public IP on port 9100. To inspect the Docker image and understand the default settings, use the following command:

docker image inspect prom/node-exporter:latest

# Using the NONE Network Mode

The NONE network mode means the container has no network interfaces enabled except for a loopback device. This is useful for highly isolated containers that do not require any network access.

Example Command

docker run --rm -d --name isolated-container --network none busybox

This command runs a BusyBox container with no network connectivity, providing complete network isolation.



