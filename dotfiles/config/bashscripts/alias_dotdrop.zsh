# Your dotdrop git repository location
echo 'Loaded Dotdrop Config'
export DOTREPO="$HOME/dotfiles"

alias dotdrop="$DOTREPO/dotdrop.sh"
alias dotgit="git -C $DOTREPO"
alias dotsync="dotgit pull && dotgit add -A && dotgit commit && dotgit push; dotdrop install"


function dot-import {
    $DOTREPO/dotdrop.sh import "$1"
}

function dot-update {
    $DOTREPO/dotdrop.sh update "$1"
}

