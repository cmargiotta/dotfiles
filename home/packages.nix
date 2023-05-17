{ config, lib, pkgs, unstable, iceberg, webcord, fenix, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Dev
    direnv
    esphome
    nix-direnv
    pgadmin4-desktopmode
    pkg-config
    sqlitebrowser

    # Editors
    lapce
    meld

    # Internet
    mailspring
    mongodb-compass
    mqttui
    nextcloud-client
    spotify
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
