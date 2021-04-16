# Configure the DNS client server IP addresses
$DNS1 =  "172.16.1.10" 
#$DNS2 =  "8.8.8.8" 

Set-DnsClientServerAddress -InterfaceAlias 'Ethernet 2' -ServerAddresses $DNS1
#Set-DnsClientServerAddress -InterfaceAlias 'Ethernet 2' -ServerAddresses $DNS2
#Set-DnsClientServerAddress -InterfaceAlias 'Ethernet 2' -ServerAddresses ("$DNS1", "$DNS2")

