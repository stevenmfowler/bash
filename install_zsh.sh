#!/bin/bash

# Description: Install Zsh, Oh My Zsh, Powerlevel10k (optional)

# Usage: install_zsh.sh

# Author: Steven Fowler (https://github.com/stevenmfowler)
# License: MIT (https://mit-license.org)

# Date: 2024-04-23

read -p "Install Powerlevel10k (Y/n):" power

# Check if Zsh is installed
if ! command -v zsh &> /dev/null; then
    echo "Zsh is not installed. Installing Zsh..."
    sudo apt-get install zsh
    echo "Zsh is installed successfully."
else 
    echo "Zsh is already installed."
fi

# Check if Oh My Zsh is installed
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is already installed. Moving on..."
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "Oh My Zsh was installed. Moving on..."
fi

# Update Theme to Powerlevel10k
if [ "$power" == "y" || "$power" == "y" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo 'Updating Zsh theme to Powerlevel10k...
'
    zshrc_file="$HOME/.zshrc"
    # Check if the line already exists (prevents duplicates)
    if grep -q "^ZSH_THEME=" "$zshrc_file"; then
        # Update the existing line
        sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$zshrc_file"
    else
        # Add the line to the end of the file
        echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$zshrc_file"
    fi
fi

echo "Done. Exit terminal, re-open, complete PowerLevel10K configuration wizard."
