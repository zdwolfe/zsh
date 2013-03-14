#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
git submodule init
git submodule update
mkdir ~/.zsh
rm -rf ~/.zsh/oh-my-zsh
ln -sf $DIR/oh-my-zsh ~/.zsh/oh-my-zsh
rm -f ~/.zshrc-backup
ln -sf $DIR/zshrc ~/.zshrc
echo "Enter password for $USER to change default shell"
chsh -s $(which zsh)
echo "Done. May have to reboot before default shell is applied"
