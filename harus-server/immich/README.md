# how to install immich on VPS

## instructions

```sh
# prequisite
podman pull ghcr.io/immich-app/immich-server:release
podman pull docker.io/redis:6.2-alpine
podman pull docker.io/tensorchord/pgvecto-rs:pg14-v0.2.0

# setup data volume
mkdir -p /harus/data/immich
mkdir -p /harus/data/postgres

# modify env files
nvim prod.env

# setup podman
podman network create harus_network

podman-compose -f compose.yaml up
podman-compose -f compose.yaml down
```

## tools

- podman

## references

- https://github.com/immich-app/immich
- https://immich.app/docs/install/requirements/
