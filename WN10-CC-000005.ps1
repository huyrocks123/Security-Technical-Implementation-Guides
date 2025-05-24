<#
.SYNOPSIS
    This PowerShell script disables camera access from the lock screen to enhance system security and privacy.

.NOTES
    Author          : Huy Tang
    LinkedIn        : https://www.linkedin.com/in/huy-t-892a51317/
    GitHub          : https://github.com/huyrocks123
    Date Created    : 2025-03-29
    Last Modified   : 2025-03-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 2025-03-29
    Tested By       : Huy Tang
    Systems Tested  : Windows 10 Pro
    PowerShell Ver. : 

.USAGE
    This script disables camera access from the lock screen by modifying the Windows registry.
    Run with administrative privileges:

    Example:
    ```
    .\Disable-LockScreenCamera.ps1
    ```

#>

# Define the registry path and value name
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$regName = "NoLockScreenCamera"
$regValue = 1

# Check if the registry path exists, if not, create it
if (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the registry value to disable the lock screen camera
Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord

# Confirm the change
Write-Output "Camera access from the lock screen has been disabled."
