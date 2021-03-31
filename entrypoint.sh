#!/bin/sh

if [ "$1" = "redoc-cli" ]; then
  exec "$@"
else
  exec redoc-cli "$@"
fi
