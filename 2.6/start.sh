#!/bin/bash

set -e

# Convert COMMAND variable into an array
# Simulating positional parameter behaviour
IFS=' ' read -r -a CMD_ARRAY <<< "$COMMAND"

# explicitly setting positional parameters ($@) to CMD_ARRAY
set -- "${CMD_ARRAY[@]}"

case "$1" in
    *.yaml|*.yml) set -- registry serve "$@" ;;
    serve|garbage-collect|help|-*) set -- registry "$@" ;;
esac

exec "$@"