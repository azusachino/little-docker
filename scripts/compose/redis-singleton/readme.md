# Redis

## bitnami

`docker run --name redis -e ALLOW_EMPTY_PASSWORD=yes bitnami/redis:latest`

### docker-compose

```yaml
version: "3"

services:
  redis:
    image: mirror.gcr.io/bitnami/redis:7.0
    environment:
      - REDIS_PASSWORD=${REDIS_PASS}
      - REDIS_DISABLE_COMMANDS=FLUSHDB,FLUSHALL
    ports:
      - 6379:6379
    volumes:
      - redis_data:/bitnami/redis/data
    networks:
      - iris_network

volumes:
  redis_data:
    driver: local

networks:
  iris_network:
    driver: bridge
```

## References

- [bitnami-redis docker hub](https://hub.docker.com/r/bitnami/redis)
