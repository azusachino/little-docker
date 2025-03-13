# dev environment

```sh
# setup network
podman network create harus_network

# setup local volumes
mkdir -p ~/runtime/dev/data/valkey ~/runtime/dev/data/kafka ~/runtime/dev/data/postgresql ~/runtime/dev/data/etcd
chmod -R 755 /harus/data
```

docker images built by bitnami, uses podman as runtime.

- valkey (aka redis)
- kafka
- postgresql
- etcd

```bash
# use nerdctl with automatically created volume
nerdctl run -d --name dev_postgresql \
    --env-file=prod.env \
    --network=harus_network \
    -v=dev_pg_data:/bitnami/postgresql \
    -p=5432:5432 \
    mirror.gcr.io/bitnami/postgresql:17.2.0

nerdctl run -d --name dev_valkey \
    --env-file=prod.env \
    --network=harus_network \
    -v=dev_valkey_data:/bitnami/valkey/data \
    -p=6379:6379 \
    mirror.gcr.io/bitnami/valkey:8.0

nerdctl run -d --name dev_kafka \
    --env-file=prod.env \
    --network=harus_network \
    -v=dev_kafka_data:/bitnami/kafka \
    -p=9092:9092 \
    -p=9093:9093 \
    mirror.gcr.io/bitnami/kafka:3.8

nerdctl run -d --name dev_etcd \
    --env-file=prod.env \
    --network=harus_network \
    -v=dev_etcd_data:/bitnami/etcd \
    -p=2379:2379 \
    -p=2380:2380\
    mirror.gcr.io/bitnami/etcd:3.5.0
```

## references

- [valkey docker hub](https://hub.docker.com/r/bitnami/valkey)
- [kafka docker hub](https://hub.docker.com/r/bitnami/kafka)
- [postgresql docker hub](https://hub.docker.com/r/bitnami/postgresql)
- [etcd docker hub](https://hub.docker.com/r/bitnami/etcd)
