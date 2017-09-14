# GLOBAL
export EDITOR=vim
export SSH_KEY_PATH="~/.ssh/rsa_id"


# ZSH
ZSH_THEME="cloud"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

#PATHS
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH

case `uname` in
  Darwin)
    # commands for OS X go here
    # source $(brew --prefix nvm)/nvm.sh
    # export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
  ;;
  Linux)
    # commands for Linux go here
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
    fi
  ;;
esac

# Thefuck
eval "$(thefuck --alias)"


# FZF Configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# ag -l -g "" | fzf
# export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
--color fg:102,bg:233,hl:65,fg+:15,bg+:234,hl+:108
--color info:108,prompt:109,spinner:108,pointer:168,marker:168
'



# CONFIGURATION FILES
for file in ~/dotfiles/aliases/*.zsh; do
	source $file
done

#ZGEN
source ${HOME}/.zgen/zgen.zsh
# load zgen 
if ! zgen saved; then
    # specify plugins here
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/themes

    zgen load uvaes/fzf-marks
    zgen load b4b4r07/emoji-cli
    zgen load gko/ssh-connect
    zgen load zsh-users/zsh-autosuggestions
    zgen load MichaelAquilina/zsh-you-should-use
    zgen load supercrabtree/k

    # bulk load
    zgen loadall <<EOPLUGINS
        zsh-users/zsh-history-substring-search
EOPLUGINS

    # generate the init script from plugins above
    zgen save
fi
