Disable-NetAdapterBinding -Name "Ethernet" -DisplayName "Internet Protocol Version 6 (TCP/IPv6)"
Disable-NetAdapterBinding -Name "Ethernet 2" -DisplayName "Internet Protocol Version 6 (TCP/IPv6)"

# disable NAT adapter
Disable-NetAdapter -Name "Ethernet" -Confirm:$false