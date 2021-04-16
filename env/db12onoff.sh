#############################################################
# This script starts and stops the 12DB Server              #
#############################################################
# NOTE: Change the directory path names as suitable on your system
# NOTE: in my case the DB Server installed under D Drive on Windows

# usage: on and off with script name 
# to START DB Server use sh script_name.sh on  and STOP DB Server sh script_name.sh off 
case "${1}" in
on)
echo "################################"
echo "Starting Oracle 12 Node Server"
echo '################################'

db12_dir='cd /d/git/vagrant/ol7_122/'
db12_start='vagrant up'
$db12_dir ; $db12_start
;;
######## shutdown part of script #######
off)
echo "##############################"
echo 'Stoping Oracle 12 Node Server'
echo "##############################"

db12_dir='cd /d/git/vagrant/ol7_122/'
db12_stop='vagrant halt'
$db12_dir ; $db12_stop
;;

  *)
    echo 'Supply a valid option.' >&2
    exit 1
    ;;
esac

