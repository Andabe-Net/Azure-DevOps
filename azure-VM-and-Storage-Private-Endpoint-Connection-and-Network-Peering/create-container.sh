#! /usr/bin/bash
STORAGE_ACCOUNT='andabestore'
STORAGE_ACCOUNT_KEY='wwwwwwww' 
CONTAINER_NAME='dabestore'

echo 'use >> az storage container --help for more commands'
echo 'creating container in '$STORAGE_ACCOUNT'...' 

az storage container create --name $CONTAINER_NAME --account-key $STORAGE_ACCOUNT_KEY --account-name $STORAGE_ACCOUNT -o yaml

echo 'Done!!!'
