<#
.SYNOPSIS
This PowerShell script ensures the 'HardenedPaths' registry values for \\*\NETLOGON and \\*\SYSVOL are properly configured for mutual authentication and integrity under domain-joined systems.

.NOTES
    Author          : Huy Tang
    LinkedIn        : linkedin.com/in/huy-t-892a51317/
    GitHub          : github.com/huyrocks123
    Date Created    : 2025-05-24
    Last Modified   : 2025-05-24
    Version         : 1.0
    STIG-ID         : WN10-CC-000050

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run as Administrator  
    PS C:\> .\WN10-CC-000050.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths"
$desiredValue = "RequireMutualAuthentication=1, RequireIntegrity=1"

# Ensure the registry path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set required values
Set-ItemProperty -Path $regPath -Name "\\*\NETLOGON" -Value $desiredValue -Type String
Set-ItemProperty -Path $regPath -Name "\\*\SYSVOL"   -Value $desiredValue -Type String

# Output success message
Write-Host "Hardened path values for '\\*\NETLOGON' and '\\*\SYSVOL' have been successfully set as required."
