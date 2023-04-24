#!/bin/bash

# get the identifier of all NTFS partitions
NTFS_IDENTIFIER=$(diskutil list | grep "Microsoft Basic Data" | awk '{print $NF}')

# mount all NTFS partitions
for i in $NTFS_IDENTIFIER; do
    # get the corresponding volume name for the current identifier
    NTFS_VOLUME=$(diskutil list | grep $i | awk '{print $5}')

    # create the mount point directory if it doesn't exist
    MOUNT_POINT="/Volumes/$NTFS_VOLUME"
    if [ ! -d "$MOUNT_POINT" ]; then
        mkdir "$MOUNT_POINT"
    fi

    # umounting Read Only
    /usr/sbin/diskutil umount $i
    # mount the partition
    echo /usr/local/sbin/mount_ntfs "/dev/$i" "$MOUNT_POINT"
    /usr/local/sbin/mount_ntfs "/dev/$i" "$MOUNT_POINT"
    #ntfs-3g "/dev/$i" "$MOUNT_POINT" -olocal -oallow_other -o auto_xattr
done
