[ -f $XDG_CONFIG_HOME/xmodmap/xmodmap.workman ] && xmodmap $XDG_CONFIG_HOME/xmodmap/xmodmap.workman
xset r rate 300 40

feh --bg-scale $XDG_PICTURES_DIR/wallpaper.png --no-fehbg
sxhkd &
dunst &
dwmbar &
unclutter &
udiskie &

exec dwm
