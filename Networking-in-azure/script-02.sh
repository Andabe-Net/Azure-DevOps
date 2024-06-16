#! /usr/bin/bash

RESOURCE_GROUP='rg-learn-azure-networking-eastus'
LOCATION='eastus'
TEMPLATE='arm-template-02.json'
DEPLOYMENT_NAME='rollout2'

echo 'checking for resource group...'
GROUP_FOUND=$(az group exists --name $RESOURCE_GROUP)

if [ $GROUP_FOUND = "true" ]; then
    echo 'found an existing resource group!'
else
    echo 'resource group not found, creating resource group...'
    az group create --name $RESOURCE_GROUP --location $LOCATION -o yaml
fi

#deploy template
echo 'deploying template to create Vm within Virtual Network and subnet...'
az deployment group create --name $DEPLOYMENT_NAME -g $RESOURCE_GROUP --template-file $TEMPLATE -o yaml

echo '###Done'