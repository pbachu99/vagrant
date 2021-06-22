echo "******************************************************************************"
echo "Postgres and EPEL Repo Setup" `date`
echo "******************************************************************************"
echo "192.168.1.108 	pgres-sys 	pgres-sys" | tee -a /etc/hosts

yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
yum install epel-release -y
yum install -y wget unzip

sudo bash -c 'sh /vagrant/scripts/postgre12_setup.sh'

#sudo bash -c 'sh /vagrant/scripts/test_setup.sh'
