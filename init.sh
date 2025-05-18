#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user

# Installer docker-compose v2
curl -SL https://github.com/docker/compose/releases/download/v2.24.4/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
