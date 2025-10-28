$ErrorActionPreference = 'SilentlyContinue'

$ShowMessageBox = $false

Write-Host 'Renewing Trial...'

# Delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Update
Remove-Item -Path 'HKCU:\Software\PremiumSoft\NavicatPremium\Update' -Force

# Delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Registration*
foreach ($Key in (Get-ChildItem -Path 'HKCU:\Software\PremiumSoft\NavicatPremium' -Recurse | Where-Object Name -cmatch 'Registration')) {
    Remove-ItemProperty -Path $Key.PSPath -Name '*' -Force
}

# Delete HKEY_CURRENT_USER\Software\Classes\CLSID\*\(Info|ShellFolder)
foreach ($Key in (Get-ChildItem -Path 'HKCU:\Software\Classes\CLSID')) {
    foreach ($SubKey in (Get-ChildItem -Path $Key.PSPath -Recurse | Where-Object Name -cmatch '(Info|ShellFolder)')) {
        Remove-Item -Path $Key.PSPath -Recurse -Force
    }
}

"$(Get-Date -Format s)" | Add-Content -Path "${PSScriptRoot}\PremiumSoft.log"

if ($ShowMessageBox) {
    Add-Type -AssemblyName PresentationCore, PresentationFramework
    [System.Windows.MessageBox]::Show('Trial Renewed.', 'Success', 'OK', 'Information')
}
