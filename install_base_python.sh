#!/bin/bash

# Description: Install base python, pip, virtualenv

# Usage: install_base_python.sh

# Author: Steven Fowler (https://github.com/stevenmfowler)
# License: MIT (https://mit-license.org)

# Date: 2024-04-23

# Update package index
echo "Updating package index..."
sudo apt update -y
sudo apt upgrade -y
echo

# Install Python with pip
echo "Installing Python and pip..."
sudo apt install python3-full python3-pip -y
echo

# Install virtualenv
echo "Installing virtualenv..."
pip3 install virtualenv
echo
