# Your dotdrop git repository location
export DOTREPO="~/dotifles"

alias dotdrop="$DOTREPO/dotdrop.sh"
alias dotgit="git -C $DOTREPO"
alias dotsync="dotgit pull && dotgit add -A && dotgit commit && dotgit push; dotdrop install"

