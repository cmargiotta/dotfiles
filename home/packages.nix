{ config, lib, pkgs, unstable, nur, iceberg, fenix, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Dev
    cutecom
    docker-compose
    esphome
    gaphor
    nix-direnv
    pgadmin4-desktopmode
    pkg-config
    sqlitebrowser
    wineWowPackages.waylandFull

    # Editors
    lapce
    meld
    stm32cubemx

    # Gaming
    gamemode

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
    acpi
    dconf
    eza
    immersed-vr
    inxi
    lm_sensors
    nix-index
    fastfetch
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
    sox

    # Others
    coreutils-full
    filezilla
    gnome.seahorse
    gobject-introspection
    cinnamon.nemo-with-extensions
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
