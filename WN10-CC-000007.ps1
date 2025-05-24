<#
.SYNOPSIS
This PowerShell script ensures that webcam access is denied by setting the 'Value' registry key to 'Deny' under the CapabilityAccessManager ConsentStore.

.NOTES
    Author          : Huy Tang
    LinkedIn        : linkedin.com/in/huy-t-892a51317/
    GitHub          : github.com/huyrocks123
    Date Created    : 2025-05-24
    Last Modified   : 2025-05-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000007

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run as Administrator
    PS C:\> .\WN10-CC-000007.ps1
#>

# Define registry path and value
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam"
$valueName = "Value"
$desiredValue = "Deny"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the registry value to Deny
Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type String

# Output success message
Write-Host "'$valueName' has been successfully set to '$desiredValue' as required."
