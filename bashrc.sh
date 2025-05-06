#!/usr/bin/env bash

#=================================================
# System: Debian/Ubuntu
# Description: Bash Shell for Debian/Ubuntu
# Author: lmly9193
# Usage: curl -Lso- https://lmly9193.dev/bashrc | bash && . ~/.bashrc
#=================================================

# 更新列表
sudo apt update

# 繁體中文語言包
sudo apt install -y language-pack-zh-hant

# 網路
sudo apt install -y curl wget net-tools nmap ufw

# 硬體
sudo apt install -y htop neofetch virt-what

# 壓縮
sudo apt install -y zip unzip tar

# 編輯器
sudo apt install -y nano vim

# Git
sudo apt install -y git
git config --global user.email "$(whoami)@$(hostname)"
git config --global user.name "$(whoami)"

# 一般
sudo apt install -y screen

cat <<EOF >>~/.bashrc

# ---------------- 使用者自訂 ----------------

export TZ='Asia/Taipei'
export LANG=zh_TW.UTF-8
export LANGUAGE=zh_TW.UTF-8
export LC_ALL=zh_TW.UTF-8
export LS_OPTIONS='--time-style=long-iso --group-directories-first --color=auto'
export VISUAL=nano
export EDITOR='\${VISUAL}'

alias su='sudo -i'
alias cls='clear'
alias ls='ls -AF \${LS_OPTIONS}'
alias ll='ls -lh'
alias grep='grep --color=auto'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias rmdir='rm -r'
alias df='df -h'
alias du='du -hc'
alias meminfo='free -mlt'
alias cpuinfo='lscpu'
alias pcinfo='neofetch'
alias vminfo='virt-what'
alias wget='wget -c'
alias ping='ping -c 5'
alias ports='netstat -tulanp'
alias top='htop'
alias untar='tar -zxvf'
alias vi='vim'
alias ipinfo='curl https://ipinfo.io/json && echo -e "\n"'
alias bench='curl -Lso- bench.sh | bash'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
EOF
