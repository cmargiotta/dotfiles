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
    docker-compose
    python3Full
    cutecom
    sqlitebrowser
    podman-compose
    # wineWowPackages.waylandFull

    # Editors
    lapce
    meld
    stm32cubemx

    # Internet
    mongodb-compass
    mqttui
    nextcloud-client
    slack
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
    shntool
    flacon
    picard
    mac

    # Others
    gnome.seahorse
    libsForQt5.dolphin
    ncdu
    filezilla
    pinentry-qt
    qt5.qtbase
    rnix-lsp
    xorg.xeyes
  ];
}
