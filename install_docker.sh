#!/bin/bash

# Description: Install Docker

# Usage: install_zsh.sh

# Author: Steven Fowler (https://github.com/stevenmfowler)
# License: MIT (https://mit-license.org)

# Date: 2024-04-23

# 1 Update the package index
echo "Updating the package index..."
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y apt-transport-https ca-certificates curl gnupg
echo

# 2 Add Docker GPG key
echo "Adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
echo

# 3 Add Docker repository
echo "Adding Docker repository..."

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu jammy stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo

# Update the package index again
echo "Updating the package index again..."
sudo apt update
echo

# 4 Install Docker and related packages
echo "Installing Docker and related packages..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo

# 5 Add current user to the docker group
echo "Adding current user to the docker group..."
sudo usermod -aG docker $USER
echo

# 6 Verify Docker installation
echo "Verifying Docker installation..."
docker version
sudo systemctl is-active docker
sudo docker run hello-world
echo

echo "Docker installation completed successfully!"
