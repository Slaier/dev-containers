#!/usr/bin/env bash
set -e -o pipefail

3proxy /etc/3proxy.cfg &

# Force all args into openfortivpn
if [ "$1" = "openfortivpn" ]; then
  shift
fi

openfortivpn "$@"

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?
