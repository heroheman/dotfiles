#!/bin/bash
# This script is my personal setup file - use at own risk
# only tested on mac osx

########## Variables
dotfiles=~/dotfiles                    # dotfiles directory
dotfilesOld=~/dotfiles_old             # old dotfiles backup directory
files="bashrc bash_aliases vimrc tmux.conf zlogin zlogout zpreztorc zprofile zshenv zshrc"    # list of files/folders to symlink in homedir

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
if [ ! -d $HOME/.oh-my-zsh ]; then
    e_error "oh-my-zsh not found!"
    e_header "install it automatically..."
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
    if [ -d $HOME/.oh-my-zsh ]; then
        e_success "installed oh-my-zsh"
    fi
fi
}

function getPrezto() {
    if [ ! -d $HOME/.zprezto ]; then
        e_error "prezto not found!"
        e_header "install it automatically..."
        git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

        if [ -d $HOME/.prezto ]; then
            e_success "Installed Prezto"
        fi
    fi

    e_header "create a new zsh configuration by copying the zsh conf files provided"
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md; do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
    chsh -s /bin/zsh

    if [ -d $HOME/.prezto ]; then
        e_header "Checking for Updates"
        git pull && git submodule update --init --recursive
        e_success "...done " \n
    fi
}


create_nvimrc(){
    e_header "CREATE XDG Config Home for Neovim"
    if [ ! -d ${XDG_CONFIG_HOME:=$HOME/.config} ]; then
        mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
        e_arrow "symlink .vim folder to the neovim xdg home folder"
    fi
    symlink ~/.vim $XDG_CONFIG_HOME/nvim
    symlink ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
    e_success "...done " \n
}

# vim vundle
get_vundle(){
    e_header "VIM: Checking if Vundle is installed"
    if [ ! -d ~/.vim/bundle ]; then
        mkdir -p ~/.vim/bundle
    fi

    if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
        e_arrow "Installing Vundle"
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        e_success "...done " \n
    fi
}

# Install Vundle Plugins
install_vundle(){
    e_header "Update/Install plugins using vundle"
    vim +PluginInstall +qall 
    e_success "...done " \n

}

# vim-plug
get_vimplug(){
    e_header "VIM: Checking if VimPlug is installed"

    if [ ! -d ~/.vim ]; then
        mkdir -p ~/.vim
    fi

    if [ ! -d ~/.vim/autoload ]; then
        mkdir -p ~/.vim/autoload
    fi
    e_arrow "Installing vim-plug"
    if [ ! -e ~/.vim/autoload/plug.vim ]; then
        curl -fLo ~/.vim/autoload/plug.vim \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        e_success "...done " \n
    fi
}

# Install vim-plug Plugins
install_plug(){
    e_header "Update/Install plugins using Vim-Plug"
    vim +PlugInstall +qall 
    e_success "...done " \n
}

#which bash
select term in "ZSH" "PREZTO" "SKIP"; do
    case $term in
        ZSH ) getZSH; break;;
        PREZTO ) getPrezto; break;; 
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
e_arrow "You might want to install the patched font for webdevIcons and arrows";
e_arrow "Also, what about ctags? brew install ctags?"


# install_dotfiles || exit 1
# get_vimplug || exit 1
# install_plug || exit 1
# install_vundle || exit 1
