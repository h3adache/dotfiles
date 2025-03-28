#!/bin/zsh
ZIM_HOME=~/.zim

# .zimrc hash: {{ include "dot_zimrc" | sha256sum }}
zimfw() { source ${ZIM_HOME}/zimfw.zsh "${@}" }

zimfw init -q
zimfw install
zimfw uninstall -q
zimfw update
