# 設定Swap

```shell
# In this example, we will create a swap file of size 1GB using the dd command as follows. Note that bs=1024 means read and write up to 1024 bytes at a time and count = (1024 x 1024)MB size of the file.
dd if=/dev/zero of=/swapfile bs=1024 count=1048576
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
```

$swapon -s 檢查作用
開機自動使用 /swapfile 作為 Swap 空間, 需要修改 /etc/fstab 檔案

```shell
echo "/swapfile swap swap sw 0 0" >> /etc/fstab
```
