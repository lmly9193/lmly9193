#!/usr/bin/env bash

sudo apt update

sudo apt install -y locales
sudo locale-gen zh_TW.UTF-8
sudo update-locale LANG=zh_TW.UTF-8

COMMON_PKGS=(
  curl wget net-tools nmap ufw
  htop neofetch virt-what
  zip unzip tar
  nano vim
  git screen
  nano vim git screen
)

# Optimize the code by installing packages in batches of 5 for better performance
for ((i=0; i<${#COMMON_PKGS[@]}; i+=5)); do
  sudo apt install -y "${COMMON_PKGS[@]:i:5}"
done
