#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=always --format=single-column --human-readable'
alias v='nvim'
alias z='zathura --fork'

#PS1='\[\e[0;38;5;219m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0m\] \[\e[0;38;5;45m\]\w\[\e[0m\] \[\e[0;38;5;45m\]»\[\e[0m\] \[\e0'
bind 'set completion-ignore-case on'

PS1='\[\e[0;1;38;5;108m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2) \[\e[0;1;38;5;67m\]\w\[\e[38;5;67m\] \[\e[0;1;38;5;67m\]λ \[\e[0m\]'

# envs
# Adds needed directories to $PATH variable
# export PATH="$PATH:$(du "$HOME/.local/share/go/bin" "$HOME/.local/bin/" "$HOME/.local/bin/statusbar" "$HOME/.local/bin/scripts" "$HOME/.local/bin/games" | cut -f2 | paste -sd ':')"
export DSN_LISTA_IP="lingon:marmar@(188.149.190.213)/lista"
export DSN_LISTA="lingon:marmar@(fredin.org)/lista"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/share"
export PATH="$PATH:\
$HOME/.local/share/go/bin:\
$HOME/.local/bin/:\
$HOME/.local/bin/statusbar:\
$HOME/.local/bin/scripts:\
$HOME/.local/bin/games"

# Defualt programs
export EDITOR="nvim"
export TERMINAL="st"
export READER="zathura"
export BROWSER="chromium"
export STATUSBAR="gosu"

# ~/ Clean-up
export GOPATH="$HOME/.local/share/go"
export GOBIN="$HOME/.local/share/go/bin" 
# Other global variables
export WM="xmonad"
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
*.gif=🖼:\ *.svg=🗺:\
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
    xrandr --output HDMI-0 --mode 1920x1080 --rate 144 --output DP-0 --off
}

function dm(){
    xrandr  --output HDMI-0 --primary --mode 1920x1080 --rate 144 --output DP-0  --left-of HDMI-0 --mode 1920x1080 --rate 60
}


