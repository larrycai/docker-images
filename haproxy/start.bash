#!/bin/bash

#
# start.bash
#

HAPROXY="/etc/haproxy"
OVERRIDE="/haproxy-override"
PIDFILE="/var/run/haproxy.pid"

CONFIG="haproxy.cfg"
ERRORS="errors"

cd "$HAPROXY"

# Symlink errors directory
if [[ -d "$OVERRIDE/$ERRORS" ]]; then
  mkdir -p "$OVERRIDE/$ERRORS"
  rm -fr "$ERRORS"
  ln -s "$OVERRIDE/$ERRORS" "$ERRORS"
fi

# Symlink config file.
if [[ -f "$OVERRIDE/$CONFIG" ]]; then
  rm -f "$CONFIG"
  ln -s "$OVERRIDE/$CONFIG" "$CONFIG"
fi

env

echo "  server back1 ${BACK1_PORT_8080_TCP_ADDR}:8080 maxconn 32" >> $CONFIG 
echo "  server back2 ${BACK2_PORT_8080_TCP_ADDR}:8080 maxconn 32" >> $CONFIG
cat $CONFIG

haproxy -f /etc/haproxy/haproxy.cfg -p "$PIDFILE"