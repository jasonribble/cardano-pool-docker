#!/bin/bash

docker network create -d bridge cardano
docker run -it --rm \
    --network=cardano \
    --name cardano-producer \
    -p 3000:3000 \
    -p 12798:12798 \
    -e HOST_ADDR="0.0.0.0" \
    -e NODE_PORT="3000" \
    -e NODE_NAME="block-producer" \
    -e NODE_TOPOLOGY="<relay-ip>:3000/1" \
    -e CARDANO_NETWORK="main" \
    -e PROMETHEUS_PORT="12798" \
    -v $PWD/config/:/config/ \
    arradev/cardano-pool:latest --start --staking
