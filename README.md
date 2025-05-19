# Revoke-MFA-Tokens
The powershell script automates revoking multiple users' MFA tokens using a csv file

Prerequisites
1.  Install Microsoft Graph PowerShell SDK (if you haven’t already):

Install-Module Microsoft.Graph -Scope CurrentUser

2.  Sign in with sufficient privileges:

You need User Administrator or Global Admin role to revoke sessions.

You’ll be prompted to sign in when Connect-MgGraph runs.

-------------------------------------------------
What This Does
Revoke-MgUserSignInSession revokes refresh tokens and session cookies.

Users will be forced to reauthenticate, triggering MFA if required.

Does not delete user accounts or alter their MFA settings—just wipes active session tokens clean.

All failed revokes are logged with a timestamp, user UPN, and error details.

The log file just grows with each run — easy for audits or reviews.

It’ll also write a header timestamp every time the script runs so you can track history.

Successes: go green on console and into the log.

Failures: go red on console and into the same log.