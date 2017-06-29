#!/bin/bash
# This script is my personal setup file - use at own risk
# only tested on mac osx

# VARIABLES
# dotfiles directory
dotfiles=~/dotfiles         
# old dotfiles backup directory
dotfilesOld=~/dotfiles_old             
# list of files/folders to symlink in homedir
files="ackrc bashrc bash_aliases vimrc tmux.conf zlogin zlogout zpreztorc zprofile zshenv zshrc"    

##########

# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;34m➜\033[0m  $@"; }

function symlink() {
    if [ -h "$2" ]; then
        local target="$(greadlink -f ${2})"
        if [ "$1" == "$target" ]; then
            # don't create symlink if it exists and the target is the same
            e_arrow "symlink $2 already exists"
            return 0
        fi
    fi
    if [ -f "$2" ]; then
        e_error "File already exists!"
        # local newname="$2.$(date +%s)"
        # mv "$2" "$newname" && e_success "renamed to $newname"
    fi
    ln -s "$1" "$2"
}

install_dotfiles(){
    # create dotfiles_old in homedir
    if [ ! -d $dotfilesOld ]; then
        e_header "Creating $dotfilesOld for backup of any existing dotfiles in ~"
        mkdir -p $dotfilesOld
        e_success "...done " \n
    fi

    # change to the dotfiles directory
    cd $dotfiles
    create_nvimrc
    # move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
    for file in $files; do
        e_arrow "Moving $file from ~ to $dotfilesOld"
        mv ~/.$file ~/dotfiles_old/
        e_arrow "Creating symlink to $file in home directory. \n"
        symlink $dotfiles/$file ~/.$file
        e_success "...done " \n
    done
}

# zsh
function getZSH() {
e_header "OH MY ZSH"
if [ ! -d $HOME/.oh-my-zsh ]; then
    e_error "oh-my-zsh not found."
    e_header "Installing OhMyZSH"
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
    if [ -d $HOME/.oh-my-zsh ]; then
        e_success "Installed oh-my-zsh"
    fi
else
    e_arrow "OhMyZSH already installed"
fi
}

function getZSHPlugins(){
    e_header "ZGEN: Installing ZGen Plugin Manager"

    if [ ! -d $HOME/.zgen ]; then
        e_arrow "ZGEN: Install Zgen Manager"
        git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
    else
        e_arrow "ZGEN: Zgen already installed"
    fi

    e_arrow "ZGEN: You may have to source / restart your shell"
}

# create nvimrc for neovim
create_nvimrc(){
    e_header "CREATE XDG Config Home for Neovim"
    if [ ! -d ${XDG_CONFIG_HOME:=$HOME/.config} ]; then
        mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
        e_arrow "symlink .vim folder to the neovim xdg home folder"
    fi
    symlink ~/.vim $XDG_CONFIG_HOME/nvim
    symlink ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
    e_success "...done "
}


# vim-plug
get_vimplug(){
    e_header "VIM: Checking if VimPlug is installed"

    if [ ! -d ~/.vim ]; then
        e_arrow "Create .vim directory"
        mkdir -p ~/.vim
    fi

    if [ ! -d ~/.vim/autoload ]; then
        e_arrow "Create .vim/autoload directory"
        mkdir -p ~/.vim/autoload
    fi
    if [ ! -e ~/.vim/autoload/plug.vim ]; then
        e_arrow "Installing vim-plug"
        curl -fLo ~/.vim/autoload/plug.vim \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        e_success "...done "
    fi
}

# Install vim-plug Plugins
install_plug(){
    e_header "Update/Install plugins using Vim-Plug"
    vim +PlugInstall +qall
    e_success "...done"
}

#Install OH MY ZSH?
e_header "Do You want OhMyZSH? (Hint: You want.)"
select term in "OHMYZSH" "SKIP"; do
    case $term in
        OHMYZSH ) getZSH; getZSHPlugins; break;;
        SKIP ) e_arrow "okay - thats ok, I guess"; break;;
    esac
done

e_header "Backup existing Aliases in $dotfilesOld and create aliases?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) install_dotfiles; break;;
        No ) e_arrow "okay - thats ok, I guess"; break;;
    esac
done

e_header "Install Vim-Plug and get Plugins?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) get_vimplug; install_plug; break;;
        No ) e_arrow "okay - thats ok, I guess"; break;
    esac
done
e_success "Thats all, have a nice day"


# install_dotfiles || exit 1
# get_vimplug || exit 1
# install_plug || exit 1
# install_vundle || exit 1

#todo
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
