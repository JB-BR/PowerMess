$vcenterCred = Get-Credential -Message "Enter vCenter credentials"
$vmCred = Get-Credential -Message "Enter target VM credentials"
$VIServer = Read-Host "Enter target vCenter"
$VMName = Read-Host "Enter target VM name"
$command = Read-Host "Enter the command to executed in the VM" 

VMware.VimAutomation.Core\Connect-VIServer -Server $VIServer -Credential $vcenterCred -ErrorAction Stop -Force
$vm = VMware.VimAutomation.Core\Get-VM -Name $VMName
$result = VMware.VimAutomation.Core\Invoke-VMScript -VM $vm -ScriptText $command -GuestCredential $vmCred -ErrorAction Stop
$result.ScriptOutput