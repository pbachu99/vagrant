# Basic DevOps environment for testing and learning
* Few things are to be downloaded like plugins. The directories have information
* Such setup is generally done on Cloud platform, but we can on our PC or Laptop if enough memory available
* In this setup, required sofotware dowloaded directly from the Internet
* For Apache Tomcat the software downloaded (I was testing both)
* This configuration is with least memory allocated. We have to allocate more memory as per the need
* To spin up this, 6 GB of memory used, avoiding Kubernetes etc as of now

# Usage
* Setup script "devops_setup.sh" installs this environment
* directory structure 
* ll /d/git/vagrant/devops/devops_internet_centos7/
```
+------------ 
|   +containers/
|   +devops_setup.sh
|   +devops_stop.sh 
|   +Example-SSH-For-Multi-Centos.txt
|   +jenkins/
|   +README.md
|   +tomcat/    
+------------   
```
# Required Software 
* VirtualBox
* Vagrant
* [OpenJDK 11](https://adoptopenjdk.net/releases.html?variant=openjdk11&jvmVariant=hotspot#x64_linux)
* For Jenkins Java downloaded directly from internet
* For Apache Tomcat, Java dowloaded and saved in software directory
