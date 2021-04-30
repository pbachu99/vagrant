modprobe br_netfilter 
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables 
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo 
dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm -y 

dnf install -y docker-ce 

systemctl enable docker.service
systemctl restart docker.service
systemctl is-enabled docker.service
#systemctl status docker.service

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

dnf install -y kubeadm 

systemctl enable kubelet.service
systemctl restart kubelet.service 
#systemctl start kubelet.service 


#on master node
#kubeadm init

#on all the systems
#swapoff -a 

#kubeadm join 10.0.2.15:6443 --token 29zh26.9nx4s0ji0pjbei8v --discovery-token-ca-cert-hash sha256:dd10d912ddf1da2001eb36abca2ee50c1116ecded7db54d4f2d9698210446f5f