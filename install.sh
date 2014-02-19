#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
DATE=`date +%s`

git submodule init
git submodule update

if [ -d ~/.zsh ] 
then
  mv -v ~/.zsh ~/.zsh.$DATE
fi
ln -sfv $DIR ~/.zsh

if [ -f ~/.zshrc ]
then
  mv -v ~/.zshrc ~/.zshrc.$DATE
fi
ln -sfv $DIR/zshrc ~/.zshrc

echo "Enter password for $USER to change default shell"
chsh -s $(which zsh)
echo "zsh config installed"
echo "You may have to reboot before default shell is applied"
