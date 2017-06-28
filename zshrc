#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export TERM=screen-256color
# number of lines kept in history
export HISTSIZE=1000
# number of lines saved in the history after logout
export SAVEHIST=1000
# location of history
export HISTFILE=~/.zsh_history
# append command to history file once executed
setopt inc_append_history

source ~/.bash_aliases
export PATH=$HOME/bin:/usr/local/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# ag -l -g "" | fzf
# export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS='
--color fg:102,bg:233,hl:65,fg+:15,bg+:234,hl+:108
--color info:108,prompt:109,spinner:108,pointer:168,marker:168
'
# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Thefuck
eval "$(thefuck --alias)"

# Add Composer to PATH
export PATH="$PATH:$HOME/.composer/vendor/bin" 

source $(brew --prefix nvm)/nvm.sh

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
fi

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH


