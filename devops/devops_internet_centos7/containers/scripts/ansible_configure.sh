echo "******************************************************************************"
echo "Begin Ansible Setup "
echo "******************************************************************************"
# precheck is: Docker installed already
yum install -y python3 python-devel python3-devel git gcc

# For python-pip we setup EPEL repository
# we also install docker compose
yum install epel-release -y
yum install python-pip -y 
yum install ansible -y
yum install docker-compose -y

echo "******************************************************************************"
echo "Verify Ansible Setup "
echo "******************************************************************************"
ansible --version
docker-compose -v
pip --version

echo "******************************************************************************"
echo "Upgrade the python pip libraries"
echo "******************************************************************************"
pip install --upgrade pip 
pip --version
ansible-playbook --version

echo "******************************************************************************"
echo "Adding a docker user to perform docker activities"
echo "******************************************************************************"
sudo useradd docker_user
echo "docker_user  ALL=(ALL)  NOPASSWD: /usr/bin/docker" | sudo tee -a /etc/sudoers
echo "alias docker=\"sudo /usr/bin/docker\"" | sudo tee -a /home/docker_user/.bash_profile
sudo id docker_user
# su - docker_user
#$ docker ps

