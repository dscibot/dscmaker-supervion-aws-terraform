#!/bin/bash
apt update -y
apt install -y docker.io
systemctl start docker
systemctl enable docker
