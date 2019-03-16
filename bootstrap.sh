#!/bin/sh
# bootstrap.sh

REPO="https://github.com/inbucket/demo.inbucket.org"
WORK_DIR="/etc/docker/compose"
TARGET="inbucket"

set -ex

if ! test -e "$WORK_DIR/$TARGET"; then
  mkdir -p "$WORK_DIR"
  git clone "$REPO" "$WORK_DIR/$TARGET"
fi
