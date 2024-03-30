#!/usr/bin/env bash

xhost +local:docker

if [ -z "$(sudo docker images -q chitubox:done 2> /dev/null)" ]; then
    sudo docker load -i ~/dotfiles/chitubox/chitubox.tar.gz
fi

sudo docker run --device /dev/dri/card1:/dev/dri/card1 --device /dev/dri/renderD128:/dev/dri/renderD128  -e XDG_RUNTIME_DIR=/tmp -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw -v ~/.local/share/chitubox2_0:/root/.local/share/chitubox2_0 -v ~:/mnt:rw -it --entrypoint /opt/CBD/CHITUBOX_Basic/CHITUBOX_Basic.sh chitubox:done --no-sandbox