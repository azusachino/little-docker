# WIKI

for local dev wiki (in wsl environment)

## Run with docker (podman)

通过 pod 解决容器之间网络共通问题

### run postgre

- `-h` for host name
- `-U` for username or uid

`podman run -d --pod new:wiki_pod -p 8080:3000 --name=postgres --env POSTGRES_DB=wiki --env POSTGRES_PASSWORD=wiki_for_life --env POSTGRES_USER=wikijs -v db-data:/var/lib/postgresql/data docker.io/library/postgres:14-alpine`

### run wiki

--restart unless-stopped

`podman run -d --pod wiki_pod --name=wiki --env DB_TYPE=postgres --env DB_HOST=localhost --env DB_PORT=5432 --env DB_USER=wikijs --env DB_PASS=wiki_for_life --env DB_NAME=wiki docker.io/requarks/wiki:2`
