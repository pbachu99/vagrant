# Configure the DNS client server IP addresses
$DNS1 =  "172.16.1.10" 
#$DNS2 =  "172.16.1.1" 

Set-DnsClientServerAddress -InterfaceAlias 'Ethernet 2' -ServerAddresses $DNS1
Set-DnsClientServerAddress -InterfaceAlias 'Ethernet 3' -ServerAddresses $DNS1
Set-DnsClientServerAddress -InterfaceAlias 'Ethernet 4' -ServerAddresses $DNS1
#Set-DnsClientServerAddress -InterfaceAlias 'Ethernet 2' -ServerAddresses ("$DNS1", "$DNS2")


#$DNS3 =  "192.168.1.120"
#$DNS4 =  "192.168.1.1" 
#Set-DnsClientServerAddress -InterfaceAlias 'Ethernet 3' -ServerAddresses ("$DNS3", "$DNS4")

