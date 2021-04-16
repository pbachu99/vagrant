Remove-NetIPAddress –IPAddress 172.16.1.20 -confirm:$false
Remove-NetIPAddress –IPAddress 192.168.56.181 -confirm:$false
New-NetIPAddress –InterfaceAlias 'Ethernet 2' -AddressFamily IPv4 -IPAddress 172.16.1.20 -PrefixLength 24 -Defaultgateway 172.16.1.0
New-NetIPAddress –InterfaceAlias 'Ethernet 3' -AddressFamily IPv4 -IPAddress 192.168.56.181 -PrefixLength 24 -Defaultgateway 192.168.56.1
New-NetIPAddress –InterfaceAlias 'Ethernet 4' -AddressFamily IPv4 -IPAddress 192.168.56.181 -PrefixLength 24 
