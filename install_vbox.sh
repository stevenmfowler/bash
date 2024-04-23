#!/bin/bash

# Created by: Steve Fowler (2024-04-23)

# **Bold Red Question** (corrected color code)
echo -e "\e[31;1m >> Follow the instructions on the screen after install <<\e[0m"

sleep 3

# **Bold Blue Output**
echo -e "\e[34;1m Installing VirtualBox and extension pack...\e[0m"
apt install virtualbox virtualbox-ext-pack

# **Bold Yellow Question (Optional)**
read -p "Install VirtualBox UI (y/N): " install_ui
# Check if answer is empty or lowercase "n" (treating lowercase as no)
if [[ -z "$install_ui" || "$install_ui" == "n" ]]; then
  echo -e "\e[34;1m Skipping VirtualBox UI installation.\e[0m"
else
  apt install virtualbox-qt
  echo -e "\e[34;1m VirtualBox UI installed successfully.\e[0m"
fi

# **Bold Blue Output**
echo -e "\e[34;1m DONE.\e[0m"
