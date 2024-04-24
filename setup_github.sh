#!/bin/bash

# Description: Install git, setup GitHub Access 

# Usage: setup_github.sh

# Author: Steven Fowler (https://github.com/stevenmfowler)
# License: MIT (https://mit-license.org)

# Date: 2024-04-23

# Prompt for username
echo -e $YELLOW
read -p "Enter your Git user.name: " username
read -p "Enter your Git user.email: " email
read -p "Enter your Git token: " token
read -p "Enter your Git project: " project

sudo apt update && upgrade -y

sudo apt install git

git config --global user.name "$username"
echo -e "Set git user.name
"

git config --global user.email $email
echo -e "Set git user.email
"

git remote set-url origin "https://$token@github.com/$username/$project"
echo -e "https://$token@github.com/$username/$project"
echo -e "Setup github access to $project using $token for $username
"

git config --global init.default branch main
echo -e "Set default branch to main."

echo -e "Git configuration completed!"

