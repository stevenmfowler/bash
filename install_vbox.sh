#!/bin/bash

# Description: Install VirtualBox, extension pack, ui (optional)

# Usage: install_vbox.sh

# Author: Steven Fowler (https://github.com/stevenmfowler)
# License: MIT (https://mit-license.org)

# Date: 2024-04-23


# **Bold Red Question** (corrected color code)
echo -e ">> Follow the instructions on the screen after install"

sleep 3

# **Bold Blue Output**
echo -e "Installing VirtualBox and extension pack..."
apt install virtualbox virtualbox-ext-pack

# **Bold Yellow Question (Optional)**
read -p "Install VirtualBox UI (y/N): " install_ui
# Check if answer is empty or lowercase "n" (treating lowercase as no)
if [[ -z "$install_ui" || "$install_ui" == "n" ]]; then
  echo -e "Skipping VirtualBox UI installation."
else
  apt install virtualbox-qt
  echo -e "VirtualBox UI installed successfully."
fi

# **Bold Blue Output**
echo -e "DONE."
