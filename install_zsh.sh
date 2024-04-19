#!/bin/bash

read -p "\033[1;33mInstall Powerlevel10k (yes/no):\033[0m" power

# Check if Zsh is installed
if ! command -v zsh &> /dev/null; then
    echo -e "Zsh is not installed. Installing Zsh..."
    sudo apt-get install zsh
    echo -e "Zsh is installed successfully."
else 
    echo -e "Zsh is already installed."
fi

# Check if Oh My Zsh is installed
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo -e "Oh My Zsh is already installed. Moving on..."
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo -e "Oh My Zsh was installed. Moving on..."
fi

# Update Theme to Powerlevel10k
if [ "$power" == "yes" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo -e 'Updating Zsh theme to Powerlevel10k...\n'
    zshrc_file="$HOME/.zshrc"
    # Check if the line already exists (prevents duplicates)
    if grep -q "^ZSH_THEME=" "$zshrc_file"; then
        # Update the existing line
        sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$zshrc_file"
    else
        # Add the line to the end of the file
        echo -e 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$zshrc_file"
    fi
fi

echo -e "Done. Exit terminal, re-open, complete PowerLevel10K configuration wizard."

