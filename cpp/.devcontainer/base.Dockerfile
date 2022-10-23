FROM ghcr.io/slaier/dev-base:latest

RUN dnf install -y make ninja-build cmake clang clang-tools-extra \
    && dnf clean all \
    && rm -rf /var/cache/yum
