#!/bin/bash

cd ../..

RE='^[0-9]$'

echo "What is the node number?"
read NODE_NUMBER

if ! [[ $NODE_NUMBER =~ $RE ]] ; then
   echo "Error. Node number must be single integer." >&2; exit 1
fi


KEYS_DIRECTORY=".keys"
KEY_FILE_NAME="KEYS-NODE-0$NODE_NUMBER-AURA.txt"
KEY_FILE_PATH="$KEYS_DIRECTORY/$KEY_FILE_NAME"

mkdir -p $KEYS_DIRECTORY
touch $KEY_FILE_PATH

./target/release/node-template key generate --scheme Sr25519 --password-interactive > $KEY_FILE_PATH
