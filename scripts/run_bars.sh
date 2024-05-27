#!/usr/bin/env sh

run_gBar() {
  killall gBar
  ids=$(hyprctl monitors -j | jq -r '.[] | .id')

  for id in $ids; do
    gBar bar "$id"&
  done
}

run_gBar
waybar &

handle() {
  case $1 in
    monitoradded*) run_gBar;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
