#! /usr/bin/bash
STORAGE_ACCOUNT='andabestore'
STORAGE_ACCOUNT_KEY='wwwwwwww' 
CONTAINER_NAME='dabestore'
BLOB_NAME='myblob'
FILE='myfile.txt'

echo 'use >> az storage blob --help for more commands'
echo 'creating blob in '$CONTAINER_NAME'...' 

az storage blob upload --name $BLOB_NAME --file $FILE --container-name $CONTAINER_NAME \
--account-key $STORAGE_ACCOUNT_KEY --account-name $STORAGE_ACCOUNT -o yaml

echo 'Done!!!'
