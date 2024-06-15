#! /usr/bin/bash
az group create --name rg-jenkins-on-azure-vm-eastus --location eastus
az deployment group create --name rollout1 -g rg-jenkins-on-azure-vm-eastus --template-file arm-template.json -o yaml
