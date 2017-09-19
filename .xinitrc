xscreensaver -no-splash &
setxkbmap -layout us,ru -option grp:alt_shift_toggle
exec i3 -c $HOME/.config/i3/config-mod4
