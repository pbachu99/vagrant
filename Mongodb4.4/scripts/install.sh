# The first step is to setup MongoDB Repository

sudo cat > /etc/yum.repos.d/mongodb-org-4.4.repo <<EOF

[mongodb-org-4.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/4.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.4.asc 
EOF

# Setting the permissions to repo
sudo chmod 644 /etc/yum.repos.d/mongodb-org-4.4.repo

# Enables the mongodb repo
sudo yum-config-manager --enable mongodb-org-4.4

#Install the MongoDB packages with an "*" so that all the relevant packages installed by default

sudo yum install -y mongodb-org*
sudo mkdir -p /u01/data/db/
sudo chmod 755 -R /u01/
sudo chown -R mongod:mongod /u01
sudo mv /etc/mongod.conf /etc/backmongoconf

sudo bash -c 'sh /vagrant/scripts/mongo_conf.sh'