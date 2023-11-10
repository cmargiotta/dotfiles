{ config, lib, pkgs, unstable, iceberg, webcord, fenix, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Dev
    cutecom
    direnv
    docker-compose
    esphome
    gaphor
    nix-direnv
    pgadmin4-desktopmode
    pkg-config
    podman-compose
    python3Full
    sqlitebrowser
    wineWowPackages.waylandFull

    # Editors
    lapce
    meld
    stm32cubemx

    # Internet
    mongodb-compass
    mqttui
    nextcloud-client
    slack
    tdesktop
    tor-browser-bundle-bin
    webcord.packages.${pkgs.system}.default

    # Office
    gnome.gnome-calculator
    onlyoffice-bin
    qalculate-gtk

    # System
    blueman
    dconf
    pavucontrol

    # Media
    ffmpeg
    flacon
    gimp
    mac
    picard
    shntool

    # Others
    filezilla
    gnome.seahorse
    libsForQt5.dolphin
    ncdu
    pinentry-qt
    prusa-slicer
    qt5.qtbase
    rnix-lsp
    xorg.xrandr
    xorg.xeyes
  ];
}
