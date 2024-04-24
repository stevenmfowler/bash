#!/bin/bash
# Description:

  # Usage: install_vbox.sh

  # Author: Steven Fowler (https://github.com/stevenmfowler)
  # License: MIT (https://mit-license.org)

  # Date: 2024-04-23
# Description:

# Usage: install_vbox.sh

# Author: You (replace with your name)
# License: MIT (replace with desired license if applicable)

# Date: 2024-04-23

# **Bold Red Question** (corrected color code)
echo -e "[31;1m >> Follow the instructions on the screen after install <<[0m"

sleep 3

# **Bold Blue Output**
echo -e "[34;1m Installing VirtualBox and extension pack...[0m"
apt install virtualbox virtualbox-ext-pack

# **Bold Yellow Question (Optional)**
read -p "Install VirtualBox UI (y/N): " install_ui
# Check if answer is empty or lowercase "n" (treating lowercase as no)
if [[ -z "$install_ui" || "$install_ui" == "n" ]]; then
  echo -e "[34;1m Skipping VirtualBox UI installation.[0m"
else
  apt install virtualbox-qt
  echo -e "[34;1m VirtualBox UI installed successfully.[0m"
fi

# **Bold Blue Output**
echo -e "[34;1m DONE.[0m"
