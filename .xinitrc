#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrdb ~/.Xresources

export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim
export XMODIFIERS="@im=fcitx"
export SDL_AUDIODRIVER="alsa"

fcitx &
wakoopa &
wicd-client &
transmission-gtk &

exec awesome
#exec ck-launch-session awesome
