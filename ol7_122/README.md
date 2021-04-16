# Oracle DB Install
* I've modified the scripts to install just Oracle DB 12.2 on Oracle 7
* This whole ol7_122 is a clone from "oraclebase" git clone

[oraclebase] https://github.com/oraclebase/vagrant/tree/master/database/ol7_122/scripts

A simple Vagrant build for Oracle Database 12.2 on Oracle Linux 7.

# Required Software

* [Vagrant](https://www.vagrantup.com/downloads.html)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Oracle-Database Downloads
* (https://www.oracle.com/technetwork/database/enterprise-edition/downloads/oracle12c-linux-12201-3608234.html)

* [Oracle SQLcl](https://www.oracle.com/tools/downloads/sqlcl-downloads.html)

# Optional for later installation if wished 
* [Oracle Application Express (APEX)](https://www.oracle.com/tools/downloads/apex-downloads.html)
* [OpenJDK 11](https://adoptopenjdk.net/releases.html?variant=openjdk11&jvmVariant=hotspot#x64_linux)
* [Tomcat 9](https://tomcat.apache.org/download-90.cgi)

Place the Oracle database software in the "software" directory before calling the `vagrant up` command.

Directory contents when software is included, in case of my modification.

```
$ tree
.
+--- README.md
+--- scripts
|   +--- dbora.service
|   +--- install_os_packages.sh
|   +--- oracle_create_database.sh
|   +--- oracle_service_setup.sh
|   +--- oracle_software_installation.sh
|   +--- oracle_user_environment_setup.sh
|   +--- prepare_disks.sh
|   +--- root_setup.sh
|   +--- setup.sh

+--- software
|   +--- linuxx64_12201_database.zip
|   +--- sqlcl-20.2.0.174.1557.zip
|   +--- put_software_here.txt

+--- Optional software for later installation
|   +--- apache-tomcat-9.0.37.tar.gz 
|   +--- apex_20.1_en.zip
|   +--- OpenJDK11U-jdk_x64_linux_hotspot_11.0.8_10.tar.gz
|   +--- ords-20.2.0.178.1804.zip


+--- Vagrantfile
$
```
