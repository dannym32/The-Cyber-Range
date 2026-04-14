#
.SYNOPSIS
    The PowerShell fix remediates STIG WN11-SO-000220 by configuring the minimum session security required for NTLM SSP based servers through the registry. It creates or updates the NTLMMinServerSec value under HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0 as a REG_DWORD set to 537395200 (0x20080000), which is the exact value required by the STIG. This enforces the same setting as enabling “Require NTLMv2 session security” and “Require 128-bit encryption” in Local Security Policy, but applies it through script for consistent and repeatable remediation. The fix is STIG aligned, though centrally managed Group Policy may later overwrite the manual change.

.NOTES
    Author          : Daniel Mullins
    LinkedIn        : https://www.linkedin.com/in/daniel-mullins24/
    GitHub          : https://github.com/dannym32
    Date Created    : 2026-04-14
    Last Modified   : 2026-04-14
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000126

.TESTED ON
    Date(s) Tested  : 2026-04-14
    Tested By       : Daniel Mullins
    Systems Tested  : Windows 11
    PowerShell Ver. : 1.23.20211.0

.USAGE
    Paste the code below into powershell ISE, save it as a "script-name".ps1 and run it.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-SO-000185.ps1  
#>
$path  = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0'
$name  = 'NTLMMinServerSec'
$value = 537395200

New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name $name -PropertyType DWord -Value $value -Force | Out-Null
