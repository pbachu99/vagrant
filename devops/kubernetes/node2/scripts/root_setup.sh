echo "******************************************************************************"
echo "Setup Start." `date`
echo "******************************************************************************"
useradd alladmin
. /vagrant_config/install.env

sh /vagrant_scripts/install_os_packages.sh
sh /vagrant_scripts/kube_and_docker_setup.sh

echo "******************************************************************************"
echo "Set root and alladmin password" `date`
echo "******************************************************************************"
echo -e "${ROOT_PASSWORD}\n${ROOT_PASSWORD}" | passwd
echo -e "${ALLADMIN_PASSWORD}\n${ALLADMIN_PASSWORD}" | passwd alladmin
usermod -aG vagrant alladmin

sh /vagrant_scripts/configure_hosts_base.sh
#sh /vagrant_scripts/configure_hosts_scan.sh

cat > /etc/resolv.conf <<EOF
search localdomain
nameserver ${DNS_PUBLIC_IP}
EOF

# Stop NetworkManager altering the /etc/resolve.conf contents.
sed -i -e "s|\[main\]|\[main\]\ndns=none|g" /etc/NetworkManager/NetworkManager.conf
systemctl restart NetworkManager.service

echo "******************************************************************************"
echo "Set Hostname." `date`
echo "******************************************************************************"
hostnamectl set-hostname ${NODE2_HOSTNAME}

su - alladmin -c 'sh /vagrant/scripts/alladmin_environment_setup.sh'
. /home/alladmin/scripts/setEnv.sh

echo "******************************************************************************"
echo "Passwordless SSH Setup for root." `date`
echo "******************************************************************************"
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
rm -f *
cat /dev/zero | ssh-keygen -t rsa -q -N "" > /dev/null
cat id_rsa.pub >> authorized_keys
ssh-keyscan -H ${NODE2_HOSTNAME} >> ~/.ssh/known_hosts
ssh-keyscan -H ${NODE2_FQ_HOSTNAME} >> ~/.ssh/known_hosts
ssh-keyscan -H ${NODE2_PUBLIC_IP} >> ~/.ssh/known_hosts
ssh-keyscan -H localhost >> ~/.ssh/known_hosts
chmod -R 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
ssh ${NODE2_HOSTNAME} date
echo "${ROOT_PASSWORD}" > /tmp/temp1.txt

swapoff -a 

echo "******************************************************************************"
echo "Setup End." `date`
echo "******************************************************************************"
