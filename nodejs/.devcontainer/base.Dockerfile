FROM docker.io/library/alpine:latest

RUN apk add --no-cache \
    git bash fish nodejs-current

RUN corepack enable && \
    yarn global add nrm --prefix /usr/local
