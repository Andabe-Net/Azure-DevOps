#CONCEPTS AND MORE

Resources in one virtual network do not have access to resources in another virtual network unless the target resource enables public

access or dedicated access permission from the incoming network. Adding permission for the incoming virtual network subnet to access a

storage account in another network, a remote device(VM) in that subnet can access the storage account, with the traffic flowing between

the target network and the incoming network to create storage containers, upload and download blobs and mount storage on the remote resource.

This is what I embarked on...

1   ACCESS BLOB STORAGE FROM VM IN ANOTHER VIRTUAL NETWORK

    - create two different virtual networks in different resource groups

    - set up a virtual machine in one virtual network

    - create a storage account in another virtual network WITHOUT PUBLIC ACCESS AND ACCESS FROM ONLY THE "VIRTUAL MACHINE SUBNET" 
      (this can be done via azure portal)

    - access the Storage account in the network from the virtual machine in the other network using the storage account access key

    - this would require azure CLI to be installed on the machine and to login into the azure account

    - create a container, and upload a blob to the storage account using azure CLI

    - download the blob from the container to the machine

2   MOUNT BLOB STORAGE CONTAINER FROM A VIRTUAL NETWORK AS A FILE SYSTEM ON A VIRTUAL MACHINE IN ANOTHER NETWORK

    Mounting Azure Blob storage on linux Vm can be achived using BlobFuse, which allows access to the storage as though it were a file system.

    - access the Storage account in the network from the virtual machine in the other network using the storage account access key.

    - install BlobFuse on linux, available from microsoft repositories for linux (see install-blobFuse.sh)

    #configure BlobFuse

    - create a config file with the name fuse_connection.cfg

    - the config file configuration should look like 

                                     accountName myaccount
                                     accountKey mykey
                                     containerName mycontainer

    - create a mount point e.g mkdir ~/myblobcontainer

    #mount storage to the directory using the mount command

    - sudo blobfuse ~/myblobcontainer --tmp-path=/mnt/resource/blobfusetmp --config-file=fuse_connection.cfg -o allow_other
    (without the allow_other option, only the root user can access the mounted storage)

    - cd ~/myblobcontainer to access storage

    - to unmount storage use >>sudo fusermount -u ~/myblobcontainer




