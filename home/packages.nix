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
      pygobject3
      requests
    ]))
  ];
}
