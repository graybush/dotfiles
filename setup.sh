#!/bin/bash

############################
# setup.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

HERE=$(pwd)
# old dotfiles backup directory
OLD=${HOME}/.dotfiles_old
# list of files/folders to symlink in homedir
FILES=".bashrc .bash_aliases .bash_profile .vimrc .screenrc"

##########

# create dotfiles_old in homedir
echo "Creating ${OLD} for backup of any existing dotfiles in ${HOME}"
mkdir -p $OLD

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in ${FILES}; do
  if [ -f ${HOME}/${file} ]; then
    mv ${HOME}/${file} ${OLD} 
  fi
  echo "Creating symlink to ${file} in home directory."
  ln -s ${HERE}/${file} ${HOME}/${file}
done
