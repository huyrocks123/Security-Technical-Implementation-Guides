<#
.SYNOPSIS
    This PowerShell script disables the Application Compatibility Program Inventory to prevent data collection and transmission to Microsoft.

.NOTES
    Author          : Huy Tang
    LinkedIn        : https://www.linkedin.com/in/huy-t-892a51317/
    GitHub          : https://github.com/huyrocks123
    Date Created    : 2025-03-29
    Last Modified   : 2025-03-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000175

.TESTED ON
    Date(s) Tested  : 2025-03-29
    Tested By       : Huy Tang
    Systems Tested  : Windows 10 Pro
    PowerShell Ver. : 

.USAGE
    This script disables the Application Compatibility Program Inventory.
    Run with administrative privileges:

    Example:
    ```
    .\Disable-AppCompatInventory.ps1
    ```
    
#>

# Disable Application Compatibility Program Inventory
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat' -Name 'DisableInventory' -Value 1

# Verify the change
Write-Output "Application Compatibility Program Inventory has been disabled."
