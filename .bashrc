#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=always --format=single-column --human-readable'
alias v='nvim'
alias z='zathura --fork'
alias c2n='cabal2nix --shell ./. > default.nix'

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
$HOME/Games:\
$HOME/.local/bin/games"
export MANPATH=":/usr/share/erlang/man"
export LOCALE_ARCHIVE=$HOME/.nix-profile/lib/locale/locale-archive


# Defualt programs
export EDITOR="nvim"
export TERMINAL="st"
export READER="zathura"
export BROWSER="chromium"
export STATUSBAR="gosu"
export GOPATH="$HOME/.local/share/go"
export GOBIN="$HOME/.local/share/go/bin" 
export WM="dwm"
export JDTLS_HOME="$HOME/.local/share/jdt-java-language-server"

function sm(){
    xrandr --output HDMI-0 --mode 1920x1080 --rate 144 --output DP-0 --off
}

function dm(){
    xrandr  --output HDMI-0 --primary --mode 1920x1080 --rate 144 --output DP-0  --left-of HDMI-0 --mode 1920x1080 --rate 60
}



alias luamake=/home/fm/.local/share/lua-language-server/3rd/luamake/luamake
