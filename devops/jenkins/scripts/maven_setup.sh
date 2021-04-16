### Install & configure Maven build tool on Jenkins
# Prerequisites is Jenkins server
# Link : https://maven.apache.org/download.cgi

# Creating maven directory
sudo mkdir -p /opt/maven
cd /opt/maven/
 
# download maven 3.6 in this directory
sudo wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
sudo tar xzf apache-maven-3.6.3-bin.tar.gz

# git packages installation with all the dependencies with *
#yum install git* -y
sudo yum install git -y

# update root bash profile

echo "export JAVA_HOME=/etc/alternatives:\$PATH" | sudo tee -a /root/.bash_profile
echo "export JAVA_HOME=/etc/alternatives:/etc/alternatives/jre_11_openjdk:\$PATH" | sudo tee -a /root/.bash_profile
echo "MAVEN_HOME=/opt/maven/apache-maven-3.6.3" | sudo tee -a /root/.bash_profile
echo "export MAVEN_HOME=\$MAVEN_HOME/bin:\$JAVA_HOME" | sudo tee -a /root/.bash_profile

#java -version

# Default system generated jenkins password is
sudo more /var/lib/jenkins/secrets/initialAdminPassword
