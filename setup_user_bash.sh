#!/bin/bash

# Description:

# Usage: setup_user_bash.sh

# Author: Steven Fowler (https://github.com/stevenmfowler)
# License: MIT (https://mit-license.org)

# Date: 2024-04-23

mkdir -p "$HOME/bin"

# Add the bin directory to the PATH only if it's not already there 
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
fi 

# Source the updated .bashrc to apply changes immediately
source "$HOME/.bashrc"

echo -e "The 'bin' folder has been created and added to your PATH (if necessary). You can now place Bash scripts in the 'bin' folder and run them from anywhere!"

echo -e "Be sure to issue the following command when you've created a new script:"

echo -e "chmod +x $HOME/bin/name_of_script.sh"
