FROM docker.io/library/fedora:36

COPY entrypoint.sh /

RUN dnf install -y openfortivpn 3proxy \
    && dnf clean all \
    && rm -rf /var/cache/yum

ENTRYPOINT ["/entrypoint.sh"]
