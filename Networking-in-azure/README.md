#concepts and more

- set up a virtual network instance and subnets within the network

- deploy a virtual machine to a particular subnet within a network

- access the Virtual machine via Bastion (for private access) or public access over the internet e.g using ssh

- use the Virtual machine e.g install nginx server

- allow inbound traffic from the firewall to the Network security group attached to the subnet of the VM
    (not necessary since resources in the same Vnet can communicate with each other across subnets)

- access the Vm in the network using DNAT(Destination Network Address Translation) through a firewall

In this project, the aim is to practice networking in azure by setting up a private virtual network protected

by a firewall, and setting up subnets within the network, deploying a virtual machine(with private ip address) within a subnet,

setting up nginx server within the virtual machine by using azure bastion to access the virtual machine.

"Note: VM can be deployed in a subnet using an arm-template that creates a new network. But in this example,

I tried to deploy to an already existing virtual network and subnet." Script-02.sh will create a new resource group,

virtual Network and virtual machine in the case that you forgot to run script-01.sh to create a virtual network.

Remember to remove the PublicIp field from the network interface(that will be attached to the vm) in arm-template when 

configuring the arm-vm template to disable public access to vm. The public ip address will be attached to Bastion.

To associate a virtual network with a Bastion, it must contain a subnet with name AzureBastionSubnet and a prefix of at least /26.

The virtual network must also have a subnet named AzureFirewallSubnet.

- the first script-01.sh creates a virtual newtork with two subnets

- the second script-02.sh deploys a virtual machine to one of the subnets in the virtual network

#Networks address are often defined using CIDR notation

In the network address  10.0.0.0/24, for example,

- The network address is 10.0.0.0.

- The usable IP addresses for devices range from 10.0.0.1 to 10.0.0.254.

- The broadcast address, used to send data to all devices in the network at once, is 10.0.0.255

 In 10.0.0.0/24, it means the first 24 bits(out of 32 bits for address space) is reserved for network identification,

 so that all devices starting with 10.0.0. will belong to the network. The available or remaining bits is for 

 device identification within the address space starting with 10.0.0.1 to 10.0.0.254 because 10.0.0.0 is reserved for the network

 and 10.0.0.254 is reserved for the broadcast address.

 So for another example, say  10.0.0.0/16, the first 16 bits are for network identification, left with range  10.0.0.1 to  10.0.255.254

 for device addresses and  10.0.255.255 for broadcast address.

 So,  10.0.0.0/16 is a larger network compared to  10.0.0.0/24

 Devices are attached to a network via their network interfaces, so that the location of the device in the network is the location of its network 

 interface.

 A Network interfaces(i.e devices) may be assigned a public address.

 The bastion is attached a public ip to enable access.

 Bastion allows web based RDP access to vnet VM and exists within AzureBastionSubnet in the network. Bastion can be found

 in the Vm settings when deployed, to be connected with the vm via RDP or SSH.

 The firewall would have to be attached to a public address to enable DNAT from the internet to the network resources.

 
