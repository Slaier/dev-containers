FROM docker.io/library/alpine:latest

RUN apk add --no-cache \
    git bash fish make samurai cmake clang clang-extra-tools
