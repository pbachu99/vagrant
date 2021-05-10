modprobe br_netfilter 
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables 
# installing docker centos8 stable packages 
#zypper config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo 
#zypper addrepo -r https://download.docker.com/linux/centos/docker-ce.repo 
#zypper install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm -y 
#zypper install https://download.docker.com/linux/centos/8/x86_64/stable/Packages/containerd.io-1.4.4-3.1.el8.x86_64.rpm -y

zypper install -y docker-ce --nobest

systemctl enable docker.service
systemctl restart docker.service
systemctl is-enabled docker.service
#systemctl status docker.service

# as of now we do not see kubernetes EL8 on the official website
#cat > /etc/yum.repos.d/kubernetes.repo <<EOF
#[kubernetes]
#name=Kubernetes
#baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
#enabled=1
#gpgcheck=1
#repo_gpgcheck=1
#gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
#EOF

zypper install -y kubeadm 

systemctl enable kubelet.service
systemctl restart kubelet.service 


