#!/bin/bash

# Fix broken software :)
alias tmux='tmux -2'  # for 256color
alias tmux='tmux -u'  # to get rid of unicode rendering problem
#alias ssh='ssh -4'

### save some pressious characters
alias a='asciinema'
alias c='cd'
alias f='fgrep'
alias g='git'
alias l='ls -CF'
alias ll='ls -alhF'
alias lld='ls -alhd */'
alias la='ls -A'
alias m='make'
alias s='svn'
alias t='touch'
alias v='vim'

### CUSTOM
alias ..='cd ..'
alias tb='nc termbin.com 9999'

alias bashconfig='vim ~/.bashrc'
alias gitconfig='vim ~/.gitconfig'
alias vimconfig='vim ~/.vimrc'

alias todo='fgrep -rni "TODO" && fgrep -rni "FIXME"'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

### ENVIRONMENT
# TODO add dedicated bash_export
# colored GCC warnings and errors
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"
export EDITOR="vim"
export TF_CPP_MIN_LOG_LEVEL=2   # mute tensorflows speedup suggestions
