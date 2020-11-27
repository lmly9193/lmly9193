# Git Autocrlf 與 Safecrlf

關於 `autocrlf` 產生的一些警告訊息，在很早以前使用 git 的時候，就有了解了，但是一直沒有單獨進行筆記，加上 `safecrlf` 這設定一直沒有很仔細去了解，這次順便進行比較詳細的筆記。

這兩個設定都是針對換行符的設定，主要是 Git 早期是為了維護 Linux kernel 設計而成的，所以絕大部分使用環境都是 Linux 平台，而在 Linux 平台下，文字檔案的斷行符號預設為 `LF` 字元 (`\n `) ( `0x0A` )。不過，在 Windows 環境下，文字檔案的預設斷行符號卻是 `CRLF` ( `\r\n` ) ( `0x0D` `0x0A` )。這種轉換功能，加上 Git 的檔案比對，此種設定會造成一些可能影響與風險

* 若是 Repository 中同時包含 `LF` 與 `CRLF` ，經過自動轉換之後，就會造成原始檔案內容不同，等於竄改或破壞原始檔案，增添辨識問題。

## AutoCRLF

此功能就上述提及，會自動轉換換行字元，主要的設定影響如下：

* 設定成 `true` 的作用是 `commit` 時會自動將 `CRLF` 轉成 `LF` ； checkout 時會自動將 `LF` 轉成 `CRLF`

    ```shell
    git config --global core.autocrlf true
    ```

* 設定成 `input` 的作用是 commit 時會自動將 `CRLF` 轉成 `LF` ； checkout 時不轉換

    ```shell
    git config --global core.autocrlf input
    ```

* 設定成 `false` 的則是停止自動轉換，不管 `commit` 或是 checkout 都不會進行轉換

    ```shell
    git config --global core.autocrlf false
    ```

## SafeCRLF

這設定是更加嚴格的過濾換行符，只要 `git add` 或是 `commit` 或是 `push` 都會過濾

* `不允許` 有 `LF` 與 `CRLF` 混合的檔案

    ```shell
    git config --global core.safecrlf true
    ```

* `允許` 有 `LF` 與 `CRLF` 混合的檔案

    ```shell
    git config --global core.safecrlf false
    ```

* `允許` 有 `LF` 與 `CRLF` 混合的檔案，但是會出現 warning 警告訊息

    ```shell
    git config --global core.safecrlf warn
    ```

> 資料來源  
> https://shunnien.github.io/2018/06/03/git-autocrlf-and-safecrlf/
