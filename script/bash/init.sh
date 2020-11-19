#!/bin/bash


anno(){
    echo $1
    sleep 1
}

color(){

    # color define
    black(){ echo 0;};red(){ echo 1;};green(){ echo 2;};yellow(){ echo 3;};blue(){ echo 4;};purple(){ echo 5;};sky(){ echo 6;};white(){ echo 7;}
    
    # echo
    if [ $# == 2 ]; then
        echo -e "\033[3$($1)m$2\033[0m"
    fi

    if [ $# == 3 ]; then
        echo -e "\033[4$($2);3$($1)m$3\033[0m"
    fi
}


# permissions
if [ `id -u` != 0 ]; then
  color white red "請用sudo命令執行腳本"
  exit
fi

# update && upgrade package
anno $(color white red "正在更新套件清單...")
apt-get update
apt-get upgrade -y


# package

pkg=("exa" "screen" "virt-what" "zip" "unzip" "neofetch" "git" "curl" "wget" "htop")

color white red "你要安裝常用套件嗎 (y/n)?"
read -p "" CONT

if [ "$CONT" = "y" ]; then

    color white red "安裝模式 [全部安裝(a)/客製化(b)/移除全部(r)]"
    read -p "" CONT

    # 刪除存在的套件清單
    if [ -f "/tmp/pkg.list" ]; then
        rm /tmp/pkg.list
    fi

    if [ "$CONT" = "a" ]; then
        apt-get install -y $(printf "%s " "${pkg[@]}")
    fi

    if [ "$CONT" = "r" ]; then
        apt-get remove -y $(printf "%s " "${pkg[@]}")
    fi

    if [ "$CONT" = "b" ]; then
        for((i=0; i<${#pkg[@]}; i++))
        do
            color white red "[$((${i}+1))/${#pkg[@]}] 安裝 ${pkg[i]} (y/n)?"
            read -p "" CONT && [ "$CONT" = "y" ] && echo "${pkg[i]}">>/tmp/pkg.list
        done

        if [ -f "/tmp/pkg.list" ]; then
            read -p "確認安裝? (y/n)?" CONT && [ "$CONT" = "y" ] && apt-get install -y $(cat /tmp/pkg.list)
        fi
    fi
fi

exit 0
