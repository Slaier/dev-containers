#!/usr/bin/env sh
set -e -o pipefail

if [ "$1" = "openfortivpn" ]; then
  socks -d
  shift
  openfortivpn "$@"
else
  exec "$@"
fi
