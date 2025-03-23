<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Huy Tang
    LinkedIn        : https://www.linkedin.com/in/huy-t-892a51317/
    GitHub          : github.com/huyrocks123
    Date Created    : 2025-03-22
    Last Modified   : 2025-03-22
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# Define the registry path and value
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$ValueName = "MaxSize"
$ValueData = 0x8000  # 0x8000 is equivalent to dword:00008000

# Check if the registry path exists, if not, create it
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog" -Name "Application" -Force
}

# Set the registry value
New-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force

# Confirm the change
Write-Host "Registry key for MaxSize has been set to $ValueData"
