# Create the bin directory if it doesn't exist
mkdir -p "$HOME/bin"

# Add the bin directory to the PATH
echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"

# Source the updated .bashrc to apply changes immediately
source "$HOME/.bashrc"

echo -e "\033[1;33mThe 'bin' folder has been created and added to your PATH. You can now place Bash scripts in the 'bin' folder and run them from anywhere!\033[0m"

