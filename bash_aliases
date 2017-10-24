#!/bin/bash

# ALIASES
# some more ls aliases
alias ll='ls -alhF'
alias lld='ls -alhd */'
alias la='ls -A'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#some convenience :)
alias ..='cd ..'
alias todo='fgrep -rn "TODO" && fgrep -rn "FIXME"'

alias bashconfig='vim ~/.bashrc'
alias gitconfig='vim ~/.gitconfig'
alias vimconfig='vim ~/.vimrc'

alias tmux='tmux -2'  # for 256color
alias tmux='tmux -u'  # to get rid of unicode rendering problem

#alias ssh='ssh -4'

#save some pressious characters
alias a='asciinema'
alias c='cd'
alias f='fgrep'
alias g='git'
alias l='ls -CF'
alias m='make'
alias s='svn'
alias t='touch'
alias v='vim'

alias tb='nc termbin.com 9999'

# ENVIRONMENT
#export PATH="$PATH:$HOME/bin"
# colored GCC warnings and errors
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"
export EDITOR="vim"

# for VIM and TMUC
if [ "$TERM" = "xterm" ]; then
  export TERM=xterm-256color
fi
