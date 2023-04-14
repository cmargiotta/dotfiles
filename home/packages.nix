{ config, lib, pkgs, unstable, iceberg, webcord, fenix, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Dev
    direnv
    esphome
    nix-direnv
    pkg-config

    # Editors
    lapce
    meld

    # Internet
    mailspring
    mqttui
    nextcloud-client
    spotify
    tdesktop
    tor-browser-bundle-bin
    webcord.packages.${pkgs.system}.default

    # Others
    blueman
    dconf
    ffmpeg
    gnome.seahorse
    libsForQt5.dolphin
    ncdu
    onlyoffice-bin
    openssl
    pavucontrol
    pinentry-gtk2
    qt5.qtbase
    rnix-lsp
    sqlitebrowser
    xorg.xeyes
  ];
}
