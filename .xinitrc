xrdb ~/.Xresources
feh --bg-scale ~/pictures/wallpapers/light.png
xrandr --output HDMI-0 --mode 1920x1080 --rate 144 --output DP-1  --off 
xsetwacom set 13 MapToOutput 1920x1080+1920+0
exec gosu & 
exec dwm 
