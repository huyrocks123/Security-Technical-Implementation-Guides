<#
.SYNOPSIS
This PowerShell script ensures that 'EccCurves' is set to include 'NistP384' and 'NistP256' in the correct order under SSL Configuration registry settings.


.NOTES
    Author          : Huy Tang
    LinkedIn        : linkedin.com/in/huy-t-892a51317/
    GitHub          : github.com/huyrocks123
    Date Created    : 2025-05-24
    Last Modified   : 2025-05-24
    Version         : 1.3
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000052

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run as Administrator
    PS C:\> .\WN10-CC-000052.ps1 
#>

# Define registry path and value
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002"
$valueName = "EccCurves"
$desiredValue = @("NistP384", "NistP256")

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# If value doesn't exist, create it as REG_MULTI_SZ
if (-not (Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue)) {
    New-ItemProperty -Path $regPath -Name $valueName -PropertyType MultiString -Value $desiredValue -Force | Out-Null
} else {
    # Overwrite existing value
    Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue
}

# Output success message
Write-Host "'$valueName' has been successfully set to: $($desiredValue -join ', ') as required."
