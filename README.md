# Docker CE client with BuildKit

### TOC
- [Build](#build)
- [Run](#run)

### Build

```bash
docker buildx create --use
docker buildx build --platform linux/amd64,linux/arm64 --push --tag kimbeejay/docker-buildx:${VERSION} .
```

### Run
```bash
docker run --rm \
  --name buildx \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -d \
  kimbeejay/docker-buildx:0.5.1
```