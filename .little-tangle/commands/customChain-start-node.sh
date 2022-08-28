#!/bin/bash

cd ../..

RE_INTEGER_SINGLE='^[0-9]$'

echo "What is the node number?"
read NODE_NUMBER

if ! [[ $NODE_NUMBER =~ $RE_INTEGER_SINGLE ]];
then
   echo "Error. Node number must be single integer." >&2; exit 1
fi

DIRECTORY_BASE_PATH=".little-tangle/.tmp/little-tangle_node0$NODE_NUMBER"

NODE_NAME="LittleTangleNode0$NODE_NUMBER"

./target/release/node-template \
  --base-path $DIRECTORY_BASE_PATH \
  --chain ./customSpecRaw.json \
  --port 30333 \
  --ws-port 9945 \
  --rpc-port 9933 \
  --telemetry-url "wss://telemetry.polkadot.io/submit/ 0" \
  --validator \
  --rpc-methods Unsafe \
  --name $NODE_NAME \
  --password-interactive
