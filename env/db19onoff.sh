#############################################################
# This script starts and stops the 19DB Server  #
#############################################################
# NOTE: Change the directory path names as suitable on your system
# NOTE: in my case the DB Server installed under D Drive on Windows

# usage: on and off with script name 
# to START DB Server use sh script_name.sh on  and STOP DB Server sh script_name.sh off 
case "${1}" in
on)
echo "###############################"
echo "Starting Oracle 19 Node Server"
echo '###############################'

db19_dir='cd /d/git/vagrant/ol7_19_db/'
db19_start='vagrant up'
$db19_dir ; $db19_start
;;
######## shutdown part of script #######
off)
echo "################################"
echo 'Stopping Oracle 19 Node Server'
echo "################################"

db19_dir='cd /d/git/vagrant/ol7_19_db/'
db19_stop='vagrant halt'
$db19_dir ; $db19_stop
;;

  *)
    echo 'Supply a valid option.' >&2
    exit 1
    ;;
esac

