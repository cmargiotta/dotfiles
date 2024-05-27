#!/usr/bin/env sh

monitors=$(hyprctl monitors -j | jq -r '.[] | .name')

