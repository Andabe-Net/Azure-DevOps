#CONCEPTS AND MORE

When creating a virtual network in azure, resources within a particular vNet can (generally) communicate among each other.

For the sake of added security and compliance, some resources may need to have dedicated network channels, for instance, accessing

a storage account only through a private endpoint that allows traffic to flow only through the private endpoint between the 

the storage account and a virtual machine. A VM within the same network as the storage account can access the 

storage account through the private endpoint, but a VM from another vNet cannot. In the second case, the remote network

needs to be peered with the local vNet, and a private network link for the remote vNet created on the private endpoint. 

This is what I embarked on...

1   ACCESS BLOB STORAGE FROM VM IN THE SAME VIRTUAL NETWORK THROUGH A PRIVATE ENDPOINT

    using ARM templates(Infrastructure as code) and azure portal,

    - setup a vNet with at two subnets

    - create a storage account, with public access DISABLED

    - create a private endpoint in one subnet

    - add the private endpoint to the storage account

    - set up a VM in a separate subnet with public or private access depending on how to access the VM

    - access the VM and use it to access the storage account using the private endpoint
    
      through the private DNS zone attached to the private endpoint  and using storage account access keys or configuration strings

2   ACCESS BLOB STORAGE FROM VM THAT IS IN ANOTHER VIRTUAL NETWORK THROUGH A PRIVATE ENDPOINT AND NETWORK PEERING

     Assuming the above setup is still in place

     - setup another vNet with a subnet for the remote VM

     - setup a VM within the subnet

     - peer the above local network with this remote network

     - add a private network link to the (above) private endpoint of the local vNet

     - access the storage account in the above (local) vNet from the VM in (this) remote vNet



     To create storage containers, upload and download blobs, or mount storage on a VM, see "azure-VM-and-Storage-vNet-to-vNet-connection" project.


To connect privately with your private endpoint, you need a DNS record. We recommend that you integrate your private endpoint with a private DNS zone.