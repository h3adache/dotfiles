export CHECKOUT=.dotfiles

[ -r ~/${CHECKOUT}/colors ] && . ~/${CHECKOUT}/colors
[ -r ~/${CHECKOUT}/bash_aliases ] && . ~/${CHECKOUT}/bash_aliases
[ -r ~/${CHECKOUT}/bash_completions ] && . ~/${CHECKOUT}/bash_completions
[ -r ~/${CHECKOUT}/bash_colors ] && . ~/${CHECKOUT}/bash_colors

export PS1="[ \[${bold_cyan}\]\u\[${normal}\] at \[${bold_yellow}\]\h \[${normal}\]] \n \[${bold_red}\]\w \[${normal}\] \$ "
export EDITOR=/usr/bin/vi

export JAVA_HOME=`/usr/libexec/java_home`

export M2_HOME=/usr/local/share/maven
export M2=$M2_HOME/bin

export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=256m"

export PATH=$HOME/bin:$M2:$PATH

complete -o default -o nospace -F _git g
