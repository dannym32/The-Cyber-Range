 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Daniel Mullins
    LinkedIn        : linkedin.com/in/joshmadakor/
    GitHub          : github.com/joshmadakor1
    Date Created    : 2026-04-13
    Last Modified   : 2026-04-13
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000500.ps1 
#>

# Policy registry key for Application event log; ensures setting is enforced via HKLM Policies
$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Create the key if missing (silent)
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Set MaxSize to 0x8000 = 32768 KB (32 MB) per STIG; overwrite if exists (silent)
New-ItemProperty -Path $path -Name "MaxSize" -PropertyType DWord -Value 0x00008000 -Force | Out-Null
 
