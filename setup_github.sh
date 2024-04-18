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
echo -e $YELLOW
read -p "Enter your Git user.name: " username
read -p "Enter your Git user.email: " email
read -p "Enter your Git token: " token
read -p "Enter your Git project: " project

echo -e $PINK

git config --global user.name "$username"
echo -e "Set git user.name\n"

git config --global user.email $email
echo -e "Set git user.email\n"

git remote set-url origin "https://$token@github.com/$username/$project"
echo -e "https://$token@github.com/$username/$project"
echo -e "Setup github access to $project using $token for $username\n"

git config --global init.default branch main
echo -e $PINK"Set default branch\n"

echo -e $CYAN"Git configuration completed!\n"
echo -e $GREEN
