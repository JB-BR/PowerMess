# Source  https://stackoverflow.com/questions/39800481/display-all-environment-variables-from-a-running-powershell-script
gci env:* | sort-object name