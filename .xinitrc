xscreensaver -no-splash &
xrandr --output DP-2 --primary
xrandr --output DP-2 --left-of DP-1
setxkbmap -layout us,ru -option grp:caps_toggle
exec i3 -c $HOME/.config/i3/config-mod4
