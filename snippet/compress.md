# 各種壓縮與解壓縮指令

## .tar

套件名稱：tar

```shell
tar cvf FileName.tar DirName    # 加壓
tar xvf FileName.tar            # 解壓
```

## .gz

套件名稱：gzip

```shell
gzip FileName           # 加壓
gunzip FileName.gz      # 解壓
gzip -d FileName.gz     # 解壓
```

## .tar.gz

套件名稱：gzip

```shell
tar zcvf FileName.tar.gz DirName    # 加壓
tar zxvf FileName.tar.gz            # 解壓
```

## .bz

```shell
#　加壓：unkown

bzip2 -d FileName.bz    # 解壓
bunzip2 FileName.bz     # 解壓
```

## .tar.bz

```shell
# 加壓：unkown

tar jxvf FileName.tar.bz    # 解壓
```

## .bz2

套件名稱：bzip2

```shell
bzip2 -z FileName       # 加壓
bzip2 -d FileName.bz2   # 解壓1
bunzip2 FileName.bz2    # 解壓2
```

## .tar.bz2

套件名稱：bzip2、lbzip2`(parallel)`

```shell
tar jcvf FileName.tar.bz2 DirName               # 加壓
tar -I lbzip2 -cvf FileName.tar.bz2 DirName     # 加壓
tar jxvf FileName.tar.bz2                       # 解壓
```

## .xz

套件名稱：xz-utils

```shell
xz -z FileName      # 加壓
xz -d FileName.xz   # 解壓
```

## .tar.xz

套件名稱：xz-utils

```shell
tar Jcvf FileName.tar.xz DirName    # 加壓
tar Jxvf FileName.tar.xz            # 解壓
```

## .Z

```shell
compress FileName       # 加壓
uncompress FileName.Z   # 解壓
```

## .tar.Z

```shell
tar Zcvf FileName.tar.Z DirName # 加壓
tar Zxvf FileName.tar.Z         # 解壓
```

## .tgz

套件名稱：gzip

```shell
tar zcvf FileName.tgz FileName  # 加壓
tar zxvf FileName.tgz           # 解壓
```

## .tar.tgz

套件名稱：gzip

```shell
tar zcvf FileName.tar.tgz FileName  # 加壓
tar zxvf FileName.tar.tgz           # 解壓
```

## .7z

套件名稱：p7zip-full

```shell
7z a FileName.7z FileName               # 加壓
7z a FileName.7z FileName -p PASSWORD   # 使用密碼 (PASSWORD) 壓縮
7z x FileName.7z                        # 解壓
```

## .zip

套件名稱：zip

```shell
zip -r FileName.zip DirName # 加壓
unzip FileName.zip          # 解壓
```

## .rar

套件名稱：rar、unrar

```shell
rar a FileName.rar DirName  # 加壓
rar e FileName.rar          # 解壓
unrar e FileName.rar        # 解壓
rar x FileName.rar DirName  # 解壓3：在指定目錄內解壓縮。
```

## .lha

套件名稱：lha

```shell
lha -a FileName.lha FileName    # 加壓
lha -e FileName.lha             # 解壓
```
