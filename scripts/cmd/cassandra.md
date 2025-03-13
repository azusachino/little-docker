# run cassandra with container

## single instance

```sh
# start the container with daemon
podman run --name dev-cassandra -d mirror.gcr.io/library/cassandra:5-jammy
# execute
podman exec -it dev-cassandra bash
```

## cluster

```sh
# Run the first node and keep it in background up and running
podman run --name cassandra-1 -p 9042:9042 -d mirror.gcr.io/library/cassandra:5-jammy
$INSTANCE1=$(podman inspect --format="{{ .NetworkSettings.IPAddress }}" cassandra-1)
echo "Instance 1: ${INSTANCE1}"

# Run the second node
podman run --name cassandra-2 -p 9043:9042 -d -e CASSANDRA_SEEDS=$INSTANCE1 mirror.gcr.io/library/cassandra:5-jammy
$INSTANCE2=$(podman inspect --format="{{ .NetworkSettings.IPAddress }}" cassandra-2)
echo "Instance 2: ${INSTANCE2}"

echo "Wait 60s until the second node joins the cluster"
sleep 60

# Run the third node
podman run --name cassandra-3 -p 9044:9042 -d -e CASSANDRA_SEEDS=$INSTANCE1,$INSTANCE2 mirror.gcr.io/library/cassandra:5-jammy
$INSTANCE3=$(podman inspect --format="{{ .NetworkSettings.IPAddress }}" cassandra-3)
```
