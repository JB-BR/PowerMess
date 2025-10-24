# Some RegEx to cleanup a CSV data (add quotes, replaces semicolon with comma, etc."
$content = Get-Content './my_csv_data.csv'
$multiline = $content -replace '^', '"'
$multiline = $multiline -replace '$', '"'
$multiline = $multiline -replace ';', '","'
$multiline = $multiline -replace ',""\[', ',"['
$multiline = $multiline -replace ']"",', ']",'
$multiline = $multiline -replace '#', ';'

$multiline | Set-Content './my_csv_datac.csv' -Encoding UTF8
