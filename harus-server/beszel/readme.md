# beszel

## instruction

```bash
mkdir -p ~/runtime/beszel_data

podman run -d \
  --name beszel \
  --restart=unless-stopped \
  -v ~/runtime/beszel_data:/beszel_data \
  -p 8090:8090 \
  mirror.gcr.io/henrygd/beszel

# or use admin console to install wth binary
curl -sL https://raw.githubusercontent.com/henrygd/beszel/main/supplemental/scripts/install-agent.sh -o install-agent.sh && chmod +x install-agent.sh && ./install-agent.sh -p 45876 -k "ssh secret key"

# install with podman
podman run -d \
  --name beszel-agent \
  --network host \
  --restart unless-stopped \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  --env-file=prod.env \
  mirror.gcr.io/henrygd/beszel-agent:latest


podman run -d \
  --name beszel-agent \
  --network host \
  --restart unless-stopped \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  --env-file=prod.env \
  mirror.gcr.io/henrygd/beszel-agent:latest
```

## references

- https://beszel.dev/guide
