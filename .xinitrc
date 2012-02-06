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

DEFAULT_SESSION=awesome
case $1 in
  awesome|xmonad) exec $1 ;;
  *) exec $DEFAULT_SESSION ;;
esac

#exec awesome
