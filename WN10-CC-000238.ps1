<#
.SYNOPSIS
Ensures 'PreventCertErrorOverrides' is set to 1 in compliance with Windows 10 DISA STIG.

.NOTES
    Author          : Huy Tang
    LinkedIn        : linkedin.com/in/huy-t-892a51317/
    GitHub          : github.com/huyrocks123
    Date Created    : 2025-05-24
    Last Modified   : 2025-05-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000238

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run as Administrator
    PS C:\> .\WN10-CC-000238.ps1
#>

# Define registry path and expected value
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Internet Settings"
$valueName = "PreventCertErrorOverrides"
$desiredValue = 1

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Apply the STIG-compliant registry value
Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type DWord

# Output success message
Write-Host "'PreventCertErrorOverrides' has been successfully set to $desiredValue as required"
