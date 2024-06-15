#! /usr/bin/bash
#create resource group and deploy a virtual machine in it using the arm-template file
az group create --name rg-jenkins-on-azure-vm-eastus --location eastus
az deployment group create --name rollout1 -g rg-jenkins-on-azure-vm-eastus --template-file arm-template.json -o yaml
