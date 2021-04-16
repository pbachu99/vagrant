##############################################################
# This script starts and stops the 19 Dataguard Node Servers # 
##############################################################
# NOTE: Change the directory path names as suitable on your system
# NOTE: in my case it was installed under D Drive on Windows

# usage: on and off with script name 
# to START Server use sh script_name.sh on  and STOP Server sh script_name.sh off 
case "${1}" in
on)
echo "#####################################"
echo "Starting Oracle 19 Dataguard Nodes"
echo "#####################################"
echo "Starting Oracle 19 Dataguard Primary Server"
dg_19dir='cd /d/git/vagrant/ol7_19_dg/dataguard/node1/'
dg_start='vagrant up'
$dg_19dir ; $dg_start

echo "#############################################"
echo "Starting Oracle 19 Dataguard Secondary Server"
dg_19dir='cd /d/git/vagrant/ol7_19_dg/dataguard/node2/'
dg_start='vagrant up'
$dg_19dir ; $dg_start
;;
######## shutdown part of script #######
off)
echo "#####################################"
echo "Stopping Oracle 19 Dataguard Nodes"
echo "#############################################"
echo "Stopping Oracle 19 Dataguard Secondary Server"
dg_19dir='cd /d/git/vagrant/ol7_19_dg/dataguard/node2/'
dg_stop='vagrant halt'
$dg_19dir ; $dg_stop

echo "Stopping Oracle 19 Dataguard Primary Server"
dg_19dir='cd /d/git/vagrant/ol7_19_dg/dataguard/node1/'
dg_stop='vagrant halt'
$dg_19dir ; $dg_stop
;;

  *)
    echo 'Supply a valid option.' >&2
    exit 1
    ;;
esac

