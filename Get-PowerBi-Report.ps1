<#
The Power BI REST API does NOT directly return the report data in JSON. It will return metadata (report name, dataset id, etc.)
Power BI reports are built on top of datasets, and you need to query the underlying dataset to get the actual data.
#>

$ReportId     = "b4bb81de-ea17-49ef-a92f-e4fdc6fa9896"
$headers = @{
    Authorization = "Bearer eyJXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    "Content-Type" = "application/json"
    }
$apiUrl = "https://api.powerbi.com/v1.0/myorg/reports/$ReportId"

$response = Invoke-RestMethod -Method Get -Uri $apiUrl -Headers $headers
$response
$response.datasetId