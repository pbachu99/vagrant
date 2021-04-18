echo "******************************************************************************"
echo "Docker Container and Ansible Setup"
echo "******************************************************************************"

# set up the stable repository
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install the required dependant packages 
yum install yum-utils device-mapper-persistent-data* lvm2* zip unzip -y 

# Install the latest version of Docker CE.
yum install docker-ce -y

# Start Docker
systemctl start docker.service
# put it auto-start when server restarts
 chkconfig docker on

# IP update in etc hosts file
echo "192.168.1.113	dockerbox	dockerbox" |  tee -a /etc/hosts
#echo "192.168.1.114	ansiblebox	ansiblebox" |  tee -a /etc/hosts
	
echo "******************************************************************************"
echo "Verify that docker is installed correctly by running the hello-world image."
echo "******************************************************************************"
sudo docker ps 
sudo docker version
sudo docker info
sudo bash -c 'sh /vagrant/scripts/ansible_configure.sh'
