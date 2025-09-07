# NC

## Register/Unregister Task

```pwsh
# 遠端執行(推薦)
irm https://lmly9193.dev/navicat.ps1 | iex [Install|Uninstall]

# 本地執行
powershell -ExecutionPolicy Bypass -File .\navicat.ps1 [Install|Uninstall]
powershell -ExecutionPolicy Bypass -File .\navicat.ps1 -Register [Install|Uninstall]
```

## Renew Once

```pwsh
# 遠端執行(推薦)
irm https://lmly9193.dev/navicat.ps1 | iex

# 本地執行
powershell -ExecutionPolicy Bypass -File .\navicat.ps1
```
