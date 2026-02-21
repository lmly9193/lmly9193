# NC

## Register/Unregister Task

```pwsh
# 遠端執行(推薦)
&([ScriptBlock]::Create((irm "https://gotu.page/navicat"))) [Install|Uninstall]
&([ScriptBlock]::Create((irm "https://gotu.page/navicat"))) -Register [Install|Uninstall]

# 本地執行
powershell -ExecutionPolicy Bypass -File .\navicat.ps1 [Install|Uninstall]
powershell -ExecutionPolicy Bypass -File .\navicat.ps1 -Register [Install|Uninstall]
```

## Renew Once

```pwsh
# 遠端執行(推薦)
irm https://gotu.page/navicat | iex

# 本地執行
powershell -ExecutionPolicy Bypass -File .\navicat.ps1
```
