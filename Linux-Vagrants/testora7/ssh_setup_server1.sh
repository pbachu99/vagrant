echo '192.168.1.181	server11 server11' | sudo tee -a /etc/hosts
echo '192.168.1.182	server12 server12' | sudo tee -a /etc/hosts

echo 'PubkeyAuthentication yes' | sudo tee -a /etc/ssh/sshd_config
echo 'PasswordAuthentication yes' | sudo tee -a /etc/ssh/sshd_config

echo 'PasswordAuthentication yes' | sudo tee -a /etc/ssh/ssh_config
echo 'Port 22' | sudo tee -a /etc/ssh/ssh_config

systemctl restart sshd.service

cat /dev/zero | ssh-keygen -t dsa -q -N "" > /dev/null
cat /root/.ssh/id_dsa.pub >> /root/.ssh/authorized_keys

echo 'vagrant' | sudo tee -a > /tmp/vagpwd.txt
ssh-keyscan -H ${HOSTNAME} >> /root/.ssh/known_hosts

#ping -c 3 server11
#ssh server11