# Get Confluence spaces and display them by name
# Documentation: https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-space/#api-spaces-get

# I am checking if the variables already exists, to be able to re-run the script several times without have to prmpte them every times
if(!$email){
  $email = Read-Host "Your username (e-mail addresse)"
}

if(!$apiToken ){
  $apiToken = Read-Host "API token"
}
if(!$domain){
  $domain = Read-Host "Your confluence domain (eg. xxx.atlassian.net)"
}

$uri = "https://"+$domain+"/wiki/api/v2/spaces"

$headers = @{
    Accept = "application/json"
}

$encodedAuth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes($email+":"+$apiToken))
$headers.Authorization = "Basic $encodedAuth"

# Old script without pagination
# $result = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers
# $result.results | ForEach-Object { $_.name }


$allNames = @()
$allResults =@()

do {
    $response = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers
    $allNames += $response.results | ForEach-Object { $_.name }
    $allResults += $response.results

    if ($response._links.next) {
        
        # START BUG FIX
        # Currenlty, the URL returned is in two parts and the path /wiki overlapps. 
        # It is present both a the beginning of $response._links.next and at the end of $response._links.base
        # Concatenating both leads to a HTTP/404 error
        # Thus, I remove /wiki from the base URL as it is already present in the next URL
        # Example: 
        <#
        PS> $result2._links

        next                                                                                                                                                                    base                                 
        ----                                                                                                                                                                    ----                                 
        /wiki/api/v2/spaces?cursor=eyJpZCI6MjIzMzQ2NzUyLCJzcGFjZVNvcnRPcmRlciI6eyJmaWVsZCI6IklEIiwiZGlyZWN0aW9uIjoiQVNDRU5ESU5HIn0sInNwYWNlU29ydE9yZGVyVmFsdWUiOjIyMzM0Njc1Mn0= https://xxxxxxxxx.atlassian.net/wiki

        #>
        
        $response._links.base = $response._links.base -replace "/wiki$", ""
        # END BUG FIX

        $uri = $response._links.base + $response._links.next

    } else {
        $uri = $null
    }
} while ($uri)

# Display all collected names
$allNames
