# ETCD

## Bitnami

`docker run -it --name etcd bitnami/etcd`

### docker-compose

```yaml
version: "3.6"

services:
  etcd:
    image: mirror.gcr.io/bitnami/etcd:3.5
    ports:
      - 2379:2379
      - 2380:2380
    environment:
      - ETCD_ADVERTISE_CLIENT_URLS=http://etcd:2379
      - ETCD_ROOT_PASSWORD=${ETCD_PASS}
    networks:
      iris_network:

volumes:
  etcd-data:

networks:
  iris_network:
```

## References

- [bitnami etcd docker-hub](https://hub.docker.com/r/bitnami/etcd)
