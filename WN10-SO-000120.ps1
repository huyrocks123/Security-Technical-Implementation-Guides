<#
.SYNOPSIS
This PowerShell script ensures the 'RequireSecuritySignature' registry value is set to 1 under the 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters' key.

.NOTES
    Author          : Huy Tang
    LinkedIn        : linkedin.com/in/huy-t-892a51317/
    GitHub          : github.com/huyrocks123
    Date Created    : 2025-05-24
    Last Modified   : 2025-05-24
    Version         : 1.0
    STIG-ID         : WN10-SO-000120

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run as Administrator
    PS C:\> .\WN10-SO-000120.ps1
#>

# Define registry path and required setting
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters"
$valueName = "RequireSecuritySignature"
$desiredValue = 1

# Create the key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type DWord

# Output success message
Write-Host "'$valueName' has been successfully set to '$desiredValue' as required."
