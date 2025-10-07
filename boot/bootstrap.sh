#!/usr/bin/env bash

#=================================================
# System: Debian/Ubuntu
# Description: Bootstrap
# Author: lmly9193
# Usage: curl -Lso- https://lmly9193.dev/bashrc | bash && . ~/.bashrc
#=================================================

sudo apt update

COMMON_PKGS=(
  # Install locales and Chinese language support
  locales language-pack-zh-hant language-pack-zh-hant-base fonts-noto-cjk
  # Network, hardware, compression, editors, git, and general utilities
  curl wget net-tools nmap ufw htop zip unzip tar nano vim git screen
)

# Optimize the code by installing packages in batches of 5 for better performance
for ((i=0; i<${#COMMON_PKGS[@]}; i+=5)); do
  sudo apt install -y "${COMMON_PKGS[@]:i:5}"
done

# Install fastfetch for system information display
curl -Lso /tmp/fastfetch.deb https://lmly9193.dev/fastfetch && sudo apt install -y /tmp/fastfetch.deb

# Download bash aliases from remote
curl -Lso ~/.bash_aliases https://lmly9193.dev/bash_aliases

# Ask user if they want to set Git global config
read -p "Do you want to set Git global config with default user info? (y/n): " set_git
if [[ "$set_git" =~ ^[Yy]$ ]]; then
    git config --global user.email "$(whoami)@$(hostname)"
    git config --global user.name "$(whoami)"
    echo "Git global config set."
else
    echo "Skipping Git global config."
fi

# Configure Git with default user info
git config --global user.email "$(whoami)@$(hostname)"
git config --global user.name "$(whoami)"

# Generate Traditional Chinese locale
# Write locale settings to profile for persistence and immediate effect
sudo locale-gen zh_TW.UTF-8
if ! grep -q "export LANG=zh_TW.UTF-8" ~/.bashrc; then
    echo 'export LANG=zh_TW.UTF-8' >> ~/.bashrc
fi
sudo update-locale LANG=zh_TW.UTF-8
if ! grep -q "export LC_ALL=zh_TW.UTF-8" ~/.bashrc; then
    echo 'export LC_ALL=zh_TW.UTF-8' >> ~/.bashrc
fi



echo "中文化設置完成，請重新登入以完全套用設置"
