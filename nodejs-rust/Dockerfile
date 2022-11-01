FROM docker.io/library/rust:alpine

RUN apk add --no-cache \
    git bash fish nodejs-current rust-analyzer

RUN corepack enable && \
    yarn global add nrm --prefix /usr/local
