#export JAVA_HOME="/u01/java/latest"
#export CATALINA_HOME="/u01/tomcat/latest"
#export CATALINA_BASE="/u01/config/instance1"
#export JAVA_SOFTWARE="OpenJDK11U-jdk_x64_linux_hotspot_11.0.8_10.tar.gz"
#export TOMCAT_SOFTWARE="apache-tomcat-9.0.37.tar.gz"
#export SOFTWARE_DIR="/u01/software"
#export SCRIPTS_DIR=/root/scripts
#export CATALINA_HOME="/u01/tomcat/latest"
#export CATALINA_BASE="/u01/config/instance1"
sudo sh /u01/software/setEnv.sh

mkdir -p /u01/java
cd /u01/java/
tar -xzf /u01/software/OpenJDK11U-jdk_x64_linux_hotspot_11.0.8_10.tar.gz
TEMP_FILE=`ls`
ln -s ${TEMP_FILE} latest


# Tomcat
mkdir -p /u01/tomcat
cd /u01/tomcat
tar -xzf /u01/software/apache-tomcat-9.0.37.tar.gz
TEMP_FILE=`ls`
ln -s ${TEMP_FILE} latest


# CATALINA_BASE
mkdir -p /u01/config/instance1
cp -r /u01/tomcat/latest/conf /u01/config/instance1
cp -r /u01/tomcat/latest/logs /u01/config/instance1
cp -r /u01/tomcat/latest/temp /u01/config/instance1
cp -r /u01/tomcat/latest/webapps /u01/config/instance1
cp -r /u01/tomcat/latest/work /u01/config/instance1

# Copy tomcat users xml
cp -r /u01/software/tomcat-users.xml /u01/config/instance1/conf/