New-NetIPAddress –InterfaceAlias 'Ethernet 2' -AddressFamily IPv4 -IPAddress 172.16.1.14 -PrefixLength 24 -Defaultgateway 172.16.1.0

New-NetIPAddress –InterfaceAlias 'Ethernet 3' -AddressFamily IPv4 -IPAddress 192.168.1.143 -PrefixLength 24 

#New-NetIPAddress –InterfaceAlias 'Ethernet 3' -AddressFamily IPv4 -IPAddress 192.168.1.143 -PrefixLength 24 -Defaultgateway 192.168.1.0

# not needed
#Remove-NetIPAddress –IPAddress 172.16.1.30 
#New-NetIPAddress –InterfaceAlias 'Ethernet 2' -AddressFamily IPv4 -IPAddress 172.16.1.30 -PrefixLength 24 -Defaultgateway 172.16.1.0
#New-NetIPAddress –InterfaceAlias 'Ethernet 3' -AddressFamily IPv4 -IPAddress 192.168.1.142 -PrefixLength 24 -Defaultgateway 192.168.1.0
