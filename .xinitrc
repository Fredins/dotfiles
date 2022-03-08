xrdb ~/.Xresources
xrandr --output HDMI-0 --primary --mode 1920x1080 --rate 144 --output DP-0  --off 
feh --bg-scale ~/pictures/wallpapers/012.png
unclutter -idle 3 &
clipmenud &
#xrandr  --output HDMI-0 --primary --mode 1920x1080 --rate 144 --output DP-0  --left-of HDMI-0 --mode 1920x1080 --rate 60
#xmonad
#gosu & 
#dwm
exec startlxqt
