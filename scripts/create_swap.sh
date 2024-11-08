#!/usr/bin/env bash

#=================================================
# System: Debian/Ubuntu
# Description:
# Author: lmly9193
# Usage:
#=================================================

#!/bin/bash

SWAP_FILE="/swapfile"

# 檢查是否為 root 權限執行
if [ "$EUID" -ne 0 ]; then
  echo "請以 root 權限執行此腳本。"
  exit 1
fi

# 顯示選單
function show_menu {
  echo "選擇操作："
  echo "1. 查看 Swap 狀態"
  echo "2. 創建 Swap 文件 (指定大小)"
  echo "3. 啟用 Swap 文件"
  echo "4. 停用 Swap 文件"
  echo "5. 刪除 Swap 文件"
  echo "6. 退出"
  echo -n "請輸入選項 [1-6]: "
}

# 查看 Swap 狀態
function view_swap_status {
  echo "當前的 Swap 狀態："
  swapon --show
  free -h | grep Swap
}

# 創建 Swap 文件
function create_swapfile {
  read -p "請輸入 Swap 大小 (例如 1G, 512M): " swapsize
  if [ -z "$swapsize" ]; then
    echo "無效的輸入，創建失敗。"
    return
  fi

  if [ -f "$SWAP_FILE" ]; then
    echo "Swap 文件已存在，無需創建。"
  else
    echo "創建 ${swapsize} 的 Swap 文件..."
    fallocate -l $swapsize $SWAP_FILE
    chmod 600 $SWAP_FILE
    mkswap $SWAP_FILE
    echo "$SWAP_FILE none swap defaults 0 0" >> /etc/fstab
    echo "Swap 文件創建完成。"
  fi
}

# 啟用 Swap 文件
function enable_swapfile {
  if [ -f "$SWAP_FILE" ]; then
    swapon $SWAP_FILE
    echo "Swap 文件已啟用。"
  else
    echo "Swap 文件不存在，請先創建。"
  fi
}

# 停用 Swap 文件
function disable_swapfile {
  if [ -f "$SWAP_FILE" ]; then
    swapoff $SWAP_FILE
    echo "Swap 文件已停用。"
  else
    echo "Swap 文件不存在。"
  fi
}

# 刪除 Swap 文件
function delete_swapfile {
  if [ -f "$SWAP_FILE" ]; then
    swapoff $SWAP_FILE
    rm $SWAP_FILE
    sed -i "\|$SWAP_FILE|d" /etc/fstab
    echo "Swap 文件已刪除。"
  else
    echo "Swap 文件不存在。"
  fi
}

# 主執行循環
while true; do
  show_menu
  read choice
  case $choice in
    1) view_swap_status ;;
    2) create_swapfile ;;
    3) enable_swapfile ;;
    4) disable_swapfile ;;
    5) delete_swapfile ;;
    6) echo "退出"; exit 0 ;;
    *) echo "無效的選項，請重試。";;
  esac
done
