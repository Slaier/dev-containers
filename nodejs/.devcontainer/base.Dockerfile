FROM ghcr.io/slaier/dev-base:latest

RUN dnf install -y nodejs \
    && dnf clean all \
    && rm -rf /var/cache/yum

RUN corepack enable \
    && pnpm install -g nrm
