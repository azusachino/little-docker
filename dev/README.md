# dev environment

```sh
# setup network
podman network create harus_network

# setup local volumes
mkdir -p /harus/data/valkey /harus/data/kafka /harus/data/postgresql /harus/data/etcd 
chmod -R 755 /harus/data
```

docker images built by bitnami, uses podman as runtime.

- valkey (aka redis)
- kafka
- postgresql
- etcd

## references

- [valkey docker hub](https://hub.docker.com/r/bitnami/valkey)
- [kafka docker hub](https://hub.docker.com/r/bitnami/kafka)
- [postgresql docker hub](https://hub.docker.com/r/bitnami/postgresql)
- [etcd docker hub](https://hub.docker.com/r/bitnami/etcd)
