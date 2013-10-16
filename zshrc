ZSH=$HOME/.zsh/oh-my-zsh

ZSH_THEME="robbyrussell"

# ZSH update settings
DISABLE_AUTO_UPDATE="true"

plugins=(git tmux)
source $ZSH/oh-my-zsh.sh

# zsh-tmux configuration
ZSH_TMUX_AUTOSTART="true"

# Customize to your needs...
PS1="%{$fg_bold[green]%}vps ➜ %{$fg_bold[red]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}"
export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
alias l="ls -1"
alias ack="ack-grep --ignore-dir=node_modules --ignore-dir=vendor --ignore-dir=bower_components"
alias c.="cd .."
alias gs="git status"

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

source ~/.zsh/zsh-fuzzy-match/fuzzy-match.zsh
