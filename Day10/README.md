# Voting App with Traefik Ingress Controller

This repository demonstrates the setup of a voting application using Docker Swarm, Traefik as an Ingress controller, and AWS services like Route 53 and Network Load Balancer (NLB).

## Architecture Overview

![Architecture Diagram](![Screenshot 2024-07-09 145627](https://github.com/saikiranpi/Mastering-Docker/assets/109568252/2765da87-7532-4155-abf8-04da7803996b)
)

1. **Route 53**: Manages DNS routing for the domain.
2. **Network Load Balancer (NLB)**: Balances incoming traffic.
3. **Traefik**: Acts as an Ingress controller.
   - Handles HTTP to HTTPS redirection.
   - Manages SSL decryption and offloading.
4. **Voting and Result Services**: 
   - **Vote Service**: Listens on TCP port 80.
   - **Result Service**: Listens on TCP port 80.

## Setup Instructions

### Prerequisites

- Docker and Docker Swarm installed
- AWS CLI configured
- Traefik configured with Docker Swarm

### Steps

1. **Swploy Swarm Cluster **

   ```sh
   git clone https://github.com/saikiranpi/Terraform-Docker-Swarm-Cluster.git
   cd Terraform-Docker-Swarm-Cluster
   ```

2. **Configure Traefik**

   Ensure Traefik is configured correctly in `traefik.toml` or `traefik.yml`. This setup should handle:

   - HTTP to HTTPS redirection
   - SSL certificate configuration
   - Routing rules for the `vote` and `result` services

3. **Set up Route 53 and NLB**

   - Configure your Route 53 DNS to point to the NLB.
   - Ensure the NLB forwards traffic to Traefik.

4. **Access the Application**

   Open your browser and navigate to your domain to access the voting and result services.

## Conclusion

This setup demonstrates how to use Traefik as an Ingress controller with Docker Swarm, Route 53, and NLB to manage a simple voting application. For more details, refer to the accompanying video.

---
