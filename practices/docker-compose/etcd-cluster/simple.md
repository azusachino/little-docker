# etcd

```sh
docker run -d --name etcd-server --network iris_network --publish 2379:2379 --publish 2380:2380 --env ALLOW_NONE_AUTHENTICATION=yes --env ETCD_ADVERTISE_CLIENT_URLS=http://etcd-server:2379 bitnami/etcd:3.5.0
```
