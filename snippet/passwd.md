# passwd

## 修改密碼(自己)

```shell
$ passwd
Changing password for username
(current) UNIX password:
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
```

## 修改密碼(其他使用者)

```shell
$ passwd username
Changing password for username
(current) UNIX password:
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
```

## 查看用戶狀態

```shell
$ passwd -S username
username PS 2013-09-23 0 99999 7 -1 (Password set, SHA512 crypt.)
```

## 修改群組密碼

```shell
passwd -g GroupName
```

## 列出所有帳號

```shell
cat /etc/passwd
```
