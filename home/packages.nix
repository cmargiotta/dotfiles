{ config, lib, pkgs, unstable, iceberg, webcord, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Dev
    clang-tools
    clang_14
    cmake
    esphome
    llvm
    pkg-config

    # Editors
    meld

    # Internet
    webcord.packages.${pkgs.system}.default
    mailspring
    nextcloud-client
    spotify
    tdesktop

    # Others
    blueman
    dconf
    gnome.seahorse
    libsForQt5.dolphin
    ncdu
    pavucontrol
    pinentry-gtk2
    sqlitebrowser
    rnix-lsp
    qt5.qtbase
    onlyoffice-bin
  ];
}
