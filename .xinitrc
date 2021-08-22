xrdb ~/.Xresources
#xrandr --output HDMI-0 --primary --mode 1920x1080 --rate 144 --output DP-0  --off 
feh --bg-scale ~/pictures/wallpapers/dark.png
xsetwacom set 13 MapToOutput 1920x1080+1920+0
clipmenud &
exec gosu & 
exec dwm 
