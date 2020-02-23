#!/bin/sh

[[ -f $HOME/.Xmodmap ]] && xmodmap $HOME/.Xmodmap

compton-blur --config $HOME/.config/compton.conf &
flashfocus &
exec /usr/bin/i3
