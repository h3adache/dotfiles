export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
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
