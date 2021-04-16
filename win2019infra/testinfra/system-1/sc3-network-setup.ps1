Remove-NetIPAddress –IPAddress 172.16.1.10  -confirm:$false
#Remove-NetIPAddress –IPAddress 192.168.1.120  

New-NetIPAddress –InterfaceAlias 'Ethernet 2' -AddressFamily IPv4 -IPAddress 172.16.1.10 -PrefixLength 24 -Defaultgateway 172.16.1.0

#New-NetIPAddress –InterfaceAlias 'Ethernet 3' -AddressFamily IPv4 -IPAddress 192.168.1.120 -PrefixLength 24 
#New-NetIPAddress –InterfaceAlias 'Ethernet 3' -AddressFamily IPv4 -IPAddress 192.168.56.180 -PrefixLength 24 -Defaultgateway 



