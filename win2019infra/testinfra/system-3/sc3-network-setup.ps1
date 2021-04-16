Remove-NetIPAddress –IPAddress 172.16.1.21 -confirm:$false
Remove-NetIPAddress –IPAddress 192.168.56.182 -confirm:$false
New-NetIPAddress –InterfaceAlias 'Ethernet 2' -AddressFamily IPv4 -IPAddress 172.16.1.21 -PrefixLength 24 -Defaultgateway 172.16.1.0
New-NetIPAddress –InterfaceAlias 'Ethernet 3' -AddressFamily IPv4 -IPAddress 192.168.56.182 -PrefixLength 24 -Defaultgateway 192.168.56.1
New-NetIPAddress –InterfaceAlias 'Ethernet 4' -AddressFamily IPv4 -IPAddress 192.168.56.182 -PrefixLength 24 
