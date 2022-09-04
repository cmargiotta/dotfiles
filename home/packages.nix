{ config, pkgs, unstable, webcord, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Dev
    clang-tools
    cmake
    llvm
    pkg-config

    # Editors
    meld

    # Internet
    webcord.packages.${pkgs.system}.default
    mailspring
    nextcloud-client
    tdesktop

    # Office
    onlyoffice-bin

    # Others
    blueman
    gnome.seahorse
    libsForQt5.dolphin
    ncdu
    pavucontrol
    sqlitebrowser
    rnix-lsp
  ];
}
