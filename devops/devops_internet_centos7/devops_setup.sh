#############################################################
# This script installs the necessary DevOps systems         #
#############################################################

# NOTE: change the directory path names as suitable on your system
# NOTE: in my case the vagrant installed under D Drive on Windows

# usage:  
# to start individual-> sh devops_setup.sh jnm or dock or tom
# Or to start all in a one go then type on the command line
# sh devops_setup.sh jnm && sh devops_setup.sh dock && sh devops_setup.sh tom

case "${1}" in
jnm)
echo "#######################################################"
echo " Installing Jenkins and Maven"
echo "#######################################################"

var_dir='cd /d/git/vagrant/devops/devops_internet_centos7/jenkins/'
var_start='vagrant up'
$var_dir ; $var_start
;;

dock)
echo "#######################################################"
echo "# Installing Docker Container and Ansible "
echo "#######################################################"

var_dir='cd /d/git/vagrant/devops/devops_internet_centos7/containers/'
var_start='vagrant up'
$var_dir ; $var_start
;;

tom)
echo "#######################################################"
echo "# Installing Apache Tomcat "
echo "#######################################################"

var_dir='cd /d/git/vagrant/devops/devops_internet_centos7/tomcat/'
var_start='vagrant up'
$var_dir ; $var_start
;;

  *)
    echo 'Supply a valid option.' >&2
    exit 1
    ;;
esac

