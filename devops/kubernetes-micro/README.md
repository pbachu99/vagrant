# Kubernetes Micro setup on Centos8 with a base memory of 7 GB
* Kubernetes Micro that is Snap/microk8s used in this setup 
* https://microk8s.io/
* This setup has DNS Server (dnsmasq) with 3 Nodes: 
* node1 as master and the rest two nodes are worker nodes
* This setup has no extra storage configuration at this moment

# steps to spin up 
```
On my system it is under D drive
1. Start up DNS Server 
/d/git/vagrant/devops/kubernetes-micro/dns 
$ vagrant.exe up

2. Open 3 windows to startup 3 Nodes in a go and SSH Setup configures between them
MINGW64 /d/git/vagrant/devops/kubernetes-micro/node1 

MINGW64 /d/git/vagrant/devops/kubernetes-micro/node2
$ vagrant.exe up

$ vagrant.exe up
MINGW64 /d/git/vagrant/devops/kubernetes-micro/node3 
$ vagrant.exe up

Wait for 10 Minutes and all the download and installation done 
```
* The file "micro-kubernetes-notes" has further steps for this setup