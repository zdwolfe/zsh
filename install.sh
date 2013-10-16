#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DATE=`date +%s`

git submodule init
git submodule update

if [ -d ~/.zsh ] 
then
  mv ~/.zsh ~/.zsh.$DATE
fi
ln -sf $DIR ~/.zsh

if [ -f ~/.zshrc ]
then
  mv ~/.zshrc ~/.zshrc.$DATE
fi
ln -sf $DIR/zshrc ~/.zshrc

echo "Enter password for $USER to change default shell"
chsh -s $(which zsh)
echo "Done. May have to reboot before default shell is applied"
