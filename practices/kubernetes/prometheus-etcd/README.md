# kubernetes prometheus etcd

[link](http://www.mydlq.club/article/117/)

## configure etcd proxy

## cert to configmap

```shell
kubectl create secret generic etcd-certs \
  --from-file=/etc/kubernetes/pki/etcd/healthcheck-client.crt \
  --from-file=/etc/kubernetes/pki/etcd/healthcheck-client.key \
  --from-file=/etc/kubernetes/pki/etcd/ca.crt \
  -n kube-system
```