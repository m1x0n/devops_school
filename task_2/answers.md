1.

```sh
sudo su
mkdir /devops_school
mkfs.ext4 -c /dev/sdb
mount -t ext4 /dev/sdb /devops_school
```
```
df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs  475M     0  475M   0% /dev
tmpfs          tmpfs     492M     0  492M   0% /dev/shm
tmpfs          tmpfs     492M  392K  492M   1% /run
tmpfs          tmpfs     492M     0  492M   0% /sys/fs/cgroup
/dev/xvda1     xfs       8.0G  1.3G  6.8G  16% /
tmpfs          tmpfs      99M     0   99M   0% /run/user/1000
/dev/xvdb      ext4      2.0G  6.0M  1.8G   1% /devops_school
```

```
cat /etc/fstab
UUID=add39d87-732e-4e76-9ad7-40a00dbb04e5     /           xfs    defaults,noatime  1   1
UUID=302e9c4a-ca4d-499e-b3d3-196501ba3e5e /devops_school ext4 defaults 0 0
```


LVM
```
pvcreate /dev/sdf
vgcreate lvm_devops /dev/sdf
lvcreate -l 50%FREE -n photo lvm_devops
lvcreate -l 100%FREE -n audio lvm_devops

mkfs.ext4 /dev/lvm_devops/photo
mkfs.ext4 /dev/lvm_devops/audio

mount -t ext4 /dev/lvm_devops/photo /devops_school_lvm
```

# df -hT /devops_school_lvm
Filesystem                   Type  Size  Used Avail Use% Mounted on
/dev/mapper/lvm_devops-photo ext4  484M  2.3M  453M   1% /devops_school_lvm

# pvs
PV         VG         Fmt  Attr PSize    PFree
/dev/sdf   lvm_devops lvm2 a--  1020.00m    0

# vgs
VG         #PV #LV #SN Attr   VSize    VFree
lvm_devops   1   2   0 wz--n- 1020.00m    0

# lvs
LV    VG         Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
audio lvm_devops -wi-a----- 512.00m
photo lvm_devops -wi-ao---- 508.00m


chmod 641
владелец может читать и писать, а root может читать,писать, и выполнять


chmod -R 1777 some_dir



```
ls -latr /devops_school
total 32
drwx------  2 happy_devops pdffiller 16384 Oct  3 21:34 lost+found
dr-xr-xr-x 20 root         root        303 Oct  3 22:05 ..
drwxr-xr-x  2 happy_devops pdffiller  4096 Oct  4 18:39 test1
drwxr-xr-x  2 happy_devops pdffiller  4096 Oct  4 18:39 test3
drwxr-xr-x  2 happy_devops pdffiller  4096 Oct  4 18:39 test2
-rw-r--r--  1 happy_devops pdffiller     0 Oct  4 18:39 file3
-rw-r--r--  1 happy_devops pdffiller     0 Oct  4 18:39 file2
-rw-r--r--  1 happy_devops pdffiller     0 Oct  4 18:39 file1
drwxr-xr-x  6 root         root       4096 Oct  4 18:39 .
```


Command
```
ip a s | grep -e "inet " | awk '{ gsub(/\/[0-9]{1,}$/, "", $2); print $2 }'
```
