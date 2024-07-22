#!/usr/bin/env sh

run_bars() {
  killall waybar
  waybar &
}

run_bars

handle() {
  case $1 in
    monitoradded*) run_bars;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
