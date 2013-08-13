#!/bin/sh

dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc vimrc vim"

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

echo "Changing to the $dir directory"
cd $dir
echo "...done"

for f in `ls | grep -iv "symlink"`; do
    mv ~/.$f ~/dotfiles_old/
    ln -s $dir/$f ~/.$f
done
