## Usage

```shell
docker run --rm -it \
    --device=/dev/ppp --cap-add=NET_ADMIN \
    -v "$(pwd)/config:/etc/openfortivpn/config" \
    -p 1080:1080 \
    ghcr.io/slaier/openfortivpn \
    openfortivpn -c /etc/openfortivpn/config
```

Note: A socks proxy server listens on port 1080.
