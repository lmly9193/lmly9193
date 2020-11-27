
# .gitattributes 的用處

git官網介紹: https://goo.gl/zqwUi1

一言以蔽之: 告訴git哪些是目錄, 子目錄或文件類型的集合 是屬於甚麼屬性

使用情境(摘自於官網):

* 情境一 : **識別二進位檔案**

* 情境二 : **Diffing Binary Files**

## **識別二進位檔案**

在Mac中的Xcode專案都會有一個 `.pbxproj` 結尾的檔案[註1], 簡單來說這個檔案像是一個文字檔類型的小型資料庫, 當資料被兩個人修改時, 是無法進行合併, 也無法使用diff, 只有機器才能進行識別和操作, 這樣的操作不像是一個文字檔, 反而像是二進位檔案, 於是可以讓git將這類型檔案視為二進位檔案

解決的做法可以將以下指令加入到 `.gitattributes` 文件:

```text
*.pbxproj -crlf -diff
```

git 1.6及之後的版本中可以用一個巨集代替 `-crlf -diff` :

```text
*.pbxproj binary
```

> 註1: 它是由記錄設定項的 IDE 寫到磁碟的 JSON 資料集, 是一種純文字 javascript 資料類型

## **Diffing Binary Files**

Git 對於 MS的word檔( *.doc) 當作是binary的檔案, 於是如果想對這類型的檔案做diff時, 只會出現下方結果:

```shell
$ git diff
diff --git a/chapter1.doc b/chapter1.doc
index 88839c4..4afcb7c 100644
Binary files a/chapter1.doc and b/chapter1.doc differ
```

這樣的結果完全無法得知doc檔案類型修改的部分，除非人工細看, 所以gitattribute解決這樣的問題, 將以下指令加入到 `.gitattributes` 文件

```text
*.doc diff=word
```

這樣git 就能知道, 當要對word檔(*.doc)做diff時, git 會使用”word”篩檢程式(filter)[註2], 把 word 文檔轉換成可讀的文字檔, 在進行diff, 如以下結果

```shell
$ git diff
diff --git a/chapter1.doc b/chapter1.doc
index c1c8a0a..b93c9e4 100644 
--- a/chapter1.doc
+++ b/chapter1.doc
@@ -128,7 +128,7 @@ and data size)
Since its birth in 2005, Git has evolved and matured to be easy to   use and yet retain these initial qualities. It’s incredibly fast, it’s very efficient with large projects, and it has an incredible branching
-system for non-linear development.
+system for non-linear development (See Chapter 3).
```

> [註2] ”word” 篩檢程式: 必須事先設定

```shell
git config diff.word.textconv catdoc

# 再到 .git/config 設定
# [diff "word"] textconv = catdoc
```

> 資料來源  
> https://medium.com/@ceall8650/gitattributes-%E7%9A%84%E7%94%A8%E8%99%95-bb165826df33
