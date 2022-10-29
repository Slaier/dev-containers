FROM docker.io/library/fedora:36

RUN dnf install -y openfortivpn 3proxy \
    && dnf clean all \
    && rm -rf /var/cache/yum

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
