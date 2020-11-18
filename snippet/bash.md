# Linux 學習筆記

* Compute Engine 架設 CentOS 7 、 Debian
* 建立 JDK JRE JCE 開發環境 Version 8

#### 指令

```bash
clear #like cls of dos
ls #列出當前資料夾
cp #複製
mkdir #新增目錄
rm #移除
mv #移動
cd #前往資料夾
echo #螢幕輸出
cat #螢幕輸出檔案
chmod #更改權限
yum #程式庫
nohup #nohangup
.bashrc #PowerOn do something
.bash_profile #user login do something
.bash_logout #user logout do something
.bash_history #指令紀錄
```

#### 查看Linux系統性能設定常用指令腳本

```bash
查看Linux系統性能設定常用指令腳本

1、系統查看指令
uname -a # 查看核心/操作系統/CPU訊息
head -n 1 /etc/issue # 查看操作系統版本
cat /proc/cpuinfo # 查看CPU訊息
hostname # 查看電腦名
lspci -tv # 列出所有PCI裝置
lsusb -tv # 列出所有USB裝置
lsmod # 列出載入的核心模組
env # 查看環境變數

2、資源/硬碟占用情況
free -m # 查看記憶體使用量和交換區使用量
df -h # 查看各分區使用情況
du -sh <目錄名> # 查看指定目錄的大小
grep MemTotal /proc/meminfo # 查看記憶體總量
grep MemFree /proc/meminfo # 查看空閒記憶體量
uptime # 查看系統執行時間、使用者數、負載
cat /proc/loadavg # 查看系統負載

3、磁碟和分區情況
mount | column -t # 查看掛接的分區狀態
fdisk -l # 查看所有分區
swapon -s # 查看所有交換分區
hdparm -i /dev/hda # 查看磁碟參數(僅適用於IDE裝置)
dmesg | grep IDE # 查看啟動時IDE裝置檢測狀況

4、網路查看
ifconfig # 查看所有網路介面的屬性
iptables -L # 查看防火牆設定
route -n # 查看路由表
netstat -lntp # 查看所有監聽埠
netstat -antp # 查看所有已經建立的連接
netstat -s # 查看網路統計訊息

5、進程查看
ps -ef # 查看所有進程
top # 即時顯示進程狀態

6、使用者查看
w # 查看活動使用者
id <使用者名稱> # 查看指定使用者訊息
last # 查看使用者登入日誌
cut -d: -f1 /etc/passwd # 查看系統所有使用者
cut -d: -f1 /etc/group # 查看系統所有組
crontab -l # 查看目前使用者的計劃任務

7、系統服務情況
chkconfig –list # 列出所有系統服務
chkconfig –list | grep on # 列出所有啟動的系統服務

8、程式查看
rpm -qa # 查看所有安裝的套裝軟體
```



#### 使腳本可由當前用戶執行。

```bash
chmod u+x start.sh
```

#### 設定虛擬記憶體 Swap

```bash
# In this example, we will create a swap file of size 1GB using the dd command as follows. Note that bs=1024 means read and write up to 1024 bytes at a time and count = (1024 x 1024)MB size of the file.
dd if=/dev/zero of=/swapfile bs=1024 count=1048576
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
```

$swapon -s 檢查作用
開機自動使用 /swapfile 作為 Swap 空間, 需要修改 /etc/fstab 檔案

```bash
echo "/swapfile swap swap sw 0 0" >> /etc/fstab
```

#### 使用 SFTP 連線到 Google Cloud VM

1. 產生公私鑰  

   ```bash
   ssh-keygen -t rsa -f ~/.ssh/ssh-key -C username
   ```

2. 自訂金鑰檔案名稱 ssh-key  

3. 自訂金鑰帳號 username  

4. 變更 Private Key 權限為唯獨 ?

   ```bash
   chmod 400 ~/.ssh/ssh-key
   ```

5. 印出私鑰，儲存至 ssh-key 檔  

   ```bash
   cat ~/.ssh/ssh-key
   ```

6. 印出公鑰，新增至 "Compute Engine" > "中繼資料" > "SSH 金鑰"  

   ```bash
   cat ~/.ssh/ssh-key.pub
   ```

7. 使用 FTP 軟體連線  

8. 連線方式為 SFTP  

9. port 22  

10. 輸入金鑰帳號 username  

11. 使用金鑰授權方式，檔案 ssh-key 

12. 成功連線  

#### 安裝 JDK

```
http://www.oracle.com/technetwork/java/javase/downloads/index-jsp-138363.html
http://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html
```

1. goto download JDK JRE (format rpm) JCE (format zip)
2. upload two .rpm
3. unzip jce_policy-8.zip and upload two .jar
4. install use root or sudo

   ```
   yum install jdk-8u121-linux-x64.rpm
   yum install jre-8u121-linux-x64.rpm
   ```
5. 設定環境變數 (.bash_profile or .bashrc or type-every-times)

   ```
   export PATH=/usr/java/jdk1.8.0_121/bin:$PATH
   export JAVA_HOME=/usr/java/jdk1.8.0_121
   ```

   #### 安裝 wget

   ```
   yum -y install wget
   ```

#### 安裝 zip and unzip

```
yum install zip unzip
```

#### 背景執行續

```
nohup node server.js &
nohup node server.js &> nohup.txt &
tail –f nohup.txt
```

#### 安裝 screen

```
yum install screen
```

#### 安裝 ngrok

```
https://ngrok.com/download
```

#### caddy

```
啟動：/etc/init.d/caddy start
停止：/etc/init.d/caddy stop
重啟：/etc/init.d/caddy restart
查看狀態：/etc/init.d/caddy status
查看Caddy啟動日誌：tail -f /tmp/caddy.log
安裝目錄：/usr/local/caddy
Caddy配置文件位置：/usr/local/caddy/Caddyfile
Caddy自動申請SSL證書位置：/.caddy/acme/acme-v01.api.letsencrypt.org/sites/xxx.xxx(域名)/
```

#### 時區

```
dpkg-reconfigure tzdata
dpkg-reconfigure locales
echo 'export LC_ALL=zh_TW.UTF-8' >> .bashrc
echo 'export LANG=zh_TW.UTF-8' >> .bashrc
echo 'export LANGUAGE=zh_TW.UTF-8' >> .bashrc
```

```
$ sudo apt-get update    # 更新伺服器的檔案清單
$ sudo apt-get upgrade    # 更新套件

export LS_OPTIONS='--time-style=long-iso --group-directories-first --color=auto'
alias ls='ls -sAhF1 $LS_OPTIONS'
alias ll='ls -lAhF $LS_OPTIONS'

export PS1="\\[\033[38;5;9m\][\[$(tput sgr0)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h: \[$(tput sgr0)\]\[\033[38;5;12m\]\w\[$(tput sgr0)\]\[\033[38;5;9m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]\\$\[$(tput sgr0)\]"

ssh root@51.15.243.118


rpc-secure=true  
rpc-certificate=/.caddy/acme/acme-v02.api.letsencrypt.org/sites/dl.4o4.pw/dl.4o4.pw.crt  
rpc-private-key=/.caddy/acme/acme-v02.api.letsencrypt.org/sites/dl.4o4.pw/dl.4o4.pw.key
```
