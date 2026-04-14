 <#
.SYNOPSIS
    This PowerShell remediation enforces WN11-UC-000015 by creating (if needed) the policy registry key under the current user and setting NoToastApplicationNotificationOnLockScreen (REG_DWORD) to 1. That value enables the “Turn off toast notifications on the lock screen” policy, preventing toast notifications from appearing on the lock screen and reducing the chance of sensitive information being exposed to someone who can view a locked workstation.

.NOTES
    Author          : Daniel Mullins
    LinkedIn        : https://www.linkedin.com/in/daniel-mullins24/
    GitHub          : https://github.com/dannym32
    Date Created    : 2026-04-13
    Last Modified   : 2026-04-13
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-UC-000015

.TESTED ON
    Date(s) Tested  : 2026-04-13
    Tested By       : Daniel Mullins
    Systems Tested  : Windows 11
    PowerShell Ver. : 1.23.20211.0

.USAGE
    Paste the code below into powershell ISE, save it as a "script-name".ps1 and run it.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-SO-000185.ps1  
#>
# Current User on a workstation
$path = 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications'
$name = 'NoToastApplicationNotificationOnLockScreen'

# Ensure the policy key exists, then set the required value (1 = enabled policy = toasts off on lock screen)
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name $name -PropertyType DWord -Value 1 -Force | Out-Null

# Every User on a workstation
$subPath = 'SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications'
$name    = 'NoToastApplicationNotificationOnLockScreen'

Get-ChildItem Registry::HKEY_USERS |
  Where-Object { $_.Name -match 'S-1-5-21-' } |
  ForEach-Object {
    $p = "Registry::$($_.Name)\$subPath"
    New-Item -Path $p -Force | Out-Null
    New-ItemProperty -Path $p -Name $name -PropertyType DWord -Value 1 -Force | Out-Null
  }
