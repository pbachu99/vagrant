echo "******************************************************************************"
echo "Apache Tomcat Setup." `date`
echo "******************************************************************************"

mkdir -p /u01/software/
cp -f /soft_shared/* /u01/software/

cat > /u01/software/setEnv.sh <<EOF
export JAVA_HOME="/u01/java/latest"
export CATALINA_HOME="/u01/tomcat/latest"
export CATALINA_BASE="/u01/config/instance1"
export JAVA_SOFTWARE="OpenJDK11U-jdk_x64_linux_hotspot_11.0.8_10.tar.gz"
export TOMCAT_SOFTWARE="apache-tomcat-9.0.37.tar.gz"
export SOFTWARE_DIR="/u01/software"
export SCRIPTS_DIR=/root/scripts
export CATALINA_HOME="/u01/tomcat/latest"
export CATALINA_BASE="/u01/config/instance1"
EOF

echo "******************************************************************************"
echo "Add it to the .bash_profile." `date`
echo "******************************************************************************"
echo ". /u01/software/setEnv.sh" >> /root/.bash_profile
chmod +x /u01/software/*.sh

echo "******************************************************************************"
echo "Create start/stop scripts." `date`
echo "******************************************************************************"
sh /u01/software/setEnv.sh

mkdir -p /root/scripts/
cat > /root/scripts/setEnv.sh <<EOF
#!/bin/bash
. /u01/software/setEnv.sh
EOF

chmod u+x /root/scripts/*.sh

sudo bash -c 'sh /vagrant/scripts/install_apache_tomcat.sh'

