Write-Host 'Installing Scheduled Task...'

$Root = "$env:APPDATA\lmly9193"

if (-not (Test-Path $Root)) {
    New-Item -Path $Root -ItemType Directory
}

Invoke-WebRequest -Uri "https://lmly9193.dev/nc-daily" | Set-Content -Path "$Root\PremiumSoft.ps1" -Force

$task = @{
    TaskName = 'Renew Trial'
    TaskPath = '\PremiumSoft\'
}

# $idle = @{
#     RunOnlyIfIdle     = $true
#     IdleDuration      = '00:30:00'
#     IdleWaitTimeout   = '00:05:00'
#     DontStopOnIdleEnd = $true
# }

$restart = @{
    RestartCount    = 3
    RestartInterval = '00:01:00'
}

$taskContent = @{
    Action    = (New-ScheduledTaskAction -Execute powershell -Argument "${Root}\PremiumSoft.ps1")
    Trigger   = (New-ScheduledTaskTrigger -Daily -At 7am)
    Principal = (New-ScheduledTaskPrincipal -UserId $env:USERNAME)
    Settings  = (New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -RunOnlyIfNetworkAvailable -StartWhenAvailable @restart)
}

if (Get-ScheduledTask @task -ErrorAction SilentlyContinue) {
    Unregister-ScheduledTask @task -Confirm:$false
}

Register-ScheduledTask @task @taskContent -Description 'Navicat Premium'

Add-Type -AssemblyName PresentationCore, PresentationFramework
if (Get-ScheduledTask @task -ErrorAction SilentlyContinue) {
    [System.Windows.MessageBox]::Show('Scheduled Task installed successfully.', 'Success', 'OK', 'Information')
    Start-ScheduledTask @task
}
else {
    [System.Windows.MessageBox]::Show('Failed to install Scheduled Task.', 'Error', 'OK', 'Error')
}
