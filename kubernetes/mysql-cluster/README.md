# Create Stateful Set as Mysql Cluster

[check here](https://kubernetes.io/docs/tasks/run-application/run-replicated-stateful-application/)

## 1. ConfigMap

check mysql-configmap.yml

This ConfigMap provides my.cnf overrides that let you independently control configuration on the primary MySQL server and replicas. In this case, you want the primary server to be able to serve replication logs to replicas and you want replicas to reject any writes that don't come via replication.

## 2. Service

check mysql-services.yml

The Headless Service provides a home for the DNS entries that the StatefulSet controller creates for each Pod that's part of the set. Because the Headless Service is named mysql, the Pods are accessible by resolving `<pod-name>.mysql` from within any other Pod in the same Kubernetes cluster and namespace.

The Client Service, called mysql-read, is a normal Service with its own cluster IP that distributes connections across all MySQL Pods that report being Ready. The set of potential endpoints includes the primary MySQL server and all replicas.

Note that only read queries can use the load-balanced Client Service. Because there is only one primary MySQL server, clients should connect directly to the primary MySQL Pod (through its DNS entry within the Headless Service) to execute writes.

## 3. StatefulSet

check mysql-statefulset.yml
