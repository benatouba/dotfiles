exec xset r rate 400 100
exec xrandr --setprovideroutputsource modesetting NVIDIA-0
exec xrandr --auto
exec xrandr --dpi 200/eDP-1-1
exec xrandr --output HDMI-1-1 --auto --right-of eDP-1-1
exec setxkbmap -layout us,de -option caps:escape -option 'grp:alt_shift_toggle'
exec xrdb -merge ~/.Xresources
exec i3 
