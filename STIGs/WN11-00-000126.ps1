#
.SYNOPSIS
    The PowerShell fix remediates STIG WN11-00-000126 by blocking consumer Microsoft account authentication through a direct registry change. It creates or updates the DisableUserAuth value under HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount as a REG_DWORD set to 1, which is the exact configuration required by the STIG. This produces the same result as enabling the Group Policy setting for blocking all consumer Microsoft account user authentication, but applies it through script for faster and repeatable enforcement. The fix is appropriate for standalone remediation, though centrally managed Group Policy or Intune settings may later overwrite it.


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
$path = 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount'
$name = 'DisableUserAuth'
$value = 1

New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name $name -PropertyType DWord -Value $value -Force | Out-Null
