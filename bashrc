export PS1="\[\e[00;34m\]\u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[00;33m\]\h\[\e[0m\]\[\e[00;37m\][\[\e[0m\]\[\e[00;32m\]\W\[\e[0m\]\[\e[00;37m\]]\n\\$\[\e[0m\]"


#if running in terminal...
if test -t 1; then
    # ...start zsh
    exec zsh
fi

