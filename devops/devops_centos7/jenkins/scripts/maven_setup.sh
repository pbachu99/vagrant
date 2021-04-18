echo "******************************************************************************"
echo "Install & configure Maven build tool on Jenkins"
echo "******************************************************************************"
# prerequisites is Jenkins server
# Link : https://maven.apache.org/download.cgi

sh /u01/software/setEnv.sh
# check java is set 
echo "Verify Java"
echo "******************************************************************************"
java -version

# git packages installation with all the dependencies with *
#yum install git* -y
yum install git -y

# creating Maven directory
mkdir -p /u02/maven
cp -f /u01/software/apache-maven-3.6.3-bin.tar.gz /u02/maven/
cd /u02/maven/

# download 
#wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar xzf apache-maven-3.6.3-bin.tar.gz
echo \$JAVA_HOME

# update root bash profile
echo "MAVEN_HOME=/u02/maven/apache-maven-3.6.3" | sudo tee -a /root/.bash_profile
echo "export MAVEN_HOME=\$MAVEN_HOME/bin:\$JAVA_HOME" | sudo tee -a /root/.bash_profile

# Default system generated jenkins password is
sudo more /var/lib/jenkins/secrets/initialAdminPassword
