echo 'Loaded Alias Functions'

csscount() {
    cnt=0
        depth=0
        while read -n 1 char; do
            case $char in
                "{")
                ((depth++))
                ;;
    "}")
        ((depth--))
        if [ "$depth" -eq "0" ]; then
            ((cnt++))
                fi
                ;;
    ",")
        ((cnt++))
        ;;
    esac
        done

        echo $cnt
}

extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
    *.tar.gz)    tar xzf $1     ;;
    *.bz2)       bunzip2 $1     ;;
    *.rar)       unrar e $1     ;;
    *.gz)        gunzip $1      ;;
    *.tar)       tar xf $1      ;;
    *.tbz2)      tar xjf $1     ;;
    *.tgz)       tar xzf $1     ;;
    *.zip)       unzip $1       ;;
    *.Z)         uncompress $1  ;;
    *.7z)        7z x $1        ;;
    *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
    else
        echo "'$1' is not a valid file"
            fi
}


function mcd() {
    mkdir -p "$1" && cd "$1";
}

alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'


function path(){
    old=$IFS
        IFS=:
        printf "%s\n" $PATH
        IFS=$old
}
