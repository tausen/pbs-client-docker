# pbs-client-docker

Proxmox backup client docker image.

Based on https://github.com/Aterfax/pbs-client-docker, but *only* the client, no fancy cron etc.

## Building

Something like

    docker build -t pbs-client-docker .

## Usage

Create an env.txt with contents:

    PBS_REPOSITORY=my-pbs-user@pbs@host-or-ip:name-of-datastore
    PBS_PASSWORD=password-for-my-pbs-user
    PBS_FINGERPRINT=<...>

Fingerprint is found in the web interface under configuration -> certificates, click view certificate on `proxy.pem`. 

The user `my-pbs-user` must have the `DatastoreBackup` permission on `/datastore/name-of-datastore`. 

Take a backup with something like:

    docker run --rm -it --env-file env.txt --hostname my-backup -v /path/to/something:/backup pbs-client-docker proxmox-backup-client backup my-backup.pxar:/backup
