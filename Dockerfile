ARG ALPINE_VERSION=3.12
ARG DOCKER_VERSION=20.10

FROM alpine:${ALPINE_VERSION} as builder

ARG BUILDX_VERSION=0.5.1
ARG TARGETOS
ARG TARGETARCH
ARG path=https://github.com/docker/buildx/releases/download/v${BUILDX_VERSION}/buildx-v${BUILDX_VERSION}.${TARGETOS}-${TARGETARCH}
RUN echo == Downloading: $path

RUN apk update && apk add --no-cache curl
RUN curl -L --output /docker-buildx $path

FROM docker:${DOCKER_VERSION} as final

COPY --from=builder /docker-buildx /usr/lib/docker/cli-plugins/docker-buildx
RUN chmod a+x /usr/lib/docker/cli-plugins/docker-buildx