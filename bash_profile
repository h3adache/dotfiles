export CHECKOUT=.dotfiles
export PATH=$PATH:/usr/local/bin

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   [ -r ~/${CHECKOUT}/bash_linux ] && . ~/${CHECKOUT}/bash_linux
elif [[ "$unamestr" == 'Darwin' ]]; then
   [ -r ~/${CHECKOUT}/bash_darwin ] && . ~/${CHECKOUT}/bash_darwin
fi

[ -r ${BC_PREFIX}/etc/bash_completion ] && . ${BC_PREFIX}/etc/bash_completion

[ -r ~/${CHECKOUT}/colors ] && . ~/${CHECKOUT}/colors
[ -r ~/${CHECKOUT}/functions ] && . ~/${CHECKOUT}/functions
[ -r ~/${CHECKOUT}/bash_aliases ] && . ~/${CHECKOUT}/bash_aliases
[ -r ~/${CHECKOUT}/bash_completions ] && . ~/${CHECKOUT}/bash_completions
[ -r ~/${CHECKOUT}/bash_colors ] && . ~/${CHECKOUT}/bash_colors

[[ -s $HOME/.rvm/scripts/rvm ]] && . $HOME/.rvm/scripts/rvm

export PS1="[ \[${bold_blue}\]\u\[${normal}\] at \[${bold_cyan}\]\h \[${bold_yellow}\]\$(parse_git_branch)\[${normal}\]] \n \[${bold_red}\]\w \[${normal}\] \$ "
export EDITOR=/usr/bin/vi

export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=256m"

export PATH=$HOME/bin:$M2:$PATH

complete -o default -o nospace -F _git g
