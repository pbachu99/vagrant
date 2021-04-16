echo "******************************************************************************"
echo "Postgres Repo Setup" `date`
echo "******************************************************************************"

yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

echo "******************************************************************************"
echo "Postgres 12 Setup and configure"
echo "******************************************************************************"

yum install -y postgresql12
yum install -y postgresql12-contrib
yum install -y postgresql12-libs
yum install -y postgresql12-server
yum install -y postgresql-devel

/usr/pgsql-12/bin/postgresql-12-setup initdb
systemctl enable postgresql-12
systemctl start postgresql-12
systemctl status postgresql-12

/usr/pgsql-12/bin/postgres -V
systemctl is-enabled postgresql-12


#echo "******************************************************************************"
#echo "Postgres 13 Setup and configure"
#echo "******************************************************************************"
#yum install -y postgresql13
#yum install -y postgresql13-contrib
#yum install -y postgresql13-libs
#yum install -y postgresql13-server
#yum install -y postgresql-devel
#
#/usr/pgsql-13/bin/postgresql-13-setup initdb
#systemctl enable postgresql-13
#systemctl start postgresql-13
#systemctl status postgresql-13

#/usr/pgsql-13/bin/postgres -V
#systemctl is-enabled postgresql-13

# add a test Postgres user
useradd pgguy
#sudo bash -c 'sh /vagrant/scripts/test_setup.sh'
