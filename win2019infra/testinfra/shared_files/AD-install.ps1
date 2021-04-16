#
# Windows PowerShell script for AD DS Deployment
#
# https://docs.microsoft.com/en-us/powershell/module/addsdeployment/?view=windowsserver2019-ps

# enable feature by copy & paste
#Install-windowsfeature -name AD-Domain-Services –IncludeManagementTools 
Import-Module ADDSDeployment 
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "praveen.local" `
-DomainNetbiosName "PRAVEEN" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true

