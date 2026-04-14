#
.SYNOPSIS
    The PowerShell fix directly configures the Windows registry value required by STIG WN11-SO-000167 to restrict remote Security Account Manager access to Administrators only. It writes the RestrictRemoteSAM value under HKLM:\SYSTEM\CurrentControlSet\Control\Lsa as a REG_SZ string with the exact security descriptor O:BAG:BAD:(A;;RC;;;BA). This is the same setting enforced through Local Security Policy under “Network access: Restrict clients allowed to make remote calls to SAM,” but applied through script instead of the GUI. The result is a faster, repeatable, and STIG-aligned remediation method.


.NOTES
    Author          : Daniel Mullins
    LinkedIn        : https://www.linkedin.com/in/daniel-mullins24/
    GitHub          : https://github.com/dannym32
    Date Created    : 2026-04-14
    Last Modified   : 2026-04-14
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000167

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

$path = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa'
$name = 'RestrictRemoteSAM'
$desired = 'O:BAG:BAD:(A;;RC;;;BA)'

New-ItemProperty -Path $path -Name $name -PropertyType String -Value $desired -Force | Out-Null
