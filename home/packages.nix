{ config, lib, pkgs, unstable, iceberg, fenix, ... }:
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
    sqlitebrowser
    wineWowPackages.waylandFull

    # Editors
    lapce
    meld
    stm32cubemx

    # Internet
    discord
    mongodb-compass
    mqttui
    nextcloud-client
    slack
    tdesktop
    tor-browser-bundle-bin

    # Office
    gnome.gnome-calculator
    libsForQt5.kate
    onlyoffice-bin
    qalculate-gtk

    # System
    dconf
    inxi
    lm_sensors
    neofetch
    pavucontrol

    # Media
    ffmpeg
    flacon
    gimp
    mac
    picard
    playerctl
    shntool
    sonixd

    # Others
    coreutils-full
    filezilla
    gnome.seahorse
    gobject-introspection
    libsForQt5.dolphin
    ncdu
    pinentry-qt
    pkg-config
    prusa-slicer
    qt5.qtbase
    rnix-lsp
    xorg.xeyes
    xorg.xrandr
  ] ++ [
    # Python with packages
    (pkgs.python311Full.withPackages (ps: with ps; [
      dbus-python
      mpd2
      pygobject3
      requests
      virtualenv
    ]))
  ];
}
