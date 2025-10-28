# ~/.bash_aliases: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

alias su='sudo -i'
alias cls='clear'
alias ls='ls -AF $LS_OPTIONS'
alias ll='ls -lh'
alias grep='grep --color=auto'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias rmdir='rm -r'
alias df='df -h'
alias du='du -hc'

alias fetch='fastfetch'
alias wget='wget -c'
alias ping='ping -c 5'
alias ports='netstat -tulanp'
alias top='htop'
alias untar='tar -zxvf'
alias vi='vim'

alias en_US='export LC_ALL=en_US.UTF-8'
alias zh_TW='export LC_ALL=zh_TW.UTF-8'
alias __='_func'

# alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
