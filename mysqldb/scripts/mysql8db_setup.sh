#Enabling MySQL 8 in case MySQL 5.7 exists
yum-config-manager --disable mysql57-community
yum-config-manager --enable mysql80-community

echo "Installing MySQL 8 Community Server"
sudo yum install -y mysql-community-server 

echo "Starting the MySQL Server Service"
service mysqld start 

echo "Setting the MySQL Service enabled permanent "
systemctl enable mysqld.service 

echo "Enabled is shown below if MySQL Service is Enabled"
systemctl is-enabled mysqld.service 

echo "!!!The temporary generated password for MySQL!!!"
grep 'temporary password' /var/log/mysqld.log >> /tmp/mysqlpwd
more /tmp/mysqlpwd
echo "Login to server with vagrant ssh"
echo "Login to MySQL now by -> sudo mysql -uroot -p" 
echo "Issue a new password of your choice ! Something like below"
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass4!';"