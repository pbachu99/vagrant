echo "******************************************************************************"
echo "Java Installation" `date`
echo "******************************************************************************"
mkdir -p /u01/software/
cp -f /soft_shared/* /u01/software/

mkdir -p /u01/java
cd /u01/java/
tar -xzf /u01/software/OpenJDK11U-jdk_x64_linux_hotspot_11.0.8_10.tar.gz
TEMP_FILE=`ls`
ln -s ${TEMP_FILE} latest
ln -s /u01/java/latest/bin/java /usr/bin/java

echo "******************************************************************************"
echo "update root bash profile" `date`
echo "******************************************************************************"
echo "export JAVA_HOME=/u01/java/latest:\$PATH" | sudo tee -a /root/.bash_profile
echo "export JAVA_HOME=/u01/java/latest/bin/java:/usr/bin/java:\$PATH" | sudo tee -a /root/.bash_profile
echo "export JAVA_SOFTWARE=/u01/software/OpenJDK11U-jdk_x64_linux_hotspot_11.0.8_10.tar.gz"| sudo tee -a /root/.bash_profile

cat > /u01/software/setEnv.sh <<EOF
. /root/.bash_profile
EOF

sudo chmod +x /u01/software/*.sh

echo "******************************************************************************"
echo "Create start/stop scripts." `date`
echo "******************************************************************************"
sh /u01/software/setEnv.sh

echo "******************************************************************************"
echo "installing Jenkins" `date`
echo "******************************************************************************"
sh /u01/software/setEnv.sh
yum install -y wget
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum -y install jenkins*

echo "******************************************************************************"
echo "Jenkins Service Status"
echo "******************************************************************************"
systemctl restart jenkins.service
systemctl is-enabled jenkins.service
systemctl status jenkins.service
# put it auto-start when server restarts
#chkconfig jenkins on

# etc hosts file
echo "192.168.1.112	jenkinsbox	jenkinsbox" | sudo tee -a /etc/hosts
#
sudo bash -c 'sh /vagrant/scripts/maven_setup.sh'