# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

# Import users from CSV
$users = Import-Csv -Path "C:\Path\To\users.csv"

# Define log file path
$logFile = "C:\Path\To\MFARevokes_$(Get-Date -Format 'yyyyMMdd_HHmm').log"

# Add header to log
Add-Content -Path $logFile -Value "`n--- MFA Revoke Session Log: $(Get-Date) ---`n"

foreach ($user in $users) {
    try {
        Write-Host "Revoking MFA session for $($user.UserPrincipalName)..." -ForegroundColor Cyan
        Revoke-MgUserSignInSession -UserId $user.UserPrincipalName
        Write-Host "✅ Revoked: $($user.UserPrincipalName)" -ForegroundColor Green

        # Log success
        $successMessage = "[$(Get-Date)] ✅ Successfully revoked MFA for $($user.UserPrincipalName)"
        Add-Content -Path $logFile -Value $successMessage
    }
    catch {
        $errorMessage = "[$(Get-Date)] ❌ Failed to revoke MFA for $($user.UserPrincipalName): $_"
        Write-Host $errorMessage -ForegroundColor Red

        # Log failure
        Add-Content -Path $logFile -Value $errorMessage
    }
}
