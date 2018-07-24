#!/bin/bash

# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;34m➜\033[0m  $@"; }

e_header 'Update System'
e_arrow 'sudo apt update'
sudo apt-get update -y && apt-get upgrade -y
e_success 'Done'


e_header 'Install: Git Components'
e_arrow 'git, gitg, git-flow'
sudo apt-get -y install git gitg git-flow
e_success 'Done'


e_header 'Install: Commandline Tools'
e_arrow 'ZSH Shell, ranger, tmux, vim, silversearcher'
sudo apt-get -y install zsh ranger tmux vim silversearcher-ag
e_success 'Done'


e_header 'Install: PHP FPM and Packages'
e_arrow 'php-fpm php-curl php-mysql php7.0-cli php7.0-curl php7.0-mbstring php7.0-zip php-7.0-xml'
sudo apt-get -y install php-fpm php-curl php-mysql php7.0-cli php7.0-curl php7.0-mbstring php7.0-zip php7.0-xml
e_success 'Done'


e_header 'Install: Node Utilities'
if [ ! -d $HOME/.nvm ]; then
    e_arrow 'Install NVM with Git'
    git clone https://github.com/creationix/nvm.git ~/.nvm
    cd ~/.nvm
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`

    e_arrow 'Set Variables in .bashrc'
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    # update .bashrc
    cat << 'END' >> ~/.zshrc

# nvm settings:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
END
    e_success 'Done'

    e_arrow 'Install Node / NPM (stable)'
    nvm install stable
else
    e_error 'NVM already installed'
fi

e_header 'Install: NPM Packages'
e_arrow 'Grunt, Gulp'
npm install grunt-cli gulp -g
e_success 'Done'

e_header 'Install: TLP'
e_arrow 'tlp, tlp-rdw'
sudo add-apt-repository ppa:linrunner/tlp -y
sudo apt-get install -y tlp tlp-rdw
sudo tlp start
e_success 'Done'

e_header 'Install: Software'
e_arrow 'gimp inkscape  emacs25'
sudo apt-get -y install gimp inkscape emacs25
e_success 'Done'

e_header 'Cleanup System'
e_arrow 'sudo apt autoremove'
sudo apt autoremove
e_success 'Done'

e_header 'Install Gnome Shell Extension Support'
sudo apt-get install chrome-gnome-shell
e_success 'Done'


# FINAL REBOOT
while true; do
    read -p "Reboot recommended. Would you like to reboot now? [Y/n]" yn
    case $yn in
        [Y]* ) sudo reboot now;;
        [Nn]* ) exit;;
        * ) echo "Please answer Yes or no.";;
    esac
done
