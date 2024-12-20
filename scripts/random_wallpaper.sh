#!/usr/bin/env sh

monitors=$(hyprctl monitors -j | jq -r '.[] | .name')

random_wallpaper_file() {
    w=$1
    h=$2
    path="$HOME/.wallpapers/${w}x$h"

    fd --type file --extension jpg --extension jpeg '.*' "$path" | shuf -n 1
}

for monitor in $monitors; do
    echo "$monitor"
    width=$(hyprctl monitors -j | jq -r ".[] | select(.name == \"$monitor\") | .width")
    height=$(hyprctl monitors -j | jq -r ".[] | select(.name == \"$monitor\") | .height")

    echo "Detected resolution: ${width}x${height}"

    wallpaper=$(random_wallpaper_file "$width" "$height")

    echo "Loading $wallpaper"

    hyprctl hyprpaper preload "$wallpaper"
    hyprctl hyprpaper wallpaper "${monitor},${wallpaper}"
done

ln -sf "$(random_wallpaper_file "lockscreen")" ~/.lock_wallpaper.jpg
