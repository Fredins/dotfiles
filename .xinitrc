xrdb ~/.Xresources
feh --bg-scale ~/pictures/wallpapers/001.png
xrandr  --output HDMI-0 --primary --mode 1920x1080 --rate 144 --output DP-4  --left-of HDMI-0 --mode 1920x1080 --rate 60
xsetwacom set 13 MapToOutput 1920x1080+1920+0
exec gocaudices & 
exec dwm 
