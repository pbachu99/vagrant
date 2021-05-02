# Kubernetes setup on Centos8 with a base memory of 13 GB 
```
Note:
+ It took nearly 20 Minutes with 13 GB Memory (Each Node with 4 GB of Memory)
+ You can also spin up with 7 GB (Each Node with 2 GB of Memory), but takes time

+ This setup has token key generated and assigned for Nodes to join the Kubernetes Cluster
+ For any reason you could not start DNS Server Box once then the Kubernetes Cluster fails
+ That can be fixed without any issue. Check the file 'fix_kubernetes_cluster_setup_fails' for steps
```
* This setup has DNS Server (dnsmasq) with 3 Nodes:
* node1 as master and the rest two nodes are worker nodes

* This setup has no extra storage configuration at this moment
# Steps to spin up 
```
on my system it is under D drive
1. Start up DNS Server 
/d/git/vagrant/devops/kubernetes_on_centos8/dns 
$ vagrant up

2. Open 3 windows to startup 3 Nodes, all done in a go and SSH Setup configures between Nodes too
MINGW64 /d/git/vagrant/devops/kubernetes_on_centos8/node1 
$ vagrant up

MINGW64 /d/git/vagrant/devops/kubernetes_on_centos8/node2
$ vagrant up

$ vagrant.exe up
MINGW64 /d/git/vagrant/devops/kubernetes_on_centos8/node3 
$ vagrant up
```

# Links
* https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-init/
* see below 'Automating kubeadm' on the above link to generate token
* https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-init/#config-file
* https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-config/

* networking
* https://kubernetes.io/docs/tasks/configure-pod-container/static-pod/
* https://kubernetes.io/docs/concepts/cluster-administration/addons/
* https://kubernetes.io/docs/concepts/cluster-administration/networking/

* installing dashboard
* https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
