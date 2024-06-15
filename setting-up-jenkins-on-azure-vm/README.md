
#concepts and more

Note>> "A quick way to set up deployment to azure is using the azure resource manager(arm) template, and a quick way to set up an arm-template is using 
the azure resource manager tools VS code extension."

#create resource group and deploy a virtual machine in it using the arm-template.json file

- az group create --name rg-jenkins-on-azure-vm-eastus --location eastus

- az deployment group create --name rollout1 -g rg-jenkins-on-azure-vm-eastus --template-file arm-template.json -o yaml

The azure resource manager uses the arm template to provision resources needed for the vm to run, resources include
-Virtual Network, publicIpAddress, NetworkSecurityGroups, and NetworkInterfaces, from Microsoft.Network namespace
-storage account, from Microsoft.Storage namespace
-virtual machine instance itself to run in the virtual Network, from Microsoft.Compute namespace

#architecture and connections

- the virtual network instance(a public or private address range) is connected with the Network Interface instance which is also attached to the virtual machine.
- The IP address of the virtual machine is effectively the Ip address of the Network Interface attached to the virtual machine.
- the virtual machine exists inside an ip range(subnet) within  the virtual network and the subnet is protected by the network security group
- the public ip address provides public access to the vm over the internet
    -- e.g connect to vm via SSH with >> ssh username@public_ip
- the network security group allows setting up security rules that define access to resources within the subnet e.g allowing inbound traffic to 
  a particular port
    
#after connecting to vm with ssh

#set up jenkins

    first install java runtime
        update package list
            >> sudo apt update
        Add the OpenJDK PPA (Personal Package Archive)
            >> sudo add-apt-repository ppa:openjdk-r/ppa
        install java
            >> sudo apt install openjdk-17-jdk
    Install jenkins
        >> sudo apt install jenkins
#access jenkins

    -create an inbound port rule in the network security group of the subnet that allows inbound traffic to port  8080 where jenkin 
    -copy the public ip address of the virtual machine to access jenkins on port 8080
        >> public_ip:8080
    jenkins will ask for a passcode which can be found on the virtual machine or server with
        >> sudo cat /var/lib/jenkins/secrets/initialAdminPassword

#Done!!! 






--------for anyone using this, reach me----- amulah.m1600741@st.futminna.edu.ng-------- if you encountered any challenges

    


