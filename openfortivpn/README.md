## Usage

```shell
docker run --rm -it --init \
    --device=/dev/ppp --cap-add=NET_ADMIN \
    -v "$(pwd)/config:/etc/openfortivpn/config" \
    -p 1080:1080 \
    ghcr.io/slaier/openfortivpn
```

Note: A socks proxy server listens on port 1080.
