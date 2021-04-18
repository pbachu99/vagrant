echo "******************************************************************************"
echo "Jenkins and Maven installation and setup "
echo "******************************************************************************"

# Java Installation (Java is installed via Internet)
yum install -y java-11*

## install jenkins
yum install -y wget
yum install -y wget
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum -y install jenkins*

echo "******************************************************************************"
echo "Jenkins Service check"
echo "******************************************************************************"
# by default service enabled, but not started
systemctl restart jenkins.service
systemctl is-enabled jenkins.service
systemctl status jenkins.service
# put it auto-start when server restarts
chkconfig jenkins on

# etc hosts file
echo "192.168.1.112	jenkinsbox	jenkinsbox" | sudo tee -a /etc/hosts

sudo bash -c 'sh /vagrant/scripts/maven_setup.sh'