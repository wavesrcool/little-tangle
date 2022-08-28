#!/bin/bash


RE_INTEGER_SINGLE='^[0-9]$'

echo "What is the node number?"
read NODE_NUMBER

if ! [[ $NODE_NUMBER =~ $RE_INTEGER_SINGLE ]];
then
   echo "Error. Node number must be single integer." >&2; exit 1
fi

DIRECTORY_BASE_PATH="/tmp/little-tangle_node0$NODE_NUMBER/chains/little_tangle_testnet/keystore"

ls $DIRECTORY_BASE_PATH
