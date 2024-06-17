#! /usr/bin/bash
RESOURCE_GROUP='rg-learn-azure-networking-eastus'
LOCATION='eastus'
TEMPLATE='arm-template-01.json'
DEPLOYMENT_NAME='rollout1'

echo 'creating a resource group...'
az group create --name $RESOURCE_GROUP --location $LOCATION -o yaml

echo 'creating a Virtual network with subnets using '$TEMPLATE' definition...'
az deployment group create --name $DEPLOYMENT_NAME -g $RESOURCE_GROUP --template-file $TEMPLATE -o yaml

echo 'Done###'
