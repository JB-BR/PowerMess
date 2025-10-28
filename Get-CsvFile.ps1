# Lists CSV files in the current directory and prompts user to select one. Then, display teh selected file first line.

# Get all files with a CSV extension in the current directory
$csvFiles = Get-ChildItem -Path . -Filter *.csv

# Handle error case: no files with a CSV extension are found
if (-not $csvFiles) {
    Write-Host "No CSV files found in the current directory." -ForegroundColor Red
    exit
}

# Display files in a ordered list
Write-Host "Select a CSV file to view the first line:`n"
$csvFiles | ForEach-Object -Begin { $list_position = 1 } { 
    "{0}. {1}" -f $list_position, $_.Name 
    $list_position++
} | Out-Host

# Prompt user for selection
$choice = Read-Host "Enter file number (1-$($csvFiles.Count))"

if ($choice -match '^\d+$' -and $choice -ge 1 -and $choice -le $csvFiles.Count) {
    $selected = $csvFiles[$choice - 1].FullName
    Write-Host "`nFirst line of '$($csvFiles[$choice - 1].Name)':`n" -ForegroundColor Cyan
    Get-Content -Path $selected -TotalCount 1
} else { # Handle error case: the selected value matches no file
    Write-Host "File n°$choice not found." -ForegroundColor Yellow
}
