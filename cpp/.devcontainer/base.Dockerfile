FROM ghcr.io/slaier/dev-base:1.0.0

RUN dnf install -y make ninja-build cmake clang clang-tools-extra \
    && dnf clean all \
    && rm -rf /var/cache/yum
