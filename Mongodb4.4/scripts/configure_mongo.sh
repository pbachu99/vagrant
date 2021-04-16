#user defined setup
sudo chown mongod:mongod /usr/bin/mongod.conf
sudo chown mongod:mongod /usr/bin/mongo
sudo chown mongod:mongod /usr/bin/mongod
sudo chown mongod:mongod /usr/bin/mongos
echo "##################"
echo "starts mongod in background"
echo "###################"
sudo cat > /usr/bin/start_mongod <<EOF
sudo /usr/bin/mongod -f /usr/bin/mongod.conf --fork --nounixsocket
#--fork  #Fork server process, simply means to run mongod in background
# --directoryperdb  # Each database will be stored in a separate directory
# --nounixsocket
EOF
sudo chown mongod:mongod /usr/bin/start_mongod
sudo chmod u+x /usr/bin/start_mongod
sudo sh /usr/bin/start_mongod

echo "##############"
echo "connect to vagrant using vagrant ssh and to mongo with sudo /usr/bin/mongo"
echo "show dbs"	
echo "###############"
echo "connect with vagrant ssh and to mongo with sudo /usr/bin/mongo"
echo "After server shutdown we start Mongo with ./usr/bin/start_mongod script"
echo "###############"

#################################################################
#The service mongod is not set up. The system Created symlink 
# from 
#/etc/systemd/system/multi-user.target.wants/mongod.service 
# to
#/usr/lib/systemd/system/mongod.service
# 
#the /usr/bin/mongod.conf has to be entered in this file 
#other minor settings to be changed					
#################################################################
 