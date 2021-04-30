#############################################################
# This script installs / starts Kubernetes systems          #
#############################################################

# NOTE: change the directory path names as suitable on your system
# NOTE: in my case the vagrant installed under D Drive on Windows

# usage:  
# to start individual-> sh kube_setup.sh dns or node1 or node2 or node3
# Or to start all in a one go then type on the command line
# sh kube_setup.sh dns && sh kube_setup.sh node1 && sh kube_setup.sh node2 && sh kube_setup.sh node3

case "${1}" in
dns)
echo "#######################################################"
echo " start DNS "
echo "#######################################################"

var_dir='cd /d/git/vagrant/devops/kubernetes/dns/'
var_start='vagrant up'
$var_dir ; $var_start
;;

node1)
echo "#######################################################"
echo "# start Node1 of Kubernetes "
echo "#######################################################"

var_dir='cd /d/git/vagrant/devops/kubernetes/node1/'
var_start='vagrant up'
$var_dir ; $var_start
;;

node2)
echo "#######################################################"
echo "# start Node2 of Kubernetes "
echo "#######################################################"

var_dir='cd /d/git/vagrant/devops/kubernetes/node2/'
var_start='vagrant up'
$var_dir ; $var_start
;;

node3)
echo "#######################################################"
echo "# start Node3 of Kubernetes "
echo "#######################################################"

var_dir='cd /d/git/vagrant/devops/kubernetes/node3/'
var_start='vagrant up'
$var_dir ; $var_start
;;
  *)
    echo 'Supply a valid option.' >&2
    exit 1
    ;;
esac

