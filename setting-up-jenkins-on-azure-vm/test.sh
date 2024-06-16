#! /usr/bin/bash
RESOURCE_GROUP='rg-learn-azure-networking-eastus'
LOCATION='eastus'
#check for resource group
CHECK_GROUP=$(az group exists --name $RESOURCE_GROUP)

if [ $CHECK_GROUP = "true" ]; then
    echo 'found an existing resource group!'
else
    echo 'resource group not found, creating...'
fi
