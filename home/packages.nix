{ config, lib, pkgs, unstable, iceberg, webcord, fenix, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Dev
    direnv
    esphome
    gaphor
    nix-direnv
    pgadmin4-desktopmode
    pkg-config
    python3Full
    cutecom
    sqlitebrowser
    platformio
    wineWowPackages.waylandFull

    # Editors
    lapce
    meld

    # Internet
    mailspring
    mongodb-compass
    mqttui
    nextcloud-client
    spotify
    chromium
    tdesktop
    tor-browser-bundle-bin
    webcord.packages.${pkgs.system}.default

    # Office
    onlyoffice-bin
    qalculate-gtk

    # System
    blueman
    dconf
    pavucontrol

    # Media
    ffmpeg

    # Others
    gnome.seahorse
    libsForQt5.dolphin
    ncdu
    pinentry-qt
    qt5.qtbase
    rnix-lsp
    xorg.xeyes
  ];
}
