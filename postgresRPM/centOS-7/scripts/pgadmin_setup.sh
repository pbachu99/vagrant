echo "******************************************************************************"
echo "Pgadmin Setup and configure"
echo "******************************************************************************"
yum install -y httpd 
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

yum install -y epel-release yum-utils
yum install -y  http://rpms.remirepo.net/enterprise/remi-release-7.rpm
# https://linuxize.com/post/install-php-7-on-centos-7/
yum-config-manager --enable remi-php73

#yum install php php-common php-opcache php

yum install -y php 
yum install -y phpPgAdmin php-pgsql 
yum install -y php-mbstring
#
#wget https://github.com/phppgadmin/phppgadmin/releases/tag/REL_7-13-0/phpPgAdmin-7.13.0.tar.gz
#wget https://github.com/phppgadmin/phppgadmin/releases/tag/REL_7-13-0/phpPgAdmin-7.13.0.zip

# some settings in phppgadmin
sed -i -e "s/$conf['servers'][0]['host'] = ''/$conf['servers'][0]['host'] = 'localhost'/g" /etc/phpPgAdmin/config.inc.php  

#can be changed to other place, for example
#$conf['servers'][0]['pg_dump_path'] = '/opt/postgresql/bin/pg_dump';
#$conf['servers'][0]['pg_dumpall_path'] = '/opt/postgresql95/pg_dumpall'; 
sed -i -e "s/$conf['extra_login_security'] = true;/$conf['extra_login_security'] = false;/g" /etc/phpPgAdmin/config.inc.php

echo "host 	all 	all 	10.0.0.0/24 	md5" >> /var/lib/pgsql/12/data/pg_hba.conf
echo "host 	all 	all 	192.168.1.108/24 	md5" >> /var/lib/pgsql/12/data/pg_hba.conf

echo "host 	all 	all 	10.0.0.0/24 	md5" >> /var/lib/pgsql/13/data/pg_hba.conf
echo "host 	all 	all 	192.168.1.108/24 	md5" >> /var/lib/pgsql/13/data/pg_hba.conf

systemctl restart postgresql-12
systemctl restart postgresql-13
systemctl restart httpd
echo "******************************************************************************"
echo "Add this line to"
echo "vi /etc/httpd/conf.d/phpPgAdmin.conf " 
echo "line under line number 12 --> Require all granted "
echo "line under line number 19 --> Allow from 192.168.1.108" 
echo "systemctl restart httpd "
echo "******************************************************************************"
echo "Login to http://192.168.1.108/phpPgAdmin/"
