#!/usr/bin/env bash

####################
# This is the original install file from tomeshnet/prototype-cjdns-pi
# Any changes required for docker are commented out
# But installation related commands have been removed outright
####################

# shellcheck disable=SC1091

set -e

# Hyperborea connected peer used to bootstrap Hyperborea only ipfs nodes
# DarkDrgn2k's peer
IPFS_PEER_1="/ip6/fc6e:691e:dfaa:b992:a10a:7b49:5a1a:5e09/tcp/4001/ipfs/QmU6NeD2Uu34WKest1NZGvGmScLhN1zVo66K35GeE6Jft2"
# HeavyMetal's peer
IPFS_PEER_2="/ip6/fc6d:3961:6744:7d94:31ba:2bf3:30bf:ebab/tcp/4001/ipfs/QmRGk8DdMWy5P5xgUisnv7u4hV4WfgEhbxa6iGpviYGC7q"
# Yggdrasil connected peer used to bootstrap hyperborea only ipfs nodes
IPFS_PEER_3="/ip6/301:4541:2f84:1188:216:3eff:fed5:a2df/tcp/4001/ipfs/QmWZpTdfETtpjJphVE1YbxMkUcL84idkg44Cq1XWSBNm7P"
# DarkDrgn2k's peer
IPFS_PEER_4="/ip6/200:98bf:d6df:e49a:f525:40bf:18d:ac45/tcp/4001/ipfs/QmU6NeD2Uu34WKest1NZGvGmScLhN1zVo66K35GeE6Jft2"
# HeavyMetal's peer
IPFS_PEER_5="/ip6/201:3d73:dbf:da97:e008:2d29:3919:cdb1/tcp/4001/ipfs/QmRGk8DdMWy5P5xgUisnv7u4hV4WfgEhbxa6iGpviYGC7q"
# Yk3Music's Irvine-CA peer
IPFS_PEER_6="/ip6/fcbb:1db3:54fb:e519:d915:d7db:4893:4f30/tcp/4001/ipfs/QmZEiPvrfZHapq4uiyTDEcR2szCUhDnjdS4q3Uv2b1Uh88"

# Enable gossipsub routing
ipfs config Pubsub.Router gossipsub

# Enable Filestore for --nocopy capability
ipfs config --bool Experimental.FilestoreEnabled true

# Setup connection management - Reduce connections to stress the Pi less
# XXX: These values need to be tweaked and tested
ipfs config Swarm.ConnMgr.Type basic
ipfs config --json Swarm.ConnMgr.LowWater 100
ipfs config --json Swarm.ConnMgr.HighWater 200
ipfs config Swarm.ConnMgr.GracePeriod 60s

# Enable QUIC for better connections when possible
ipfs config --bool Experimental.QUIC true

# Configure HTTP reverse proxy to IPFS gateway
#sudo cp "$BASE_DIR/ipfs-http-gateway.conf" /etc/nginx/site-path-enabled/ipfs-http-gateway.conf
#sudo systemctl restart nginx.service

# shellcheck source=../shared/nodeinfo/install
#source "$BASE_DIR/../shared/nodeinfo/install"
#sudo cp "$BASE_DIR/nodeinfo-ipfs" /opt/tomesh/nodeinfo.d/ipfs

# Add bootstrap addresses
ipfs bootstrap add "$IPFS_PEER_1"
ipfs bootstrap add "$IPFS_PEER_2"
ipfs bootstrap add "$IPFS_PEER_3"
ipfs bootstrap add "$IPFS_PEER_4"
ipfs bootstrap add "$IPFS_PEER_5"
ipfs bootstrap add "$IPFS_PEER_6"

# Download dependencies
#sudo apt-get install -y jq

# Copy file
# TODO
#sudo cp "$BASE_DIR/ipfs-swarm.sh" /usr/local/bin/
#sudo chmod +x /usr/local/bin/ipfs-swarm.sh

# Configure systemd to start ipfs.service on system boot
#sudo cp "$BASE_DIR/ipfs.service" /etc/systemd/system/ipfs.service
#sudo sed -i "s|__USER_HOME__|${HOME}|" /etc/systemd/system/ipfs.service
#sudo systemctl daemon-reload
#sudo systemctl enable ipfs.service
#sudo systemctl start ipfs.service

# Add entry into nginx home screen
#APP="<div class='app'><h2>IPFS</h2>A peer-to-peer hypermedia protocol to make the web faster, safer, and more open. <br/><a href='/ipfs/QmYwAPJzv5CZsnA625s3Xf2nemtYgPpHdWEz79ojWnPbdG/readme'>Go</a></div>"
#sudo sed -i "s#<\!--APPLIST-->#$APP\n<\!--APPLIST-->#" "/var/www/html/index.html"
