#!/usr/bin/env bash
set -e -o pipefail

exec 3proxy /etc/3proxy.cfg
exec openfortivpn -c /etc/openfortivpn/config
