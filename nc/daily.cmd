@echo off

:: Delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Update
reg delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Update /f

:: Delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Registration[version and language]
for /f %%i in ('"reg query "HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium" /s | findstr /L Registration"') do (
    echo Delete: %%i
    reg delete %%i /va /f
)

:: Delete Info and ShellFolder under HKEY_CURRENT_USER\Software\Classes\CLSID
for /f "tokens=*" %%a in ('reg query "HKEY_CURRENT_USER\Software\Classes\CLSID"') do (
    for /f "tokens=*" %%l in ('reg query "%%a" /f "Info" /s /e ^| findstr /i "Info"') do (
        echo Delete: %%a
        reg delete %%a /f
    )
    for /f "tokens=*" %%l in ('reg query "%%a" /f "ShellFolder" /s /e ^| findstr /i "ShellFolder"') do (
        echo Delete: %%a
        reg delete %%a /f
    )
)

powershell get-date -format s >> "%TEMP%\PremiumSoft.log"
