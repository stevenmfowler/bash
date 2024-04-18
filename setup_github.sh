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
echo -e $YELLOW"Set git user.name\n"

# Prompt for email
read -p "Enter your Git email: " email
git config --global user.email $email
echo -e $YELLOW"Set git user.email\n"

# Prompt for email
read -p "Enter your Git token: " token

# Set Git remote URL
git remote set-url origin "https://$token@github.com/$username"
echo -e $YELLOW"Setup github access\n"

# Set default branch
git config --global init.default branch main
echo -e $YELLOW"Set default branch\n"

echo -e $CYAN"Git configuration completed!\n"

