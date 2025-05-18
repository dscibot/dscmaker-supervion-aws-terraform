#!/bin/bash

# Mettez à jour le système
sudo apt update -y && sudo apt upgrade -y

# Installer Docker et Docker Compose
sudo apt install -y docker.io docker-compose
sudo systemctl enable docker
sudo usermod -aG docker ubuntu

# Créer un dossier de projet
mkdir -p /home/ubuntu/monitoring
cd /home/ubuntu/monitoring

# Copier les fichiers Docker
cat <<EOF > docker-compose.yml
$(cat files/docker-compose.yml)
EOF

mkdir prometheus
cat <<EOF > prometheus/prometheus.yml
$(cat files/prometheus.yml)
EOF

# Lancer les conteneurs
docker compose up -d
