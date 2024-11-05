#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Print each command to stdout before executing it
set -x

# Create required directories
mkdir -p ~/config/nvim
mkdir -p ~/.local/share/nvim/mason/packages

# Create an empty user config file
echo "return {}" > ~/.nvim_config.lua

# Add Mason tools directory to the PATH if not already present
if ! grep -q "~/.local/share/nvim/mason/bin" ~/.bashrc; then
  echo "PATH=\$PATH:~/.local/share/nvim/mason/bin" >> ~/.bashrc
fi

# Copy configuration files to ~/.config/nvim
mkdir -p ~/.config/nvim
cp -r ./* ~/.config/nvim/

# Install plugins and sync them using Neovim
nvim --headless "+Lazy! sync" +qa

# Print completion message
echo "Neovim configuration setup completed successfully."
