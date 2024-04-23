#!/bin/bash

## Created by: Steven Fowler (2024-03-02)


# Update package index
echo "Updating package index..."
sudo apt update -y
sudo apt upgrade -y
echo

# Install Python with pip
echo "Installing Python and pip..."
sudo apt install python3-full -y
echo

# Install virtualenv
echo "Installing virtualenv..."
pip3 install virtualenv
echo

