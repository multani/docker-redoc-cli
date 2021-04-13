#!/bin/sh
set -e

# Shis if will check if the first argument is a flag
# but only works if all arguments require a hyphenated flag
# -v; -SL; -f arg; etc will work, but not arg1 arg2
if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
    set -- redoc-cli "$@"
fi

# Known subcommands are executed directly as redoc-cli subcommands
if [ "$1" = 'bundle' ] || [ "$1" = 'serve' ]; then
    exec redoc-cli "$@"
fi

# Anything else is executed directly. This includes "redoc-cli" (or the Docker
# CMD) itself, but also "bash", "sh", or "cat".
exec "$@"
