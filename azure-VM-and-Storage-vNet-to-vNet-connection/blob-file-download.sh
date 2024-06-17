#! /usr/bin/bash
STORAGE_ACCOUNT='andabestore'
STORAGE_ACCOUNT_KEY='wwwwwwwwwww' 
CONTAINER_NAME='dabestore'
BLOB_NAME='myblob'
FILE='myDownloadedfile.txt'

echo 'use >> az storage blob --help for more commands'
echo 'Downloading blob from '$BLOB_NAME'...' 

az storage blob download --name $BLOB_NAME --file $FILE --container-name $CONTAINER_NAME \
--account-key $STORAGE_ACCOUNT_KEY --account-name $STORAGE_ACCOUNT -o yaml

echo 'Done!!!'