#!/bin/sh

if command -v brew >/dev/null 2>&1; then
  echo "Homebrew already installed, skipping."
  exit 0
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
