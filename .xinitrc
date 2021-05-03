xrdb ~/.Xresources
feh --bg-scale ~/pictures/wallpapers/001.png
xrandr --output HDMI-1 --primary --mode 1920x1080 --rate 144 --output DVI-D-1 --mode 1600x1200 --rate 60 --left-of HDMI-1 --off
picom &
exec dwm
