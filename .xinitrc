#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Set disable PC speaker
# No bell mode
xset -b

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi


if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi


if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi


if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi


# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Set fonts path
xset +fp /usr/share/fonts/TTF

twm &
xscreensaver &
exec i3
exec urxvt
exec firefox
