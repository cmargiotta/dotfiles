#!/usr/bin/env sh

monitors=$(hyprctl monitors -j | jq -r '.[] | .name')

random_wallpaper_file() {
    fd --type file --extension jpg '.*' ~/.wallpapers/ | shuf -n 1
}

wallpaper=$(random_wallpaper_file)
wal -i $wallpaper

for monitor in $monitors; do
    hyprctl hyprpaper preload $wallpaper
    hyprctl hyprpaper wallpaper `echo "$monitor,$wallpaper"`

    wallpaper=$(random_wallpaper_file)
done

ln -s $(random_wallpaper_file) ~/.lock_wallpaper.jpg
