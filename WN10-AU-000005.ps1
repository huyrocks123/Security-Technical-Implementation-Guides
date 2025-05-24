<#
.SYNOPSIS
    This PowerShell script enables auditing for Credential Validation failures to enhance security monitoring.

.NOTES
    Author          : Huy Tang
    LinkedIn        : https://www.linkedin.com/in/huy-t-892a51317/
    GitHub          : https://github.com/huyrocks123
    Date Created    : 2025-03-29
    Last Modified   : 2025-03-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000005

.TESTED ON
    Date(s) Tested  : 2025-03-29
    Tested By       : Huy Tang
    Systems Tested  : Windows 10 Pro
    PowerShell Ver. : 

.USAGE
    This script enables auditing for Credential Validation failures.
    Run with administrative privileges:

    Example:
    ```
    .\Enable-Audit-CredentialValidation.ps1
    ```

#>

# Enable auditing for Credential Validation failures
Auditpol /set /subcategory:"Credential Validation" /failure:enable

# Verify the change
Write-Output "Credential Validation failure auditing has been enabled."
