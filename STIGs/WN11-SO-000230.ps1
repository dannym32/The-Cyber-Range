#
.SYNOPSIS
    The PowerShell fix remediates STIG WN11-SO-000230 by enabling the Windows setting that requires FIPS compliant algorithms for encryption, hashing, and signing. It creates or updates the Enabled value under HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy as a REG_DWORD set to 1, which is the exact configuration required by the STIG. This applies the same result as enabling the corresponding Local Security Policy setting, but does so through script for faster, repeatable enforcement. The remediation is STIG aligned, though administrators must account for the compatibility impact, since systems with FIPS mode enabled may fail to communicate with servers or applications that do not support FIPS compliant cryptographic methods.

.NOTES
    Author          : Daniel Mullins
    LinkedIn        : https://www.linkedin.com/in/daniel-mullins24/
    GitHub          : https://github.com/dannym32
    Date Created    : 2026-04-14
    Last Modified   : 2026-04-14
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000230

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
$path = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy'
$name = 'Enabled'
$value = 1

New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name $name -PropertyType DWord -Value $value -Force | Out-Null
