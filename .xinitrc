xrdb ~/.Xresources
#xrandr --output HDMI-0 --primary --mode 1920x1080 --rate 144 --output DP-0  --off 
feh --bg-scale ~/pictures/wallpapers/004.png
xsetwacom set 16 MapToOutput 1920x1080+1920+0
wacom
clipmenud &
exec gosu & 
exec dwm 
