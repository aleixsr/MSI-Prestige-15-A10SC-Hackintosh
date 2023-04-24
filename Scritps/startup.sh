#!/bin/bash
now=$(date +"%T")

echo "Starting startup.sh: $now" > /tmp/startup.log

export PATH="/usr/local/opt/curl/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

sleep 30

# Mounting EFIs
/Users/asola/Scripts/mount_EFIs.sh >> /tmp/startup.log

#Mounting NTFS
/Users/asola/Scripts/mount_NTFSs.sh >> /tmp/startup.log

#/usr/local/opt/python@3.11/bin/python3.11 /usr/local/bin/ezntfs all > /tmp/startup.log
#/sbin/umount /dev/disk1s3
#/usr/local/bin/ntfs-3g /dev/disk1s3 -o rw,auto,nobrowse /Volumes/DriverCD
