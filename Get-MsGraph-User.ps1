# Install-Module Microsoft.Graph
Connect-MgGraph

$user_id = Read-Host "Enter the users e-mail address"

$user = Get-MgUser -UserId $user_id

$user 

$user | Format-List *
