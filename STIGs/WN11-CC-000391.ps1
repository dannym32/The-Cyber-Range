<#
.SYNOPSIS
    This PowerShell remediation disables Internet Explorer 11 as a standalone browser by creating (if needed) the policy registry key under HKLM and setting `NotifyDisableIEOptions` (REG_DWORD) to `0`, which corresponds to the STIG-required option “Never.” With this policy in place, IE11 launches are prevented/redirected (typically to Microsoft Edge), ensuring Windows 11 users cannot use the unsupported IE11 standalone browser while still allowing managed legacy access via Edge IE mode if needed.


.NOTES
    Author          : Daniel Mullins
    LinkedIn        : https://www.linkedin.com/in/daniel-mullins24/
    GitHub          : https://github.com/dannym32
    Date Created    : 2026-04-13
    Last Modified   : 2026-04-13
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000391

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

$policyPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main'
$policyName = 'NotifyDisableIEOptions'

New-Item -Path $policyPath -Force | Out-Null
New-ItemProperty -Path $policyPath -Name $policyName -PropertyType DWord -Value 0 -Force | Out-Null
