echo "******************************************************************************"
echo "Pgadmin Setup and configure"
echo "******************************************************************************"
dnf install -y httpd 
systemctl enable httpd
rm -f /etc/httpd/conf.d/welcome.conf
cat > /var/www/html/index.html <<EOF
<html>
<body>
<div style="width: 100%; font-size: 40px; font-weight: bold; text-align: center;">
Test Page
</div>
</body>
</html> 
EOF
sed -i -e "s/#ServerName www.example.com:80/ServerName pgres-sys:80/g"  /etc/httpd/conf/httpd.conf
systemctl restart httpd

#php version 7.2 needed for pgadmin to work

dnf install -y epel-release dnf-utils
dnf install -y  http://rpms.remirepo.net/enterprise/remi-release-7.rpm
# https://linuxize.com/post/install-php-7-on-centos-7/
dnf-config-manager --enable remi-php73

#dnf install php php-common php-opcache php

dnf install -y php 
dnf install -y phpPgAdmin php-pgsql php-mbstring
#
#wget https://github.com/phppgadmin/phppgadmin/releases/tag/REL_7-13-0/phpPgAdmin-7.13.0.tar.gz
#wget https://github.com/phppgadmin/phppgadmin/releases/tag/REL_7-13-0/phpPgAdmin-7.13.0.zip

# some settings in phppgadmin
sed -i -e "s/$conf['servers'][0]['host'] = ''/$conf['servers'][0]['host'] = 'localhost'/g" /etc/phpPgAdmin/config.inc.php  

#can be changed to other place, for example
#$conf['servers'][0]['pg_dump_path'] = '/opt/postgresql/bin/pg_dump';
#$conf['servers'][0]['pg_dumpall_path'] = '/opt/postgresql95/pg_dumpall'; 
sed -i -e "s/$conf['extra_login_security'] = true;/$conf['extra_login_security'] = false;/g" /etc/phpPgAdmin/config.inc.php

#echo "host 	all 	all 	10.0.0.0/24 	md5" >> /var/lib/pgsql/12/data/pg_hba.conf
#echo "host 	all 	all 	192.168.1.108/24 	md5" >> /var/lib/pgsql/12/data/pg_hba.conf

echo "host 	all 	all 	10.0.0.0/24 	md5" >> /var/lib/pgsql/13/data/pg_hba.conf
echo "host 	all 	all 	192.168.1.108/24 	md5" >> /var/lib/pgsql/13/data/pg_hba.conf

#systemctl restart postgresql-12
systemctl restart postgresql-13

echo "******************************************************************************"
echo "Login to http://192.168.1.108/phpPgAdmin/"
echo "******************************************************************************"

mv /vagrant/scripts/phpPgAdmin.conf /etc/httpd/conf.d/phpPgAdmin.conf
systemctl restart httpd 

