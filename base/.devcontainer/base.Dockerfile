FROM docker.io/library/fedora:36

RUN dnf install -y git bash-completion \
    && dnf clean all \
    && rm -rf /var/cache/yum
