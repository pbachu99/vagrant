# Primary required DevOps environment for testing and learning
* Few things are to be downloaded like plugins. The directories have information
* Such setup is generally done on Cloud platform, but we can on our PC or Laptop if enough memory available
* This configuration is with least memory allocated. We have to allocate more memory as per the need
* The Docker container requires specifically more memory
* To spin up this, 6 GB of memory used, avoiding Kubernetes etc as of now

* Setup script "devops_setup.sh" is there for quick setup of this environment
* directories under vagrant is devops folder
ll /d/git/vagrant/devops 
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

# Some information picked from 
* [DevOps useful]https://github.com/yankils/Simple-DevOps-Project
* They have course for this, which helps 