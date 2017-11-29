export ZPLUG_HOME=${HOME}/.zplug

source ~/.zplug/init.zsh

zplug "zplug/zplug"
zplug "zsh-users/zsh-completions", defer:3
zplug 'themes/af-magic', from:oh-my-zsh

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load # --verbose

PLATFORM=$(uname | tr '[:upper:]' '[:lower:]')
PLATFORM_CONFIG="${ZDOTDIR:-$HOME}/.zshrc.${PLATFORM}"

if [[ -s "${PLATFORM_CONFIG}" ]]; then
    source "${PLATFORM_CONFIG}"
fi

if [[ -s "${HOME}/.zshrc.local" ]]; then
    source "${HOME}/.zshrc.local"
fi

if [ -d "${HOME}/.zshrc.d" ]; then
  for file in ${HOME}/.zshrc.d/*.zsh; do
    source $file
  done
fi

export PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"
