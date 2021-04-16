### Jenkins and Maven Installation and setup ###

# Java Installation
sudo yum install -y java-11*

## install jenkins
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum -y install jenkins*

# Jenkins Service setup
# by default service enabled, but not started
sudo systemctl is-enabled jenkins.service
sudo systemctl start jenkins.service
sudo systemctl status jenkins.service
# put it auto-start when server restarts
sudo chkconfig jenkins on

# etc hosts file
echo "192.168.1.112	jenkinsbox	jenkinsbox" | sudo tee -a /etc/hosts

sudo bash -c 'sh /vagrant/scripts/maven_setup.sh'