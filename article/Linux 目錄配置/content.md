# Linux 目錄配置

* Linux 目錄樹配置標準參考：[FHS (Filesystem Hierarchy Standard)](https://www.pathname.com/fhs/)
* FHS 標準，主要定義三段目錄：
* 最上層根目錄 `/`
  1. 次層 `/usr` 及
  2. 次層 `/var` 的目錄內容。
  3. FHS 定義的目錄資訊，主要分為四種：
![img5.png](image/img5.png)
![img6.png](image/img6.png)
* `/` ：root 根目錄

    ```shell
    [root@mdk-dyw /]# ls -al /
    total 68
    drwxr-xr-x   17 root adm   4096 Oct  5 08:17 ./
    drwxr-xr-x   17 root adm   4096 Oct  5 08:17 ../
    -rw-r--r--    1 root root     0 Sep 16 11:11 .autofsck
    drwxr-xr-x    2 root root  4096 Sep 28 12:50 bin/
    drwxr-xr-x    3 root root  4096 Sep 16 11:11 boot/
    drwxr-xr-x   26 root root 14420 Oct  4 15:28 dev/
    drwxr-xr-x   85 root root  8192 Oct  4 15:28 etc/
    drwxr-xr-x   18 root root  4096 Sep 26 12:45 home/
    drwxr-xr-x    2 root root  4096 Oct  5 08:19 initrd/
    drwxr-xr-x   11 root root  4096 Sep 28 12:49 lib/
    drwxr-xr-x    5 root root  4096 Oct  4 15:28 mnt/
    dr-xr-xr-x  164 root root     0 Sep 16 11:10 proc/
    -rw-------    1 root root  1024 Sep  9 13:06 .rnd
    drwx------   16 root root  4096 Oct  5 08:19 root/
    drwxr-xr-x    2 root root  8192 Sep 28 12:50 sbin/
    drwxr-xr-x   10 root root     0 Sep 16 11:10 sys/
    drwxrwxrwt   24 root root  4096 Oct  5 04:07 tmp/
    drwxr-xr-x   12 root root  4096 Sep  9 13:15 usr/
    drwxr-xr-x   23 root root  4096 Sep  9 17:31 var/
    ```

* 各目錄大致內容：
  * `/`                                         根目錄
    * `/etc`, `/bin`, `/dev`, `/lib`, `/sbin`   這五個次目錄都要與根目錄一起，不可為獨立的 partition。
  * `/bin`                                      放常用執行檔如：ls, mv, rm。
  * `/boot`                                     放 Linux 核心及開機相關檔案。
  * `/grub`                                     放 grub 開機管理程式。
  * `/dev`                                      放裝置有關的檔案，Linux 把裝置當成檔案看待。
  * `/etc`                                      放系統在開機過程需要讀取的檔案。
  * `/rc.d`                                     記錄開關機過程中的 scripts 檔案。
  * `/init.d`                                   放所有服務預設的啟動 scripts。
  * `/xinetd.d`                                 放一些額外的服務。
  * `/X11`                                      放 X window 有關的設定檔。
  * `/home`                                     使用者的家目錄。
  * `/lib`                                      放 Linux 執行或編譯程式時要使用的函式庫 (library)。
  * `/mnt`                                      軟碟及光碟預設掛載的地方。
  * `/proc`                                     虛擬檔案系統，不佔任何硬碟空間，放置的資料在記憶體中。放系統核心與執行程序的資訊。
  * `/root`                                     系統管理員的家目錄。
  * `/sbin`                                     放系統管理常用的程式如：fdisk, mount。
  * `/tmp`                                      一般使用者暫時存放檔案的地方。
  * `/usr`                                      此目錄包括許多子目錄，用來存放系統指令、安裝程式及套件。
  * `/bin`                                      放使用者可執行的程式執行檔。
  * `/include`                                  放一些套件的 header 檔。
  * `/lib`                                      內含許多程式與子程式所需的函式庫。
  * `/local`                                    升級或額外安裝的程式擺放的目錄，以區分原始系統安裝的程式。
  * `/man`                                      放程式的說明檔。
  * `/sbin`                                     放系統管理員可用之程式。
  * `/src`                                      放核心原始碼。
  * `/share`                                    放安裝的程式及套件。
  * `/doc`                                      放系統說明文件。
  * `/man`                                      放程式說明檔。
  * `/X11R6`                                    X window system 存放相關的目錄。
  * `/var`                                      放系統執行中，常態性變動的檔案。
  * `/cache`                                    程式執行中的暫存檔。
  * `/lib`                                      程式執行中需要使用的資料檔案，例如 rpm 資料庫系統。
  * `/log`                                      登錄檔。
  * `/run`                                      某些程式或服務啟動後會將其 PID 放置於此。
  * `/spool`                                    放一些佇列資料。例如主機收到電子郵件後，放於 `/var/spool/mail`。

## 練習題

1. Linux 目錄樹配置標準 FHS，主要定義那三段目錄？答： 1.最上層根目錄 `/`; 2.次層 `/usr` 及 3.次層 `/var` 的目錄內容。
2. Linux 目錄樹配置標準 FHS，定義的目錄資訊，主要分為那四種？答： 1.shareable; 2.unshareable; 3.static; 4.variable.
3. 目錄 `/usr` 在 Linux 目錄樹配置標準 FHS 中，包含那兩種資訊？答： 1.shareable; 2.static.
4. 目錄 `/etc` 在 Linux 目錄樹配置標準 FHS 中，包含那兩種資訊？答： 1.unshareable; 2.static.
5. 目錄 `/boot` 在 Linux 目錄樹配置標準 FHS 中，包含那兩種資訊？答： 1.unshareable; 2.static.
6. 目錄 `/var/mail` 在 Linux 目錄樹配置標準 FHS 中，包含那兩種資訊？答： 1.shareable; 2.variable.
7. 目錄 `/var/run` 在 Linux 目錄樹配置標準 FHS 中，包含那兩種資訊？答： 1.unshareable; 2.variable.
8. Linux 系統中，有那五個次目錄必須與根目錄同一分割槽，不可獨立分割？答： `/etc`, `/bin`, `/dev`, `/lib`, `/sbin` 等五個次目錄。
9. Linux 安裝套件主要放在那個目錄？答： `/usr`
10. Linux 設定檔放在那個目錄？答： `/etc`
11. Linux 常用的指令，例如： `ls`，放在那個目錄？答： `/bin`
12. Linux 系統中，次目錄 `/bin` 主要放那些類型的檔案？答： 放常用執行檔。
13. Linux 系統中，次目錄 `/boot` 主要放那些類型的檔案？答： 放 Linux 核心及開機相關檔案。
14. Linux 系統中，次目錄 `/dev` 主要放那些類型的檔案？答： 放裝置有關的檔案，Linux 把裝置當成檔案看待。
15. Linux 系統中，次目錄 `/etc` 主要放那些類型的檔案？答： 放系統在開機過程需要讀取的檔案。
16. Linux 系統中，次目錄 `/etc/rc.d` 主要放那些類型的檔案？答： 記錄開關機過程中的 scripts 檔案。
17. Linux 系統中，次目錄 `/etc/init.d` 主要放那些類型的檔案？答： 放所有服務預設的啟動 scripts。
18. Linux 系統中，次目錄 `/etx/X11` 主要放那些類型的檔案？答： 放 X window 有關的設定檔。
19. Linux 系統中，次目錄 `/home` 主要放那些類型的檔案？答： 使用者的家目錄，放使用者個人檔案及設定。
20. Linux 系統中，次目錄 `/lib` 主要放那些類型的檔案？答： 放 Linux 執行或編譯程式時要使用的函式庫。
21. Linux 系統中，次目錄 `/mnt` 主要放那些類型的檔案？答： 軟碟及光碟預設掛載的地方。
22. Linux 系統中，次目錄 `/root` 主要放那些類型的檔案？答： 系統管理員的家目錄，放系統管理員個人檔案及設定。
23. Linux 系統中，次目錄 `/sbin` 主要放那些類型的檔案？答： 放系統管理常用的程式。
24. Linux 系統中，次目錄 `/tmp` 主要放那些類型的檔案？答： 一般使用者暫時存放檔案的地方。
25. Linux 系統中，次目錄 `/usr` 主要放那些類型的檔案？答： 此目錄包括許多子目錄，用來存放系統指令、安裝程式及套件。
26. Linux 系統中，次目錄 `/usr/man` 主要放那些類型的檔案？答： 放程式的說明檔。
27. Linux 系統中，次目錄 `/usr/bin` 主要放那些類型的檔案？答： 放使用者可執行的程式執行檔。
28. Linux 系統中，次目錄 `/usr/sbin` 主要放那些類型的檔案？答： 放系統管理員可用之程式。
29. Linux 系統中，次目錄 `/usr/share` 主要放那些類型的檔案？答： 放安裝的程式及套件。
30. Linux 系統中，次目錄 `/usr/src` 主要放那些類型的檔案？答： 放核心原始碼。
31. Linux 系統中，次目錄 `/var` 主要放那些類型的檔案？答： 放系統執行中，常態性變動的檔案。
32. Linux 系統中，次目錄 `/var/log` 主要放那些類型的檔案？答： 登錄檔。
33. Linux 系統中，次目錄 `/var/spool` 主要放那些類型的檔案？答： 放一些佇列資料。例如主機收到電子郵件後，放於 `/var/spool/mail`。
