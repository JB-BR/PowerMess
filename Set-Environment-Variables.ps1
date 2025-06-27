# Set a persistent envrionment variable for the user
# 1. variable_name  : The name of the environment variable to be used in scripts
# 2. variable_value : The actual value of the variable, for example an API key
# 3. variable_scope : Where is the variable stored and who can access it?
#        - "User" : Windows registry under current user's profile
#        - "Process" : Variable exists only in the current PowerShell session
# [Environment]::SetEnvironmentVariable("variable_name","variable_value","variable_scope")
[Environment]::SetEnvironmentVariable("variable_name","variable_value","Process")

# Usage
$apiKey = $env:variable_name

# Display the API key
$apiKey