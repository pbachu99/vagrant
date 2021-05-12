#echo "******************************************************************************"
#echo "Prepare repos and install base packages." `date`
#echo "******************************************************************************"
#echo "nameserver 8.8.8.8" >> /etc/resolv.conf

echo "******************************************************************************"
echo " Add extra OS packages. " `date`
echo "******************************************************************************"
zypper install -y man-pages
zypper install -y vim
#zypper install -y bc    
zypper install -y binutils
zypper install -y bind-utils
zypper install -y sshpass zip 
#zypper install -y compat-libcap1
#zypper install -y compat-libstdc++-33
#zypper install -y dtrace-modules
#zypper install -y dtrace-modules-headers
#zypper install -y dtrace-modules-provider-headers
#zypper install -y dtrace-utils
#zypper install -y elfutils-libelf
#zypper install -y elfutils-libelf-devel
#zypper install -y fontconfig-devel
#zypper install -y glibc
#zypper install -y glibc-devel
#zypper install -y ksh
#zypper install -y libaio
#zypper install -y libaio-devel
#zypper install -y libdtrace-ctf-devel
#zypper install -y libXrender
#zypper install -y libXrender-devel
#zypper install -y libX11
#zypper install -y libXau
#zypper install -y libXi
#zypper install -y libXtst
#zypper install -y libgcc
#zypper install -y librdmacm-devel
#zypper install -y libstdc++
#zypper install -y libstdc++-devel
#zypper install -y libxcb
#zypper install -y make
#zypper install -y net-tools # Clusterware
#zypper install -y nfs-utils # ACFS
#zypper install -y python # ACFS
#zypper install -y python-configshell # ACFS
#zypper install -y python-rtslib # ACFS
#zypper install -y python-six # ACFS
#zypper install -y targetcli # ACFS
#zypper install -y smartmontools
#zypper install -y sysstat

## Added by me.
#zypper install -y unixODBC

## New for OL8
#zypper install -y libnsl
#zypper install -y libnsl.i686
#zypper install -y libnsl2
#zypper install -y libnsl2.i686


echo "******************************************************************************"
echo "Check Firewall Status." `date`
echo "******************************************************************************"
systemctl is-enabled firewalld
#systemctl stop firewalld
#systemctl disable firewalld


#echo "******************************************************************************"
#echo "SELinux." `date`
#echo "******************************************************************************"
# on SUSE it is under /etc/selinux/semanage.conf but packages need to download to enable
#on other Linux
#sed -i -e "s|SELINUX=enforcing|SELINUX=permissive|g" /etc/selinux/config
#setenforce permissive
