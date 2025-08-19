$vcenterCred = Get-Credential -Message "Enter vCenter credentials"
$VIServer = Read-Host "Enter target vCenter"
VMware.VimAutomation.Core\Connect-VIServer -Server $VIServer -Credential $vcenterCred -ErrorAction Stop -Force
$virtualMachines = Get-VM