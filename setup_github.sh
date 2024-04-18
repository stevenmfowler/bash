#!/bin/bash
BLACK="\\033[30m"
RED="\\033[31m"
GREEN="\\033[32m"
YELLOW="\\033[33m"
BLUE="\\033[34m"
PINK="\\033[35m"
CYAN="\\033[36m"
WHITE="\\033[37m"

# Prompt for username
read -p "Enter your Git username: " username
git config --global user.name "$username"

# Prompt for email
read -p "Enter your Git email: " email
git config --global user.email $email

# Prompt for email
read -p "Enter your Git token: " token
git config --global user.email "$email"

# Set Git remote URL
git remote set-url origin "https://$email@github.com/$username"

# Set default branch
git config --global init.default branch main

echo -e $YELLO"Git configuration completed!"

