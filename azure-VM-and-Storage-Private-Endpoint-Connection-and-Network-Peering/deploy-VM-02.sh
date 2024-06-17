RESOURCE_GROUP='rg-learn-azure-networking-02-eastus'
LOCATION='eastus'
TEMPLATE='VM-vNet-02-template.json'
DEPLOYMENT_NAME='rollout-VM-vNet-02'

echo 'checking for resource group...'
GROUP_FOUND=$(az group exists --name $RESOURCE_GROUP)

if [ $GROUP_FOUND = "true" ]; then
    echo 'resource group found!'
    echo 'setting up a Virtual Machine in '$RESOURCE_GROUP' using '$TEMPLATE' definition...'
    az deployment group create --name $DEPLOYMENT_NAME -g $RESOURCE_GROUP --template-file $TEMPLATE -o yaml
else
    echo 'resource group not found, creating resource group...'
    az group create --name $RESOURCE_GROUP --location $LOCATION -o yaml

    echo 'setting a Virtual Machine using '$TEMPLATE' definition...'
    az deployment group create --name $DEPLOYMENT_NAME -g $RESOURCE_GROUP --template-file $TEMPLATE -o yaml
    
    echo 'Done###'
fi