echo "******************************************************************************"
echo "Setup Start." `date`
echo "******************************************************************************"

. /vagrant_config/install.env

# Stop NetworkManager altering the /etc/resolve.conf contents.
#grep "NETCONFIG_DNS_POLICY" /etc/sysconfig/network/config
#sed -i -e "s|\[main\]|\[main\]\ndns=none|g" /etc/NetworkManager/NetworkManager.conf
#sed -i -e "'s/NETCONFIG_DNS_POLICY="auto"/NETCONFIG_DNS_POLICY=''/g'" /etc/sysconfig/network/config
sed -i -e "'s/NETCONFIG_DNS_POLICY="auto"/NETCONFIG_DNS_POLICY=" "/g'" /etc/sysconfig/network/config
 
echo "******************************************************************************"
echo "Prepare yum with the latest repos." `date`
echo "******************************************************************************"
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

#systemctl restart NetworkManager.service
systemctl enable systemd-networkd
systemctl restart systemd-networkd

sh /vagrant_scripts/configure_hosts_base.sh

echo "******************************************************************************"
echo "Check Firewall Status" `date`
echo "******************************************************************************"
#systemctl stop firewalld
#systemctl disable firewalld
systemctl is-enabled firewalld
echo "******************************************************************************"
echo "Install dnsmasq." `date`
echo "******************************************************************************"
zypper install -y dnsmasq
systemctl enable dnsmasq
systemctl restart dnsmasq

#other relevant packages 
zypper install -y vim
#zypper install -y bc    
zypper install -y binutils
zypper install -y bind-utils

# install man pages 
zypper install -y man-pages

echo "******************************************************************************"
echo "Setup End." `date`
echo "******************************************************************************"
