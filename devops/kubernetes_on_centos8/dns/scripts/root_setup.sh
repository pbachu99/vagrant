echo "******************************************************************************"
echo "Setup Start." `date`
echo "******************************************************************************"

. /vagrant_config/install.env

echo "******************************************************************************"
echo "Prepare yum with the latest repos." `date`
echo "******************************************************************************"
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# Stop NetworkManager altering the /etc/resolve.conf contents.
sed -i -e "s|\[main\]|\[main\]\ndns=none|g" /etc/NetworkManager/NetworkManager.conf
systemctl restart NetworkManager.service

sh /vagrant_scripts/configure_hosts_base.sh
#sh /vagrant_scripts/configure_hosts_scan.sh

echo "******************************************************************************"
echo "Firewall." `date`
echo "******************************************************************************"
systemctl stop firewalld
systemctl disable firewalld

echo "******************************************************************************"
echo "Install dnsmasq." `date`
echo "******************************************************************************"
yum install -y dnsmasq
systemctl enable dnsmasq
systemctl restart dnsmasq

#other packages relevant to dns
#dnf install -y bc    
dnf install -y binutils*
dnf install -y bind-utils*

echo "******************************************************************************"
echo "Setup End." `date`
echo "******************************************************************************"
