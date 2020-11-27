# 配置 Git 處理行結束符

每次按鍵盤上的 <kbd>return</kbd> 時，會插入一個稱為行結束符的不可見字元。 不同的操作系統處理行結束符的方式不同。

在使用 Git 和 GitHub Enterprise Server 協作處理項目時，Git 可能產生意外結果，例如，您在 Windows 計算機上操作，而您的協作者是在 OS X 中做的更改。

您可以將 Git 配置為自動處理行結束符，以便與使用不同操作系統的人員有效地協作。

### 行結束符的全局設置

`git config core.autocrlf` 命令用於更改 Git 處理行結束符的方式。 它將採用單一參數。

#### Mac

在 OS X 上，只需將 `input（輸入）`傳遞給配置。 例如：

```shell
$ git config --global core.autocrlf input
# Configure Git to ensure line endings in files you checkout are correct for OS X
```

#### Windows

在 Windows 上，只需將 `true（真）`傳遞給配置。 例如：

```shell
$ git config --global core.autocrlf true
# Configure Git to ensure line endings in files you checkout are correct for Windows.
# For compatibility, line endings are converted to Unix style when you commit files.
```

#### Linux

在 Linux 上，只需將 `input（輸入）`傳遞給配置。 例如：

```shell
$ git config --global core.autocrlf input
# Configure Git to ensure line endings in files you checkout are correct for Linux
```

### 按倉庫設置

（可選）您可以配置 *.gitattribute* 文件來管理 Git 如何讀取特定倉庫中的行結束符。 將此文件提交到倉庫時，它將覆蓋所有倉庫貢獻者的 `core.autocrlf` 設置。 這可確保所有用戶的行為一致，而不管其 Git 設置和環境如何。

*.gitattributes* 文件必須在倉庫的根目錄下創建，且像任何其他文件一樣提交。

*.gitattributes* 文件看起來像一個兩列表格。

* 左側是 Git 要匹配的檔案名。
* 右側是 Git 應對這些文件使用的行結束符配置。

#### 範例

以下是 *.gitattributes* 文件範例。 您可以將其用作倉庫的模板：

```text
# Set the default behavior, in case people don't have core.autocrlf set.
* text=auto

# Explicitly declare text files you want to always be normalized and converted
# to native line endings on checkout.
*.c text
*.h text

# Declare files that will always have CRLF line endings on checkout.
*.sln text eol=crlf

# Denote all files that are truly binary and should not be modified.
*.png binary
*.jpg binary
```

您會發現文件是匹配的—`*.c`, `*.sln`, `*.png`—用空格分隔，然後提供設置—`text`, `text eol=crlf`, `binary`。 我們將在下面介紹一些可能的設置。

* `text=auto` Git 將以其認為最佳的方式處理文件。 這是一個合適的預設選項。

* `text eol=crlf` 在檢出時 Git 將始終把行結束符轉換為 `CRLF`。 您應將其用於必須保持 `CRLF` 結束符的文件，即使在 OSX 或 Linux 上。

* `text eol=lf` 在檢出時 Git 將始終把行結束符轉換為 `LF`。 您應將其用於必須保持 LF 結束符的文件，即使在 Windows 上。

* `binary` Git 會理解指定文件不是文本，並且不應嘗試更改這些文件。 `binary` 設置也是 `-text -diff` 的一個別名。

### 在更改行結束符後刷新倉庫

設置 `core.autocrlf` 選項或提交 *.gitattributes* 文件後，您可能會發現 Git 報告您尚未修改的文件更改。 Git 更改了行結束符，以匹配您的新配置。

為確保倉庫中的所有行結束符與新配置匹配，請使用 Git 備份文件，刪除倉庫中的所有文件（`.git` 目錄除外），然後一次性恢復所有文件。

1. 在 Git 中保存當前文件，以便不會遺失任何工作。

    ```shell
    git add . -u
    git commit -m "Saving files before refreshing line endings"
    ```

2. 添加回所有已更改的文件，然後標準化行結束符。

    ```shell
    git add --renormalize .
    ```

3. 顯示已重寫的標準化文件。

    ```shell
    git status
    ```

4. 將更改提交到倉庫。

    ```shell
    git commit -m "Normalize all the line endings"
    ```

> 資料來源  
> https://docs.github.com/en/enterprise-server@2.20/github/using-git/configuring-git-to-handle-line-endings
