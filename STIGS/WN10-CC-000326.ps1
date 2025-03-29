<#
.SYNOPSIS
    This PowerShell script enables PowerShell script block logging to enhance security monitoring and auditing.

.NOTES
    Author          : Huy Tang
    LinkedIn        : https://www.linkedin.com/in/huy-t-892a51317/
    GitHub          : https://github.com/huyrocks123
    Date Created    : 2025-03-29
    Last Modified   : 2025-03-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000326

.TESTED ON
    Date(s) Tested  : 2025-03-29
    Tested By       : Huy Tang
    Systems Tested  : Windows 10 Pro
    PowerShell Ver. : 

.USAGE
    This script enables PowerShell script block logging by modifying the Windows registry.
    Run with administrative privileges:

    Example:
    ```
    .\Enable-ScriptBlockLogging.ps1
    ```

#>

# Define registry path for PowerShell script block logging
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
$regName = "EnableScriptBlockLogging"
$regValue = 1

# Check if the registry path exists, if not, create it
if (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the registry value to enable script block logging
Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord

# Confirm the change
Write-Output "PowerShell script block logging has been enabled."
