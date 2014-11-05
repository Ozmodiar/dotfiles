#!/bin/bash

dotdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
files=('bash_profile' 'vimrc')

echo ""
echo " ######################"
echo " # dotfiles installer #"
echo " ######################"

##
# Symlink files
##
echo ""
echo "Symlink dotfiles"
for file in "${files[@]}"; do
	echo "  Make symlink to $file"
	if [ -f ~/.$file ]; then
		echo "    File $file exists."
		echo "    Backing up to ~/.${file}_backup"
		mv ~/.$file ~/.${file}_backup
	fi
	ln -s $dotdir/files/$file ~/.$file
done

##
# Installation
##
source ~/.dotfiles/src/install/brew.sh
source ~/.dotfiles/src/install/git.sh
source ~/.dotfiles/src/install/ssh.sh

exit 0