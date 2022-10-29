FROM docker.io/library/alpine:latest

RUN apk add --no-cache \
    3proxy \
    openfortivpn \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
