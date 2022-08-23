#!/bin/bash

cd ..

echo "What is the secret phrase"
read SECRET_PHRASE
./target/release/node-template key inspect --password-interactive --scheme Ed25519 "$SECRET_PHRASE"
