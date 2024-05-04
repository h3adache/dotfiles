#!/bin/sh
set -ve
CHEZMOI_BIN_DIR=$HOME/.local/bin

sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b $CHEZMOI_BIN_DIR
exec $CHEZMOI_BIN_DIR/chezmoi init h3adache --apply --ssh
