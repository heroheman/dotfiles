#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dotfiles=~/dotfiles                    # dotfiles directory
dotfilesOld=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc vim zshrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $dotfilesOld for backup of any existing dotfiles in ~"
mkdir -p $dotfilesOld
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dotfiles directory"
cd $dotfiles
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving $file from ~ to $dotfilesOld"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dotfiles/$file ~/.$file
done

# vim vundle
echo "VIM: Checking if Vundle is installed"
if [ ! -d ~/.vim/bundle ]; then
    mkdir -p ~/.vim/bundle
fi

if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
    echo "Installing Vundle"
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
echo "Update/Install plugins using vundle"
vim +PluginInstall +qall 
