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
transmission-gtk &

DEFAULT_SESSION=awesome
case $1 in
  awesome)
        exec awesome
        ;;
  openbox-session)
        exec openbox-session
        ;;
  *)
        exec $DEFAULT_SESSION
        ;;
esac
