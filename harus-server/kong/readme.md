# kong installation

well, it seems it's not easy to use docker-compose

## scripts

```sh
# 1. create fundamental things
podman network create kong_network
podman volume create kong_pg_data

podman volume rm kong_pg_data

# pg containers
podman run -d --name kong_postgresql \
    --env-file=prod.env \
    --network=kong_network \
    -v=kong_pg_data:/bitnami/postgresql \
    -p=15432:5432 \
    docker.io/bitnami/postgresql:17.2.0

# kong bootstrap
podman run --rm \
    --env-file=prod.env \
    --network=kong_network \
    docker.io/kong/kong-gateway:3.6-debian kong migrations bootstrap

# kong start
podman run -d --name kong \
    --env-file=prod.env \
    --network=kong_network \
    -p 8000:8000 \
    -p 8443:8443 \
    -p 8001:8001 \
    -p 8444:8444 \
    -p 8002:8002 \
    -p 8445:8445 \
    -p 8003:8003 \
    -p 8004:8004 \
    docker.io/kong/kong-gateway:3.6-debian
```

setup test

```sh
curl -i -X GET --url http://localhost:8001/services
curl -i -X GET --url http://localhost:8001/routes
curl -i -X GET --url http://localhost:8001/plugins
curl -X GET http://localhost:8002

# setup service
curl -i -s -X POST http://localhost:8001/services \
  --data name=echo_server \
  --data url='http://localhost:8080'

# setup route
curl -i -X POST http://localhost:8001/services/echo_server/routes \
  --data 'paths[]=/echo' \
  --data name=echo_route

# test gateway
curl -X GET http://localhost:8000/echo/hello

curl -i -X POST http://localhost:8000/echo/hello \
  --data 'welcome'
```
