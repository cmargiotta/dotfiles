{ config, lib, pkgs, unstable, nur, iceberg, fenix, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Dev
    cutecom
    docker-compose
    esphome
    nix-direnv
    # pgadmin4-desktopmode
    pkg-config
    sqlitebrowser
    wineWowPackages.waylandFull
    winetricks

    # Editors
    lapce
    meld
    nixfmt
    stm32cubemx

    # Internet
    discord
    mongodb-compass
    mqttui
    nextcloud-client
    slack
    freetube
    tdesktop
    tor-browser-bundle-bin

    # Office
    gnome.gnome-calculator
    libsForQt5.kate
    onlyoffice-bin
    libreoffice

    # System
    acpi
    dconf
    eza
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
    pureref
    shntool
    sonixd
    sox

    # 3D printing
    prusa-slicer
    openscad

    # Others
    coreutils-full
    filezilla
    gnome.seahorse
    gobject-introspection
    cinnamon.nemo-with-extensions
    ncdu
    nil
    pinentry-all
    pkg-config
    qt5.qtbase
    xorg.xeyes
    xorg.xrandr
  ] ++ [
    # Python with packages
    (pkgs.python311Full.withPackages (ps: with ps; [
      pygobject3
      requests
    ]))
  ];
}
