echo "******************************************************************************"
echo "Postgres 13 and EPEL Repo Setup" `date`
echo "******************************************************************************"
echo "192.168.1.108 	pgres-sys 	pgres-sys" | tee -a /etc/hosts
hostnamectl set-hostname pgres-sys
dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
dnf -qy module disable postgresql
dnf install epel-release -y
dnf install -y wget unzip

sudo bash -c 'sh /vagrant/scripts/postgre13_setup.sh'
#sudo bash -c 'sh /vagrant/scripts/postgre12_setup.sh'




