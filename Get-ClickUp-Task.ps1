$headers=@{}
$headers.Add("accept", "application/json")
$headers.Add("Authorization",$env:clickup_api_key)
$task_id = "INFRA-73841"
$team_id = $env:clickup_team_id

$uri = 'https://api.clickup.com/api/v2/task/' + $task_id + '?team_id=' + $team_id + '&include_subtasks=false&include_markdown_description=false&custom_task_ids=true'

$response = Invoke-WebRequest -Uri $uri -Method GET -Headers $headers

# https://stackoverflow.com/questions/64116642/how-to-parse-json-from-htmlwebresponseobject
$json = $response.Content
$obj = ConvertFrom-Json $json

# Let PwoerSHell decide, if the data should be displayed as a table or as a list:
$obj.custom_fields # Complex structure, PowerShell displays it as a list
$obj.list # Simple structure, PwoerShell displays it as a table

# Format as a table:
$obj.custom_fields | Format-Table

# Format as a list
$obj.list | Format-List

# Limit table columns by selecting which columns should be dispalyed
$obj.custom_fields | Format-Table name, type, type_config