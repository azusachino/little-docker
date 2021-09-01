# k8s redis-cluster

## operations

```shell
# apply all files
kubectl apply -f redis-config.yml
kubectl apply -f redis-statefulset.yml
kubectl apply -f redis-service.yml

# check status
kubectl get pods
kubectl get svc

# enable cluster
kubectl exec -it redis-cluster-0 -- redis-cli --cluster create --cluster-replicas 1 $(kubectl get pods -l app=redis-cluster -o jsonpath='{range.items[*]}{.status.podIP}:6379 {end}')

# validate cluster status
kubectl exec -it redis-cluster-0 -- redis-cli cluster info
kubectl exec -it redis-cluster-0 -- redis-cli cluster nodes
```