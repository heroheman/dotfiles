export PS1="\[\e[00;34m\]\u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[00;33m\]\h\[\e[0m\]\[\e[00;37m\][\[\e[0m\]\[\e[00;32m\]\W\[\e[0m\]\[\e[00;37m\]]\n\\$\[\e[0m\]"

export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
