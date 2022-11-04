#!/bin/bash

log_file=~/install_progress_log.txt


sudo apt -y install curl
if type -p vim > /dev/null; then
    echo "stow Installed" >> $log_file else echo "stow FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install zsh
if type -p vim > /dev/null; then
    echo "zsh Installed" >> $log_file
else
    echo "zsh FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install stow
if type -p vim > /dev/null; then
    echo "stow Installed" >> $log_file
else
    echo "stow FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt install -y neovim
if type -p vim > /dev/null; then
    echo "NVim Installed" >> $log_file
else
    echo "NVim FAILED TO INSTALL!!!" >> $log_file
fi

# make zsh the default shell
chsh -s /usr/bin/zsh

# install plug manager for nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#==============
# Give the user a summary of what has been installed
#==============

echo -e "\n====== Summary ======\n"
cat $log_file
rm $log_file

# create the systemlinks
stow --verbose --target=$HOME --restow */
