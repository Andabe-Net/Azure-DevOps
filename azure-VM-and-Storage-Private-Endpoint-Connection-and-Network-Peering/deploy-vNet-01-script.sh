#! /usr/bin/bash

RESOURCE_GROUP='rg-learn-azure-networking-01-eastus'
LOCATION='eastus'
TEMPLATE='vNet-01-template.json'
DEPLOYMENT_NAME='rollout-vNet-01'

echo 'checking for resource group...'
GROUP_FOUND=$(az group exists --name $RESOURCE_GROUP)

if [ $GROUP_FOUND = "true" ]; then
    echo 'resource group already exists!'
else
    echo 'resource group not found, creating resource group...'
    az group create --name $RESOURCE_GROUP --location $LOCATION -o yaml

    echo 'creating a Virtual network with subnets using '$TEMPLATE' definition...'
    az deployment group create --name $DEPLOYMENT_NAME -g $RESOURCE_GROUP --template-file $TEMPLATE -o yaml
    
    echo 'Done###'
fi



