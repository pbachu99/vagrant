# Basic DevOps environment for testing and learning
* Few things are to be downloaded like plugins. The directories have information
* Such setup is generally done on Cloud platform, but we can on our PC or Laptop if enough memory available

* In this setup, we download required software and save it (see software directory)

* This configuration is with the least memory allocated. We have to allocate more memory as per the need
* To spin up this, 6 GB of memory used, avoiding Kubernetes etc as of now

* Setup script "devops_setup.sh" is there for quick setup of this environment
* directories under vagrant is devops folder
* ll /d/git/vagrant/devops/devops_centos7/ 
```
+------------ 
+containers/
+jenkins/
+software
+tomcat/
+devops_setup.sh
+devops_stop.sh 
+Example-SSH-For-Multi-Centos.txt
+README.md     
+------------   
```
# Required Software 
* Maven 3.6.3 used 
* https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
* [OpenJDK 11](https://adoptopenjdk.net/releases.html?variant=openjdk11&jvmVariant=hotspot#x64_linux)
* For Jenkins downloaded directly from internet
* Apache Tomcat download - apache-tomcat-9.0.37.tar.gz
* VirtualBox
* Vagrant
