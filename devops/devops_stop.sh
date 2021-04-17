#####################################################
# This script stops the necessary DevOps systems    #   
#####################################################

# NOTE: Change the directory path names as suitable on your system
# NOTE: in my case the vagrant installed under D Drive on Windows

# usage:  
# to STOP  use sh devops_stop.sh jnm or dock or tom
# Or to stop all in a one go then type on command line
# sh devops_stop.sh jnm && sh devops_stop.sh dock && sh devops_stop.sh tom

case "${1}" in
jnm)
echo "#############################################"
echo " stopping Jenkins and Maven"
echo "#############################################"

var_dir='cd /d/git/vagrant/devops/jenkins/'
var_stop='vagrant halt'
$var_dir ; $var_stop
;;

dock)
echo "################################################"
echo "# stopping Docker Container and Ansible "
echo "################################################"

var_dir='cd /d/git/vagrant/devops/containers/'
var_stop='vagrant halt'
$var_dir ; $var_stop
;;

tom)
echo "#################################################"
echo "# stopping Apache Tomcat "
echo "#################################################"

var_dir='cd /d/git/vagrant/devops/tomcat/'
var_stop='vagrant halt'
$var_dir ; $var_stop
;;

  *)
    echo 'Supply a valid option.' >&2
    exit 1
    ;;
esac

