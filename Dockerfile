# Slimmed down version of https://github.com/Aterfax/pbs-client-docker

FROM debian:bookworm

RUN apt-get update && apt-get install -y curl

# Credits to https://github.com/Aterfax/pbs-client-docker
# Get the Proxmox signing keys and add to trust store
RUN curl -o /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg && \
    echo "deb http://download.proxmox.com/debian/pbs-client bookworm main" > /etc/apt/sources.list.d/pbs-client.list

# Run updates, installs and clean up to minimise image size
RUN apt-get update && \
    apt-get install -y proxmox-backup-client && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/archives
