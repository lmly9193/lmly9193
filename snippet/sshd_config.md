# sshd_config

## 使用 root 登入

```shell
$ sudo -i

$ passwd
# 自行設置一個密碼

$ vi /etc/ssh/sshd_config
# change "PermitRootLogin no"->"PermitRootLogin yes"
```

## 禁止 root 登入

```shell
$ sudo vi /etc/ssh/sshd_config
# change "PermitRootLogin yes"->"PermitRootLogin no"

$ sudo service ssh restart
# 重新啟動ssh

```
