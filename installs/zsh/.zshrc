export ZPLUG_HOME=${HOME}/.zplug
source ${HOME}/.zplug/init.zsh

zplug "zplug/zplug", hook-build:'zplug --self-manage'

# completions
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/terraform", from:oh-my-zsh

zplug "${HOME}/.zshrc.d", from:local

zplug "h3adache/zsh", as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load #--verbose

# zsh history preferences
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=100000
export SAVEHIST=${HISTSIZE}

setopt SHARE_HISTORY # share history between all sessions
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY # write to history file immediately
setopt EXTENDED_HISTORY # history with start time and elapsed time
setopt NO_CASE_MATCH

PLATFORM=$(uname | tr '[:upper:]' '[:lower:]')
PLATFORM_CONFIG="${ZDOTDIR:-$HOME}/.zshrc.${PLATFORM}"

if [[ -s "${PLATFORM_CONFIG}" ]]; then
    source "${PLATFORM_CONFIG}"
fi

fpath[1,0]=${HOME}/.zsh/completion/
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# This way the completion script does not have to parse Bazel's options
# repeatedly.  The directory in cache-path must be created manually.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ${HOME}/.zsh/cache

export GOPATH=${HOME}/go
export PATH="${HOME}/bin:${GOPATH}/bin:/usr/local/opt/thrift@0.9/bin:/usr/local/opt/gnu-tar/libexec/gnubin:${PATH}"
