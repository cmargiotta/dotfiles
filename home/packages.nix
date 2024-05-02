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
    meld
    nixfmt-rfc-style
    #stm32cubemx
    python3

    # Internet
    discord
    mqttui
    #nextcloud-client
    slack
    tdesktop
    tor-browser-bundle-bin

    # Office
    gnome.gnome-calculator
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
    quickemu
    home-manager
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
    gobject-introspection
    cinnamon.nemo-with-extensions
    ncdu
    nil
    pinentry-all
    pkg-config
    xorg.xeyes
    xorg.xrandr
  ];
}
