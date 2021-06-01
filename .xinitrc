xrdb ~/.Xresources
feh --bg-scale ~/pictures/wallpapers/001.png
xrandr --output DP-4 --primary --mode 1920x1080 --rate 144 --output HDMI-0 --left-of DP-4 --mode 1920x1080 --rate 60
picom &
xsetwacom set 13 MapToOutput 1920x1080+1920+0
exec dwm 
