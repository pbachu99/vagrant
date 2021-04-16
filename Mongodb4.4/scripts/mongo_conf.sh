###creating our mongo configuration file
sudo cat > /usr/bin/mongod.conf <<EOF
systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod.log

# Where and how to store data.
storage:
  dbPath: /u01/data/db/
  journal:
    enabled: true
#  engine:
#  wiredTiger:

# how the process runs
processManagement:
#  fork: true  # fork and run in background
  pidFilePath: /var/run/mongodb/mongod.pid  # location of pidfile
  timeZoneInfo: /usr/share/zoneinfo

# network interfaces
net:
  port: 27017
  bindIp: 0.0.0.0  
# Enter 0.0.0.0,:: to bind to all IPv4 and IPv6 addresses or, 
# alternatively, use the net.bindIpAll setting.
EOF
sudo bash -c 'sh /vagrant/scripts/configure_mongo.sh'