#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=always --format=single-column --human-readable'
alias v='nvim'
alias z='nohup zathura'


PS1='\[\e[0;38;5;219m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0m\] \[\e[0;38;5;45m\]\w\[\e[0m\] \[\e[0;38;5;45m\]»\[\e[0m\] \[\e0'
bind 'set completion-ignore-case on'

# envs
# Adds needed directories to $PATH variable
export PATH="$PATH:$(du "$HOME/.local/bin/" "$HOME/.local/share/go/bin" | cut -f2 | paste -sd ':')"

# Defualt programs
export EDITOR="nvim"
export TERMINAL="st"
export READER="zathura"
export BROWSER="firefox"
export STATUSBAR="gosu"

# ~/ Clean-up
export GOPATH="$HOME/.local/share/go"
export GOBIN="$HOME/.local/share/go/bin" 
# Other global variables
export WM="dwm"
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
"

function sm(){
    xrandr --output HDMI-0 --rate 144 --auto --output DP-0 --off
}

function dm(){
    xrandr  --output HDMI-0 --primary --mode 1920x1080 --rate 144 --output DP-0  --left-of HDMI-0 --mode 1920x1080 --rate 60
}

function wacom(){
    xsetwacom set 13 MapToOutput 1920x1080+1920+0
}

