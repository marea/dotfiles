#!/bin/bash
pkill -9 nm-applet
pkill -9 pa-applet
pkill -9 megasync
pkill -9 cbatticon
pkill -9 picom
pkill -9 pamac-tray
pkill -9 dwmstatus
pkill -9 unclutter
xrdb ~/.Xresources &
nm-applet &
pa-applet &
setxkbmap -option compose:ralt &
xinput set-prop 'SynPS/2 Synaptics TouchPad'\ 
  'libinput Disable While Typing Enabled' 0 &
~/.fehbg &
# udiskie -ant &
# twmnd &
transmission-daemon
megasync &
cbatticon &
picom -b &
unclutter -idle 3 &
pamac-tray &
videowall ~/.wallpaper.mp4 &
dwmstatus &
