#!/bin/bash

cd ../..

RE_INTEGER_SINGLE='^[0-9]$'

echo "What is the node number?"
read NODE_NUMBER

if ! [[ $NODE_NUMBER =~ $RE_INTEGER_SINGLE ]];
then
   echo "Error. Node number must be single integer." >&2; exit 1
fi

DIRECTORY_BASE_PATH="/tmp/little-tangle_node0$NODE_NUMBER"

rm -rf "$DIRECTORY_BASE_PATH"

echo "What is the secret phrase?"
read SECRET_PHRASE

if [[ -z ${SECRET_PHRASE} ]];
then
   echo "Error. Must present secret phrase." >&2; exit 1
fi

./target/release/node-template key insert \
  --base-path "$DIRECTORY_BASE_PATH" \
  --chain customSpecRaw.json \
  --scheme Sr25519 \
  --suri "$SECRET_PHRASE" \
  --password-interactive \
  --key-type aura

  ./target/release/node-template key insert \
  --base-path "$DIRECTORY_BASE_PATH" \
  --chain customSpecRaw.json \
  --scheme Ed25519 \
  --suri "$SECRET_PHRASE" \
  --password-interactive \
  --key-type gran
