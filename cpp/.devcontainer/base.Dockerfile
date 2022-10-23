FROM fedora:latest

RUN dnf install -y git bash-completion \
    make ninja-build cmake clang clang-tools-extra \
    && dnf clean all \
    && rm -rf /var/cache/yum
