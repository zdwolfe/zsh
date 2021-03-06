ZSH=$HOME/.zsh/oh-my-zsh

ZSH_THEME="robbyrussell"

# ZSH update settings
DISABLE_AUTO_UPDATE="true"

# zsh-tmux configuration
#ZSH_TMUX_AUTOSTART="true"

#ZSH_TMUX_AUTOCONNECT="false"

plugins=(git tmux web-search debian git-extras lol)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
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
