<#
.SYNOPSIS
    The PowerShell fix makes sure the required registry location exists, then sets the NTLMMinClientSec value to 0x20080000 (537395200). This forces Windows to use stronger NTLM session security for client connections by requiring NTLMv2 session security and 128-bit encryption, which helps prevent weaker NTLM sessions from being used.
.NOTES
    Author          : Daniel Mullins
    LinkedIn        : https://www.linkedin.com/in/daniel-mullins24/
    GitHub          : https://github.com/dannym32
    Date Created    : 2026-04-13
    Last Modified   : 2026-04-13
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-UC-000215

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
$path    = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0'
$name    = 'NTLMMinClientSec'
$desired = 0x20080000  # 537395200

# Ensure the key exists, then set the required DWORD exactly as the STIG specifies.
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name $name -PropertyType DWord -Value $desired -Force | Out-Null
