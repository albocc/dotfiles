#!/bin/bash

# Get the script's path which is the same as the dotfiles:
SCRIPTPATH=$( cd "$(dirname "$0")" ; pwd -P )

# Let the user confirm the detected SCRIPTPATH:
echo "The current path to the setup script and the dotfiles seems to be $SCRIPTPATH. Press CTRL-C if this seems to be wrong, otherwise press enter."
read

# Make the files only readable to user and group:
chmod 640 $SCRIPTPATH/.bash_aliases
chmod 640 $SCRIPTPATH/.bash_profile
chmod 640 $SCRIPTPATH/.bashrc
chmod 640 $SCRIPTPATH/.curlrc
chmod 640 $SCRIPTPATH/.bash_exports
chmod 640 $SCRIPTPATH/.gitconfig
chmod 640 $SCRIPTPATH/.gitignore
find $SCRIPTPATH/.vim -type d -exec chmod 750 {} +
find $SCRIPTPATH/.vim -type f -exec chmod 640 {} +
chmod 640 $SCRIPTPATH/.vimrc

# Ask the user if files should be copied or symlinked instead:
while true; do
	read -p "Do you want to copy the files or symlink them? Enter 'copy' or 'symlink': " copysymlink
	case $copysymlink in
		[Cc]* ) copyInsteadOfSymlink=true; break;;
		[Ss]* ) copyInsteadOfSymlink=false; break;;
		* ) echo "Please answer yes or no, without any '' symbols.";;
	esac
done

# Copy or symlink them now:
if $copyInsteadOfSymlink; then
	cp -ai $SCRIPTPATH/.bash_aliases $HOME/
	cp -ai $SCRIPTPATH/.bash_profile $HOME/
	cp -ai $SCRIPTPATH/.bashrc $HOME/
	cp -ai $SCRIPTPATH/.curlrc $HOME/
	cp -ai $SCRIPTPATH/.bash_exports $HOME/
	cp -ai $SCRIPTPATH/.gitconfig $HOME/
	cp -ai $SCRIPTPATH/.gitignore $HOME/
	cp -ai $SCRIPTPATH/.vim $HOME/
	# Created .vim subfolders since they are empty by default and therefore not
	# synchronized with Git:
	mkdir -p $HOME/.vim/backups
	mkdir -p $HOME/.vim/swaps
	mkdir -p $HOME/.vim/undo
	cp -ai $SCRIPTPATH/.vimrc $HOME/
else
	ln -si $SCRIPTPATH/.bash_aliases $HOME/
	ln -si $SCRIPTPATH/.bash_profile $HOME/
	ln -si $SCRIPTPATH/.bashrc $HOME/
	ln -si $SCRIPTPATH/.curlrc $HOME/
	ln -si $SCRIPTPATH/.bash_exports $HOME/
	ln -si $SCRIPTPATH/.gitconfig $HOME/
	ln -si $SCRIPTPATH/.gitignore $HOME/
	ln -si $SCRIPTPATH/.vim $HOME/
	# Created .vim subfolders since they are empty by default and therefore not
	# synchronized with Git:
	mkdir -p $SCRIPTPATH/.vim/backups
	mkdir -p $SCRIPTPATH/.vim/swaps
	mkdir -p $SCRIPTPATH/.vim/undo
	ln -si $SCRIPTPATH/.vimrc $HOME/
fi

# Ask user if he/she also wants the gitignore templates:
while true; do
	read -p "Do you want to also use the .gitignore templates? Enter 'yes' or 'no': " yn
	case $yn in
		[Yy]* ) gitignoreTemplates=true; break;;
		[Nn]* ) gitignoreTemplates=false; break;;
		* ) echo "Please answer yes or no, without any '' symbols.";;
	esac
done

# If so, copy or symlink them:
if $gitignoreTemplates; then
	# Check if submodule is initialized:
	if [ $(find $SCRIPTPATH/.gitignore.d -maxdepth 0 -type d -empty 2>/dev/null) ]; then
		echo ".gitignore.d submodule not initialized, initializing it now.."
		git submodule update --init || exit 1
	fi
	# Now copy or symlink the gitignore templates if requested:
	if $copyInsteadOfSymlink; then
		cp -ai $SCRIPTPATH/.gitignore.d $HOME/
	else
		ln -si $SCRIPTPATH/.gitignore.d $HOME/
	fi
fi

# Unset all variables again to leave environment clean
unset SCRIPTPATH
unset copysymlink
unset copyInsteadOfSymlink
unset yn
unset gitignoreTemplates
