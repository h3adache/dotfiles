# Alias definitions.
[ -r ~/.bash_configs/bash_aliases ] && . ~/.bash_configs/bash_aliases
[ -r ~/.bash_configs/bash_completions ] && . ~/.bash_configs/bash_completions
[ -r ~/.bash_configs/bash_colors ] && . ~/.bash_configs/bash_colors

export PS1="[\u@\h \w \$] "
export EDITOR=/usr/bin/vi

export JAVA_HOME=`/usr/libexec/java_home`

export M2_HOME=/usr/local/share/maven
export M2=$M2_HOME/bin

export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=256m"

export PATH=$HOME/bin:$M2:$PATH

complete -o default -o nospace -F _git g
