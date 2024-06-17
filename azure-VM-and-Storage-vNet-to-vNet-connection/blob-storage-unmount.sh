#! /usr/bin/bash
MOUNT_POINT=~/myblobcontainer

echo 'unmounting '$' container...'
sudo fusermount -u $MOUNT_POINT