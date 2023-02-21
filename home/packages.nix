{ config, lib, pkgs, unstable, iceberg, webcord, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Dev
    clang-tools
    gcc12
    cmake
    esphome
    llvm
    pkg-config
    lapce

    # Editors
    meld

    # Internet
    webcord.packages.${pkgs.system}.default
    mailspring
    mqttui
    nextcloud-client
    spotify
    tdesktop
    mqttui
    tor-browser-bundle-bin

    # Others
    blueman
    dconf
    ffmpeg
    gnome.seahorse
    libsForQt5.dolphin
    ncdu
    pavucontrol
    pinentry-gtk2
    sqlitebrowser
    rnix-lsp
    qt5.qtbase
    onlyoffice-bin
    xorg.xeyes
  ];
}
