#!/bin/bash
# Description:

  # Usage: install_base_python.sh

  # Author: Steven Fowler (https://github.com/stevenmfowler)
  # License: MIT (https://mit-license.org)

  # Date: 2024-04-23
# Description:

# Usage: install_base_python.sh

# Author: You (replace with your name)
# License: MIT (replace with desired license if applicable)

# Date: 2024-04-23



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
