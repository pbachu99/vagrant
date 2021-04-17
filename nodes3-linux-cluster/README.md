# we spin up 3 Nodes of Oracle Linux 8 Servers in this setup
* vagrant script files copied from 'oraclebase' repo. It is his work!  
* modified them to spin up 3 nodes of Oracle Linux 8.2  
* in this setup the SSH between servers configured
* passwords are stored in the install.env file of 'config' directory
* feel free to copy / fork!

# usage
````
1) start up DNS Server
MINGW64 /d/git/vagrant/nodes3-linux-cluster/dns 
$ vagrant.exe up
Bringing machine 'default' up with 'virtualbox' provider...

2) Open 3 windows to start node1, node2 and node3 

MINGW64 /d/git/vagrant/nodes3-linux-cluster/node1 
$ vagrant.exe up

MINGW64 /d/git/vagrant/nodes3-linux-cluster/node2 
$ vagrant.exe up

MINGW64 /d/git/vagrant/nodes3-linux-cluster/node3
$ vagrant.exe up

3) verify: SSH connectivity between servers exists now

````


  
