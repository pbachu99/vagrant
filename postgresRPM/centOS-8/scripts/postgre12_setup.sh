echo "******************************************************************************"
echo "Postgres 12 Setup and configure"
echo "******************************************************************************"

dnf install -y postgresql12
dnf install -y postgresql12-contrib
dnf install -y postgresql12-libs
dnf install -y postgresql12-server
dnf install -y postgresql-devel

/usr/pgsql-12/bin/postgresql-12-setup initdb
systemctl enable postgresql-12

sed -i -e "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /var/lib/pgsql/12/data/postgresql.conf
sed -i -e "s/#port = 5432/port = 5432/g" /var/lib/pgsql/12/data/postgresql.conf
echo "host	all		all		10.0.0.0/24		md5 " >> /var/lib/pgsql/12/data/pg_hba.conf
echo "host	all		all		192.0.0.0/24 	md5 " >> /var/lib/pgsql/12/data/pg_hba.conf

systemctl stop postgresql-12
# add a test Postgres user
useradd pgguy

#systemctl status postgresql-12
#/usr/pgsql-12/bin/postgres -V
#systemctl is-enabled postgresql-12

#sudo bash -c 'sh /vagrant/scripts/postgre13_setup.sh'
