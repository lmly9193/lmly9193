param(
    [string]$Register
)

# $ErrorActionPreference = 'SilentlyContinue'

Add-Type -AssemblyName PresentationCore, PresentationFramework

$ScriptURL = 'https://lmly9193.dev/navicat'
$ScheduledTask = @{
    TaskName = 'Renew Trial'
    TaskPath = '\PremiumSoft\'
}

function Install-ScheduledTask() {
    Write-Host 'Installing Scheduled Task...'

    Register-ScheduledTask @ScheduledTask `
        -Action (New-ScheduledTaskAction -Execute 'powershell.exe' -Argument "-NoProfile -WindowStyle Hidden -Command `"irm $ScriptURL | iex`"") `
        -Trigger (New-ScheduledTaskTrigger -Daily -At 7am) `
        -Principal (New-ScheduledTaskPrincipal -UserId $env:USERNAME) `
        -Settings (New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -RunOnlyIfNetworkAvailable -StartWhenAvailable -RestartCount 3 -RestartInterval (New-TimeSpan -Minutes 1)) `
        -Description 'Navicat Premium'

    if (Get-ScheduledTask @ScheduledTask -ErrorAction SilentlyContinue) {
        [System.Windows.MessageBox]::Show('Scheduled Task installed successfully.', 'Success', 'OK', 'Information')
        Start-ScheduledTask @ScheduledTask
    } else {
        [System.Windows.MessageBox]::Show('Failed to install Scheduled Task.', 'Error', 'OK', 'Error')
    }
}

function Uninstall-ScheduledTask($Silent = $false) {
    Write-Host 'Uninstalling Scheduled Task...'

    if (Get-ScheduledTask @ScheduledTask -ErrorAction SilentlyContinue) {
        Unregister-ScheduledTask @ScheduledTask -Confirm:$false
        if (-not $Silent) {
            [System.Windows.MessageBox]::Show('Scheduled Task uninstalled successfully.', 'Success', 'OK', 'Information')
        }
    } elseif (-not $Silent) {
        [System.Windows.MessageBox]::Show('Scheduled Task not found.', 'Info', 'OK', 'Information')
    }
}

function Invoke-RenewTrial($Silent = $false) {
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

    if (-not $Silent) {
        [System.Windows.MessageBox]::Show('Trial Renewed.', 'Success', 'OK', 'Information')
    }
}

# Parse Arguments

if (-not $Register -and $args.Count -gt 0) {
    $Register = $args[0]
}

# Main Logic
switch ($Register) {
    'Install' {
        Uninstall-ScheduledTask $true
        Install-ScheduledTask
    }
    'Uninstall' {
        Uninstall-ScheduledTask
    }
    default {
        Invoke-RenewTrial $true
    }
}
