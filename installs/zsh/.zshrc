export ZPLUG_HOME=${HOME}/.zplug
source ~/.zplug/init.zsh

zplug "zplug/zplug"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "plugins/command-not-found", from:oh-my-zsh, as:plugin
zplug "${HOME}/.zshrc.d", from:local
zplug "h3adache/zsh", as:theme

zplug load # --verbose

# zsh history preferences
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=100000
export SAVEHIST=${HISTSIZE}

setopt SHARE_HISTORY # share history between all sessions
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY # write to history file immediately
setopt EXTENDED_HISTORY # history with start time and elapsed time

PLATFORM=$(uname | tr '[:upper:]' '[:lower:]')
PLATFORM_CONFIG="${ZDOTDIR:-$HOME}/.zshrc.${PLATFORM}"

if [[ -s "${PLATFORM_CONFIG}" ]]; then
    source "${PLATFORM_CONFIG}"
fi

export PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"
