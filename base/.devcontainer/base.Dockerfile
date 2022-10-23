FROM docker.io/library/fedora:latest

RUN dnf install -y git bash-completion \
    && dnf clean all \
    && rm -rf /var/cache/yum
