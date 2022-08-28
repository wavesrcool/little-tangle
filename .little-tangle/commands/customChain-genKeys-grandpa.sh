#!/bin/bash

cd ../..

RE='^[0-9]$'

echo "What is the secret phrase?"
read SECRET_PHRASE

echo "What is the node number?"
read NODE_NUMBER

if ! [[ $NODE_NUMBER =~ $RE ]] ; then
   echo "Error. Node number must be single integer." >&2; exit 1
fi

mkdir -p .keys


KEYS_DIRECTORY=".keys"
KEY_FILE_NAME="KEYS-NODE-0$NODE_NUMBER-GRANDPA.txt"
KEY_FILE_PATH="$KEYS_DIRECTORY/$KEY_FILE_NAME"

mkdir -p $KEYS_DIRECTORY
touch $KEY_FILE_PATH


./target/release/node-template key inspect --password-interactive --scheme Ed25519 "$SECRET_PHRASE" > $KEY_FILE_PATH
