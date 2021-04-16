VM='test_sas_Win2k19'
VBoxManage createmedium disk --filename $VM.vhd --size 102432 --format VHD
VBoxManage createvm --name $VM --ostype "Windows2019_64" --register
# --ostype "Other_64"
# --ostype "WindowsNT_64"

VBoxManage storagectl $VM --name "LSILogicSAS" --add sas --controller  LSILogicSAS

# point to the directory where your Windows ISO file
VBoxManage storageattach $VM --storagectl "LSILogicSAS" --port 0 --device 0 --type dvddrive --medium /d/Users/User/Downloads/Windows-new/windows-server-2019/SERVER_EVAL_2019_x64FREE_en-us.ISO
VBoxManage storageattach $VM --storagectl "LSILogicSAS" --port 1 --device 0 --type hdd --nonrotational on --medium $VM.vhd
# "with --nonrotational on" we make this disk as SSD

VBoxManage modifyvm $VM --audio none
VBoxManage modifyvm $VM --audioout off
VBoxManage modifyvm $VM --ioapic on
VBoxManage modifyvm $VM --firmware efi      # EFI enabled
VBoxManage modifyvm $VM --paravirtprovider default       # paravirtualization default  
VBoxManage modifyvm $VM --boot1 dvd --boot2 disk --boot3 none --boot4 none
VBoxManage modifyvm $VM --memory 4048 --vram 128
VBoxManage modifyvm $VM --nic1 NAT
VBoxManage modifyvm $VM --cpus 2
VBoxManage modifyvm $VM --graphicscontroller vboxsvga
VBoxHeadless -s $VM

# VBoxManage.exe list ostypes (OS Type, here --ostype "Windows2019_64")

#Adding SAS/SCSI Controller 
#SAS Controller
#VBoxManage storagectl $VM --name "LSILogicSAS" --add sas --controller  LSILogicSAS

#### Creating SAS Disks and attaching
#VBoxManage createmedium disk --filename sasd1 --size 10240 --format VHD
#VBoxManage createmedium disk --filename sasd2 --size 10240 --format VHD
#
#VBoxManage storageattach $VM --storagectl "LSILogicSAS" --port 0 --device 0 --type hdd --medium sasd1.vhd
#VBoxManage storageattach $VM --storagectl "LSILogicSAS" --port 1 --device 0 --type hdd --medium sasd2.vhd
