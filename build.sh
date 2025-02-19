#!/bin/bash

NODE_VERSION="1.35.4"
LIBSODIUM_VERSION="66f017f1"
ADDRESS_VERSION="3.12.0"
BECH_VERSION="1.1.2"
CNCLI_VERSION="5.2.0"
POOL_VERSION="1.35.3-2"

docker build -f Dockerfile.node \
    --build-arg VERSION=${NODE_VERSION} \
    --build-arg LIBSODIUM_VERSION=${LIBSODIUM_VERSION} \
    --tag arradev/cardano-node:${NODE_VERSION} \
    --tag arradev/cardano-node:latest .

docker build -f Dockerfile.address \
    --build-arg VERSION=${ADDRESS_VERSION} \
    --tag arradev/cardano-address:${ADDRESS_VERSION} \
    --tag arradev/cardano-address:latest .

#docker build -f Dockerfile.voting \
#    --build-arg LIBSODIUM_VERSION=${LIBSODIUM_VERSION} \
#    --tag arradev/cardano-voting:latest .

docker build -f Dockerfile.bech32 \
    --build-arg VERSION=${BECH_VERSION} \
    --tag arradev/bech32:${BECH_VERSION} \
    --tag arradev/bech32:latest .

docker build -f Dockerfile.cncli \
    --build-arg VERSION=${CNCLI_VERSION} \
    --tag arradev/cncli:${CNCLI_VERSION} \
    --tag arradev/cncli:latest .

docker build -f Dockerfile.pool \
    --tag arradev/cardano-pool:${POOL_VERSION} \
    --tag arradev/cardano-pool:latest .


