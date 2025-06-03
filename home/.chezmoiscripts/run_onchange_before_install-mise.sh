#!/bin/sh

# curl options
# -s, --silent                Silent mode
# -S, --show-error            Show error even when -s is used
# -L, --location              Follow redirects

curl -sSL https://mise.run | sh -s
