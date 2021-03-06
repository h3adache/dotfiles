if [[ -s "${HOME}/.zplugins" ]]; then
    source ${HOME}/.zplugins
fi

# zsh history preferences
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=100000
export SAVEHIST=${HISTSIZE}

setopt SHARE_HISTORY # share history between all sessions
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt EXTENDED_GLOB
setopt INC_APPEND_HISTORY # write to history file immediately
setopt EXTENDED_HISTORY # history with start time and elapsed time
setopt NO_CASE_MATCH
setopt INTERACTIVECOMMENTS

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:processes' command 'ps -A'
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ${HOME}/.zsh/cache

# export go paths
export GOPATH="${HOME}/go:${HOME}/Projects/go"
export GOBIN="${HOME}/bin"
export PATH="${GOPATH//://bin:}/bin:${GOBIN}:/usr/local/sbin:${PATH}"

fpath=(~/.zsh/completions $fpath)

# platform specific configs
PLATFORM=$(uname | tr '[:upper:]' '[:lower:]')
PLATFORM_CONFIG="${ZDOTDIR:-$HOME}/.zshrc.${PLATFORM}"
if [[ -s "${PLATFORM_CONFIG}" ]]; then
    source "${PLATFORM_CONFIG}"
fi

# zsh plugins
if [ -d ${HOME}/.zshrc.d ]; then
  for file in ${HOME}/.zshrc.d/*.zsh; do
    source ${file}
  done
fi

source ${HOME}/.zshrc.spaceship

# manual completions
autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
