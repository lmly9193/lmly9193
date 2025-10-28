#!/usr/bin/env bash

#=================================================
# Ubuntu Bootstrap Script
# Author: lmly9193
# Usage: `curl -Lso- https://lmly9193.dev/bashrc | bash`
#=================================================

# Check if the script is run on Ubuntu
if [[ "$(source /etc/os-release; echo $ID)" != "ubuntu" ]]; then
    echo "❌ This script is intended for Ubuntu systems only."
    exit 1
fi

# Backup existing .bashrc and replace with /etc/skel/.bashrc if it exists
if [[ -f /etc/skel/.bashrc ]]; then
    mkdir -p ~/.bashrc.bak
    mv ~/.bashrc ~/.bashrc.bak/$(date +%Y%m%d_%H%M%S)
    cp /etc/skel/.bashrc ~/.bashrc
fi

# Ensure add-apt-repository is available
if ! command -v add-apt-repository >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y software-properties-common
fi

# Ensure gpg is available
if ! command -v gpg >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y gpg
fi

# Add 3rd party repositories (check if not already added)
if ! apt-cache policy | grep -q "zhangsongcui3371/fastfetch"; then
    sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
fi

if [[ ! -f /etc/apt/sources.list.d/charm.list ]]; then
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
    echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
fi

# Update package lists and install necessary packages
sudo apt update
sudo apt install -y locales curl wget net-tools nmap ufw htop zip unzip tar nano vim git screen fastfetch gum

# Setup locales
sudo locale-gen en_US.UTF-8
sudo locale-gen zh_TW.UTF-8
sudo update-locale

# Download and setup .bash_autoload
curl -fsSL "https://raw.githubusercontent.com/lmly9193/lmly9193/main/.bashrc/.bash_autoload" -o ~/.bash_autoload --retry 3
sed -i '/^[^#]/s|~/.bash_aliases|~/.bash_autoload|g' ~/.bashrc

echo "✅ Bootstrap completed successfully!"
echo "💡 Restart your terminal to apply all changes."
