#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=always --format=single-column --human-readable'
alias v='nvim'


PS1='\[\e[0;38;5;219m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0m\] \[\e[0;38;5;45m\]\w\[\e[0m\] \[\e[0;38;5;45m\]>>\[\e[0m\] \[\e0'

bind 'set completion-ignore-case on'

function sm(){
    xrandr --output HDMI-1 --primary --mode 1920x1080 --rate 144 --output DVI-D-1 --off
}

function dm(){
    xrandr --output HDMI-1 --primary --mode 1920x1080 --rate 144 --output DVI-D-1 --mode 1600x1200 --rate 60 --left-of HDMI-1 --off
}

