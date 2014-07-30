#!/bin/bash

# 1. change permission for docker.sock to be able run by jenkins user
# 2. start sshd

DOCKER_SOCK="/docker.sock"
# Symlink config file.
if [[ -f "$DOCKER_SOCK" ]]; then
  echo "change permission for $DOCKER_SOCK"
  chmod o+rw $DOCKER_SOCK
else
  echo "can't find $DOCKER_SOCK , do you want to use docker in docker ?"
  echo "If yes, better restart docker with -v /var/run/docker.sock:$DOCKER_SOCK"
fi

/usr/sbin/sshd -d