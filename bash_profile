export CHECKOUT=.dotfiles
export BREW_PREFIX=`brew --prefix`

[ -r ${BREW_PREFIX}/etc/bash_completion ] && . ${BREW_PREFIX}/etc/bash_completion

[ -r ~/${CHECKOUT}/colors ] && . ~/${CHECKOUT}/colors
[ -r ~/${CHECKOUT}/functions ] && . ~/${CHECKOUT}/functions
[ -r ~/${CHECKOUT}/bash_aliases ] && . ~/${CHECKOUT}/bash_aliases
[ -r ~/${CHECKOUT}/bash_completions ] && . ~/${CHECKOUT}/bash_completions
[ -r ~/${CHECKOUT}/bash_colors ] && . ~/${CHECKOUT}/bash_colors

export PS1="[ \[${bold_blue}\]\u\[${normal}\] at \[${bold_cyan}\]\h \[${bold_yellow}\]\$(parse_git_branch)\[${normal}\]] \n \[${bold_red}\]\w \[${normal}\] \$ "
export EDITOR=/usr/bin/vi

export JAVA_HOME=`/usr/libexec/java_home`

export M2_HOME=/usr/local/share/maven
export M2=$M2_HOME/bin

export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=256m"

export PATH=$HOME/bin:$M2:$PATH

complete -o default -o nospace -F _git g
