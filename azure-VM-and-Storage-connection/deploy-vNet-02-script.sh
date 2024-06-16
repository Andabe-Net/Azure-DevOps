#! /usr/bin/bash

RESOURCE_GROUP='rg-learn-azure-networking-02-eastus'
LOCATION='eastus'
TEMPLATE='vNet-02-template.json'
DEPLOYMENT_NAME='rollout-vNet-02'

echo 'creating '$RESOURCE_GROUP' resource group...'
az group create --name $RESOURCE_GROUP --location $LOCATION -o yaml

echo 'creating a Virtual network with subnets using '$TEMPLATE' definition...'
az deployment group create --name $DEPLOYMENT_NAME -g $RESOURCE_GROUP --template-file $TEMPLATE -o yaml

echo 'Done###'