<#
.SYNOPSIS
    This PowerShell fix enforces WN11-SO-000250 by ensuring the UAC policy registry path exists and then setting ConsentPromptBehaviorAdmin (REG_DWORD) to 2. That configuration makes Windows prompt administrators for consent on the secure desktop whenever an elevation is requested, reducing the risk of spoofed or tampered UAC prompts and helping prevent unauthorized privilege elevation.


.NOTES
    Author          : Daniel Mullins
    LinkedIn        : https://www.linkedin.com/in/daniel-mullins24/
    GitHub          : https://github.com/dannym32
    Date Created    : 2026-04-14
    Last Modified   : 2026-04-14
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000250

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

$path = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'
$name = 'ConsentPromptBehaviorAdmin'

# Ensure the key exists, then set "Prompt for consent on the secure desktop" (2)
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name $name -PropertyType DWord -Value 2 -Force | Out-Null
