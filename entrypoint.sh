#!/bin/sh -x

Xvfb :1 -screen 0 1024x768x16 &
DISPLAY=:1 x11vnc -passwd password -forever -shared -rfbport 5900 &
/usr/local/novnc/utils/novnc_proxy --vnc localhost:5900 --listen 6080 &

jupyter-lab
