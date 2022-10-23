FROM ghcr.io/slaier/dev-base:1.0.0

RUN dnf install -y nodejs \
    && dnf clean all \
    && rm -rf /var/cache/yum

RUN corepack enable \
    && pnpm install -g nrm
