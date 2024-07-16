#!/usr/bin/env sh

run_bars() {
  killall gBar
  killall waybar
  waybar &
  
  ids=$(hyprctl monitors -j | jq -r '.[] | .id')

  for id in $ids; do
    gBar bar "$id"&
  done
}

run_bars

handle() {
  case $1 in
    monitoradded*) run_gBar;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
