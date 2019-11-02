FROM bitnami/minideb:stretch
RUN install_packages vim socat oping bmon iperf3 netcat-openbsd \
    nano curl wget iproute2 iputils-ping
COPY ipfs-swarm.sh /usr/local/bin