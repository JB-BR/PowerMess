<# 
When installing PowerCli, you may encouter this error: 

PackageManagement\Install-Package : The following commands are already available on this
system:'Export-VM,Get-VM,Get-VMHost,Move-VM,New-VM,Remove-VM,Restart-VM,Set-VM,Set-VMHost,Start-VM,Stop-VM,Suspend-VM'. This module

This is because the Hyper-V module is already installed and both VMWare and Hyper-V PowerShell modules contain functions with the same name: Export-VM,Get-VM,Get-VMHost,Move-VM,New-VM,Remove-VM,Restart-VM,Set-VM,Set-VMHost,Start-VM,Stop-VM,Suspend-VM

To solve this issue, you can use the "AllowClobber" and import the VMWare module even if there are conflicting commands. The last module imported will be executed, the. 

I means, after installing the VMWare Module, "Get-VM" will be for VMWare. To use the hyper-V variant, you will have to precise the module name: "Get-Command Hyper-V\Get-VM"

https://pkisharp.github.io/ACMESharp-docs/Why-AllowClobber.html
https://orelfichman.com/blog/dealing-with-conflicting-powershell-cmdlets
#>
Install-Module -Name VCF.PowerCLI -AllowClobber


Get-Command Hyper-V\Get-VM
Get-Command VMware.VimAutomation.Core\Get-VM