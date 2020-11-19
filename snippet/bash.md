# Bash 速查表

## 系統查看指令

```shell
uname -a                # 查看核心/操作系統/CPU訊息
head -n 1 /etc/issue    # 查看操作系統版本
cat /proc/cpuinfo       # 查看CPU訊息
hostname                # 查看電腦名
lspci -tv               # 列出所有PCI裝置
lsusb -tv               # 列出所有USB裝置
lsmod                   # 列出載入的核心模組
env                     # 查看環境變數
```

## 資源/硬碟占用情況

```shell
free -m                        # 查看記憶體使用量和交換區使用量
df -h                          # 查看各分區使用情況
du -sh folder/                 # 查看指定目錄的大小
grep MemTotal /proc/meminfo    # 查看記憶體總量
grep MemFree /proc/meminfo     # 查看空閒記憶體量
uptime                         # 查看系統執行時間、使用者數、負載
cat /proc/loadavg              # 查看系統負載
```

## 磁碟和分區情況

```shell
mount | column -t     # 查看掛接的分區狀態
fdisk -l              # 查看所有分區
swapon -s             # 查看所有交換分區
hdparm -i /dev/hda    # 查看磁碟參數(僅適用於IDE裝置)
dmesg | grep IDE      # 查看啟動時IDE裝置檢測狀況
```

## 網路查看

```shell
ifconfig         # 查看所有網路介面的屬性
iptables -L      # 查看防火牆設定
route -n         # 查看路由表
netstat -lntp    # 查看所有監聽埠
netstat -antp    # 查看所有已經建立的連接
netstat -s       # 查看網路統計訊息
```

## 進程查看

```shell
ps -ef    # 查看所有進程
top       # 即時顯示進程狀態
```

## 使用者查看

```shell
w                          # 查看活動使用者
id username                # 查看指定使用者訊息
last                       # 查看使用者登入日誌
cut -d: -f1 /etc/passwd    # 查看系統所有使用者
cut -d: -f1 /etc/group     # 查看系統所有組
crontab -l                 # 查看目前使用者的計劃任務
```

## 系統服務情況

```shell
chkconfig –list              # 列出所有系統服務
chkconfig –list | grep on    # 列出所有啟動的系統服務
```

## 程式查看

```shell
rpm -qa    # 查看所有安裝的套裝軟體
```
