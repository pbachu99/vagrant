### Ansible Setup ###

# precheck: Docker installed already
sudo yum install -y python3 python-devel python3-devel git gcc

# For python-pip we setup EPEL repository
# we also install docker compose
sudo yum install epel-release -y
sudo yum install python-pip -y 
sudo yum install ansible -y
sudo yum install docker-compose -y

# checks 
sudo ansible --version
sudo docker-compose -v
sudo pip --version

# upgrade the python pip libraries
pip install --upgrade pip 
sudo pip --version
sudo ansible-playbook --version

# we add a docker user to perform docker activities
sudo useradd docker_user
echo "docker_user  ALL=(ALL)  NOPASSWD: /usr/bin/docker" | sudo tee -a /etc/sudoers
echo "alias docker=\"sudo /usr/bin/docker\"" | sudo tee -a /home/docker_user/.bash_profile
sudo id docker_user
# su - docker_user
#$ docker ps

