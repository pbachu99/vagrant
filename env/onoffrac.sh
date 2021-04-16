#############################################################
# This script starts and stops the entire RAC Cluster Nodes #
#############################################################
# NOTE: Change the directory path names as suitable on your system
# NOTE: in my case the RAC is installed under D Drive on Windows

# usage: on and off with script name 
# to START RAC use sh script_name.sh on  and STOP RAC sh script_name.sh off 
case "${1}" in
on)
echo "########################"
echo "Starting RAC Cluster"
echo '########################'

dns_dir='cd /d/git/vagrant/rac/dns/'
echo "########################"
echo "Starting RAC DNS Server" 
echo "########################"
dns_start='vagrant up'
$dns_dir ; $dns_start

# if exit status is 0 start node2
node2_dir='cd /d/git/vagrant/rac/node2/'
node2_start='vagrant up'
echo "########################"
echo "Starting RAC Node2"
echo "########################"
$node2_dir ; $node2_start

# if exit status is 0 start node1
node1_dir='cd /d/git/vagrant/rac/node1/'
node1_start='vagrant up'
echo "########################"
echo "Starting RAC Node1"
echo "########################"
$node1_dir ; $node1_start
;;

######## RAC shutdown part of script #######
off)
echo "########################"
echo "Stopping RAC Cluster."
echo "########################"

node2_dir='cd /d/git/vagrant/rac/node2/'
node2_start='vagrant halt'
echo "########################"
echo "Stopping RAC Node2"
echo "########################"
$node2_dir ; $node2_start

# if exit status is 0 stop node1
node1_dir='cd /d/git/vagrant/rac/node1/'
node1_start='vagrant halt'
echo "########################"
echo "Stopping RAC Node1"
echo "########################"
$node1_dir ; $node1_start

# if exit status is 0 stop dns
dns_dir='cd /d/git/vagrant/rac/dns/'
dns_start='vagrant halt'
echo "########################"
echo "Stopping DNS Server"
echo "########################"
$dns_dir ; $dns_start
;;

  *)
    echo 'Supply a valid option.' >&2
    exit 1
    ;;
esac


