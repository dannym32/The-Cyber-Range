 <#
.SYNOPSIS
    The fix PowerShell snippet enforces WN11-SO-000185 by ensuring the PKU2U policy registry key exists and then setting AllowOnlineID (REG_DWORD) to 0, which disables PKU2U authentication requests from using online identities. This prevents Microsoft/online identity–based authentication on domain-joined systems and keeps authentication centrally managed through Windows/domain accounts.

.NOTES
    Author          : Daniel Mullins
    LinkedIn        : https://www.linkedin.com/in/daniel-mullins24/
    GitHub          : https://github.com/dannym32
    Date Created    : 2026-04-13
    Last Modified   : 2026-04-13
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000185

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

$regPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\LSA\pku2u'
$regName = 'AllowOnlineID'

# Create the key if missing
New-Item -Path $regPath -Force | Out-Null

# Set AllowOnlineID to 0 (Disabled)
New-ItemProperty -Path $regPath -Name $regName -PropertyType DWord -Value 0 -Force | Out-Null
