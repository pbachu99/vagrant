echo "******************************************************************************"
echo "Ansible Setup"
echo "******************************************************************************"

# precheck: Docker installed already
yum install -y python3 python-devel python3-devel git gcc

# For python-pip we setup EPEL repository
# we also install docker compose
yum install epel-release -y
yum install python-pip -y 
yum install ansible -y
yum install docker-compose -y

echo "******************************************************************************"
echo "checks -> Ansible and Docker "
echo "******************************************************************************"

sudo ansible --version
sudo docker-compose -v
sudo pip --version

# upgrade the python pip libraries
pip install --upgrade pip 
sudo pip --version
sudo ansible-playbook --version

echo "******************************************************************************"
echo "we add a docker user to perform docker activities"
echo "******************************************************************************"
sudo useradd docker_user
echo "docker_user  ALL=(ALL)  NOPASSWD: /usr/bin/docker" | sudo tee -a /etc/sudoers
echo "alias docker=\"sudo /usr/bin/docker\"" | sudo tee -a /home/docker_user/.bash_profile
sudo id docker_user
# su - docker_user
#$ docker ps

