FROM ubuntu:latest

RUN apt update && apt install -y wget libgl1 libnss3 libxcomposite1 libxdamage1 libxrender1 libxrandr2 libxtst6 libasound2 libxkbfile1 libegl1 libglib2.0-0 libxkbcommon0 libxkbcommon-x11-0 xkb-data libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 libxcb-sync1 libxcb-xfixes0 libxcb-shape0 libx11-xcb1 libfreetype6 libfontconfig1 libdbus-1-3 libxcb-icccm4

# COPY CHITUBOX_V2.0.0.tar.gz /chitubox/CHITUBOX_V2.0.0.tar.gz

WORKDIR /chitubox

RUN wget "https://sac.chitubox.com/software/download.do?softwareId=17839&softwareVersionId=v2.0.0&fileName=CHITUBOX_V2.0.0.tar.gz"

RUN tar -xzvf CHITUBOX_V2.0.0.tar.gz && \
    rm CHITUBOX_V2.0.0.tar.gz

ENTRYPOINT ["/chitubox/CHITUBOX_Basic_Linux_Installer_V2.0.run"]
