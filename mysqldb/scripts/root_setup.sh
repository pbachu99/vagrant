sudo mkdir -p /root/software/
sudo mkdir -p /root/scripts/
sudo cp -f /vagrant/software/* /root/software/
sudo cp -f /vagrant/scripts/* /root/scripts/
chmod 775 /root/software/*
chmod 775 /root/scripts/*

ls -l /root/software/mysql80-community-release-el7-3.noarch.rpm
sudo bash -c 'sh /root/scripts/install_key.sh'
