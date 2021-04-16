#Enabling MySQL 8 in case MySQL 5.7 exists
sudo yum-config-manager --disable mysql57-community
sudo yum-config-manager --enable mysql80-community

echo "Installing MySQL 8 Community Server"
sudo yum install -y mysql-community-server 

echo "Starting the MySQL Server Service"
sudo service mysqld start 

echo "Setting the MySQL Service enabled permanent "
sudo systemctl enable mysqld.service 

echo "Enabled is shown below if MySQL Service is Enabled"
sudo systemctl is-enabled mysqld.service 

echo "!!!The temporary generated password for MySQL!!!"
sudo grep 'temporary password' /var/log/mysqld.log >> /tmp/mysqlpwd
sudo more /tmp/mysqlpwd
echo "Login to server with vagrant ssh"
echo "Login to MySQL now by -> sudo mysql -uroot -p" 
echo "Issue a new password of your choice ! Something like below"
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass4!';"