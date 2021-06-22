echo "******************************************************************************"
echo "Postgres 13 Setup and configure"
echo "******************************************************************************"
dnf install -y postgresql13
dnf install -y postgresql13-contrib
dnf install -y postgresql13-libs
dnf install -y postgresql13-server
dnf install -y postgresql-devel

/usr/pgsql-13/bin/postgresql-13-setup initdb
systemctl enable postgresql-13

sed -i -e "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /var/lib/pgsql/13/data/postgresql.conf 
sed -i -e "s/#port = 5432/port = 5432/g" /var/lib/pgsql/13/data/postgresql.conf
echo "host	all		all		10.0.0.0/24		md5 " >> /var/lib/pgsql/13/data/pg_hba.conf
echo "host	all		all		192.0.0.0/24 	md5 " >> /var/lib/pgsql/13/data/pg_hba.conf 
systemctl restart postgresql-13
#systemctl start postgresql-13
#systemctl start postgresql-12
sudo bash -c 'sh /vagrant/scripts/pgadmin_setup.sh'

