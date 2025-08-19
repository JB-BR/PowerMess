# Install-Module -Name MicrosoftTeams
Connect-MicrosoftTeams

$teamName = Read-Host "Enter the display name of the Team"

# We use to display name to retrive the team. Other filters are possible, kike the ID or the Mail nickname
# https://learn.microsoft.com/en-us/powershell/module/microsoftteams/get-team?view=teams-ps

$team = Get-Team -DisplayName $teamName

# We now use the team ID to terve the users member of this team
$users = Get-TeamUser -GroupID $team.GroupId

# Display the reulst
$users
