#!/usr/bin/env bash

# TODO: Ask about this
rm -rf data/ipfs_data
rm -rf data/ipfs_staging
rm -rf data/cjdns_data
rm -rf data/yggdrasil_data
rm -rf data/ssb_data

docker-compose up -d

# TODO: Needed?
echo "Waiting 20 secs for everything to start..."
sleep 20
echo "Done waiting."

source setup/ipfs/setup.sh