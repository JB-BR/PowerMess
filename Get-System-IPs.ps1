# PowerShell Equivalent of the Linux 'ip addr | grep -E "\d{1,3}(\.\d{1,3}){3}"' command
ipconfig | Select-String -Pattern '\d{1,3}(\.\d{1,3}){3}' -AllMatches | ForEach-Object { $_.Matches.Value }