* If Kubernetes Configure fails because you did not see the message on Node1'restart DNS Server etc..'
* We can fix it with the below 
* without --discovery-token-ca-cert-hash
````
# On Node 1 login as Root user and issue the below 
kubeadm config images list
kubeadm init --token "b9a9lo.7s1plbtydrpt57ex" --pod-network-cidr=192.168.56.0/24 --apiserver-advertise-address=192.168.56.110 --kubernetes-version "1.21.0"
# you will see the message it installed/configured
# issue the below 
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
export KUBECONFIG=/etc/kubernetes/admin.conf

export kubever=$(kubectl version | base64 | tr -d '\n')
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"

# on Node 2 login as Root and issue the below
kubeadm join 192.168.56.110:6443 --token "b9a9lo.7s1plbtydrpt57ex" --discovery-token-unsafe-skip-ca-verification

# on Node 3 login as Root and issue the below
kubeadm join 192.168.56.110:6443 --token "b9a9lo.7s1plbtydrpt57ex" --discovery-token-unsafe-skip-ca-verification 
````

* verify
````
# wait for few minutes until it configures completely
kubectl get nodes
kubectl get pods --all-namespaces
````
* Completes the Fix

# If you like to use hash certificate too
* using --discovery-token-ca-cert-hash based 
````
#kubeadm init --token "b9a9lo.7s1plbtydrpt57ex" --discovery-token-ca-cert-hash sha256":"d406ce58775f4c73b845e0a2c53ce5ae6eb817a90205c88ba2405812cc27a2a3" --pod-network-cidr=192.168.56.0/24 --apiserver-advertise-address=192.168.56.110 --kubernetes-version "1.21.0"
#
#kubeadm join 192.168.56.110:6443 --token "b9a9lo.7s1plbtydrpt57ex" --discovery-token-ca-cert-hash sha256"":"d406ce58775f4c73b845e0a2c53ce5ae6eb817a90205c88ba2405812cc27a2a3" 
#
#kubeadm join 192.168.56.110:6443 --token "b9a9lo.7s1plbtydrpt57ex" --discovery-token-ca-cert-hash sha256"":"d406ce58775f4c73b845e0a2c53ce5ae6eb817a90205c88ba2405812cc27a2a3" 
````