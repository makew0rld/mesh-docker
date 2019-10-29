#!/usr/bin/env bash

# for line in file, docker exec $line
echo "Setting up IPFS..."
docker exec -i mesh_ipfs sh < setup/ipfs/orig-install.sh
echo "Done setting up IPFS."