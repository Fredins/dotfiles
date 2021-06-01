#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=always --format=single-column --human-readable'
alias v='nvim'
alias z='nohup zathura'


PS1='\[\e[0;38;5;219m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0m\] \[\e[0;38;5;45m\]\w\[\e[0m\] \[\e[0;38;5;45m\]>>\[\e[0m\] \[\e0'
bind 'set completion-ignore-case on'


function sm(){
#    xrandr --output DP-1 --primary --mode 1920x1080 --rate 144 --output HDMI-1 --off --left-of DP-1 --mode 1920x1080 --rate 60 
    xrandr --output HDMI-0 --off
}

function dm(){
    xrandr --output DP-4 --primary --mode 1920x1080 --rate 144 --output HDMI-0 --left-of DP-4 --mode 1920x1080 --rate 60
}

function wacom(){
    xsetwacom set 13 MapToOutput 1920x1080+1920+0
}

