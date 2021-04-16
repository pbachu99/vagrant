# we format the disk with 64K Block size as it is the recommended for SQL DB
Get-Disk | Where-Object PartitionStyle -Eq "RAW" | Initialize-Disk -PassThru | New-Partition -AssignDriveLetter -UseMaximumSize  | Format-Volume -NewFileSystemLabel SQL-Disk1 -AllocationUnitSize 65536

# ignore if a window saying "format disk" after running the comand.