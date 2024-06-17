#! /usr/bin/bash

MOUNT_POINT=~/myblobcontainer
#create a mount point 
sudo mkdir $MOUNT_POINT

#install BlobFuse

#get and add microsoft software repositories
sudo wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb >/dev/null 2>&1
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update

#install
sudo apt-get install blobfuse

#mount
sudo blobfuse $MOUNT_POINT --tmp-path=/mnt/resource/blobfusetmp --config-file=fuse_connection.cfg -o allow_other

echo 'DOne##'

