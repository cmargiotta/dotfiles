{ config, lib, pkgs, unstable, iceberg, webcord, fenix, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Dev
    clang-tools
    gcc12
    cmake
    esphome
    llvm
    lua54Packages.lua
    pkg-config
    rustup

    # Editors
    meld
    lapce

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
    openssl
    pavucontrol
    pinentry-gtk2
    sqlitebrowser
    rnix-lsp
    qt5.qtbase
    onlyoffice-bin
    xorg.xeyes
  ];
}
