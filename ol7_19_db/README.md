# Oracle 19c on Oracle Linux 7
* THIS IS FORKED FROM  oraclebase REPOSITORY! MODIFIED TO INSTALL JUST Oracle 19c Database
A simple Vagrant build for Oracle Database 19c on Oracle Linux 7.

## Required Software

* [Vagrant](https://www.vagrantup.com/downloads.html)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Oracle Database](https://www.oracle.com/database/technologies/oracle19c-linux-downloads.html)
* [Oracle REST Data Services (ORDS)](https://www.oracle.com/technetwork/developer-tools/rest-data-services/downloads/)
* [Oracle SQLcl](https://www.oracle.com/tools/downloads/sqlcl-downloads.html)
* [Oracle Application Express (APEX)](https://www.oracle.com/tools/downloads/apex-downloads.html)
* [OpenJDK 11](https://adoptopenjdk.net/releases.html?variant=openjdk11&jvmVariant=hotspot#x64_linux)
* [Tomcat 9](https://tomcat.apache.org/download-90.cgi)

Place the software in the "software" directory before calling the `vagrant up` command.

Directory contents when software is included.

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
|   +--- ords_software_installation.sh
|   +--- prepare_disks.sh
|   +--- root_setup.sh

+--- software

|   +--- LINUX.X64_193000_db_home.zip
|   +--- put_software_here.txt
|   +--- sqlcl-20.2.0.174.1557.zip
+--- Vagrantfile
$
```