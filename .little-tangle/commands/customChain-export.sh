#!/bin/bash

cd ../..

./target/release/node-template build-spec --disable-default-bootnode --chain local > customSpec.json
