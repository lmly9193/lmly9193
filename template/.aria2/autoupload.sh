#!/bin/bash

# 本機下載資料夾路徑
downloadpath='/root/downloads'
# 雲端名稱
name=name
# 雲端資料夾路徑
folder=folder

# 取原始路徑，我的環境下如果是單檔則為/data/demo.png,如果是資料夾則該值為資料夾內某個檔比如/data/a/b/c/d.jpg
path=$3

# 下載文件為 0 跳出腳本
if [ $2 -eq 0 ]; then
  exit 0
fi

# 提取下載文件根路徑，如把/data/a/b/c/d.jpg變成/data/a
while true; do
  filepath=$path
  path=${path%/*};
  if [ "$path" = "$downloadpath" ] && [ $2 -eq 1 ]; then
    # 如果下載的是單個檔
    rclone move "$filepath" ${name}:${folder}/ -v --config=/root/.config/rclone/rclone.conf --log-file=/root/.aria2/rclone_upload.log
    exit 0
  elif [ "$path" = "$downloadpath" ]; then
    # 資料夾
    while [[ "<code>ls -A "$filepath/"</code>" != "" ]]; do
      rclone move "$filepath"/ ${name}:${folder}/"${filepath##*/}"/ --delete-empty-src-dirs --config=/root/.config/rclone/rclone.conf -v --log-file=/root/.aria2/rclone_upload.log
    done
    exit 0
  fi
done
