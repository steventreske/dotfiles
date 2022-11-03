#!/bin/bash

log_file=~/install_progress_log.txt

sudo apt install -y neovim
if type -p vim > /dev/null; then
    echo "NVim Installed" >> $log_file
else
    echo "NVim FAILED TO INSTALL!!!" >> $log_file
fi

#==============
# Give the user a summary of what has been installed
#==============

echo -e "\n====== Summary ======\n"
cat $log_file
rm $log_file
