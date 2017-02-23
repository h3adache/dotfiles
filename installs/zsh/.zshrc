export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US

export PATH=$HOME/bin:$HOME/.local/bin:$PATH

# load zgen
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
    echo "Creating a zgen save"

    zgen prezto editor key-bindings 'emacs'
    zgen prezto prompt theme 'steeef'

    # prezto and modules
    zgen prezto
    zgen prezto git
    zgen prezto command-not-found
    zgen prezto syntax-highlighting

    zgen load zsh-users/zsh-completions src
    zgen save
fi

alias ls="ls --color=auto"

PLATFORM=$(uname | tr '[:upper:]' '[:lower:]')
PLATFORM_CONFIG="${ZDOTDIR:-$HOME}/.zshrc.${PLATFORM}"

if [[ -s "${PLATFORM_CONFIG}" ]]; then
    source "${PLATFORM_CONFIG}"
fi

export PATH="$HOME/.yarn/bin:$PATH"
