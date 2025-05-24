<#
.SYNOPSIS
This PowerShell script ensures that BitLocker requires a PIN for startup authentication on operating system drives

.NOTES
    Author          : Huy Tang
    LinkedIn        : linkedin.com/in/huy-t-892a51317/
    GitHub          : github.com/huyrocks123
    Date Created    : 2025-05-24
    Last Modified   : 2025-05-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000031

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run as Administrator
    PS C:\> .\WN10-00-000031.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

# Desired values for each registry key
$values = @{
    "UseAdvancedStartup" = 1
    "UseTPMPIN" = 1
    "UseTPMKeyPIN" = 1
}

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Apply each STIG-compliant registry value
foreach ($name in $values.Keys) {
    Set-ItemProperty -Path $regPath -Name $name -Value $values[$name] -Type DWord
    Write-Host "'$name' has been successfully set to $($values[$name]) as required"
}

# Output success message
Write-Host "All BitLocker authentication registry settings have been configured successfully."
