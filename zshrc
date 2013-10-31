ZSH=$HOME/.zsh/oh-my-zsh

ZSH_THEME="robbyrussell"

# ZSH update settings
DISABLE_AUTO_UPDATE="true"

# zsh-tmux configuration
ZSH_TMUX_AUTOSTART="true"

plugins=(git tmux)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
alias l="ls -1"
alias ack="ack-grep --ignore-dir=node_modules --ignore-dir=vendor --ignore-dir=bower_components"
alias c.="cd .."
alias gs="git status"
alias gd="git difftool -y"
alias gpo="git pull origin"

export EDITOR="vim"

# Thanks to github.com/jdavis for this
function incognito() {
    if [ -z $EDITOR ]; then
        EDITOR=vim
    fi

    # Create temp for storing commands
    TEMPFILE=`mktemp -q incognito.XXXXXXXX`

    # Prompt for commands, only run if successful
    $EDITOR $TEMPFILE || {
        echo "Invalid return on the editing"
        return
    }

    # Run the script
    sh $TEMPFILE

    # Clean everything up
    rm -f $TEMPFILE
}

#source ~/.zsh/zsh-fuzzy-match/fuzzy-match.zsh
