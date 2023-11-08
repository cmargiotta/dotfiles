{ lib, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Others
    busybox
    git
    glibcLocales
    gnome.gnome-keyring
    gnupg
    htop
    libsecret
    nano
    ntfs3g
    pass-secret-service
    unzip
    wget
    zip
  ];

  programs = {
    dconf.enable = true;
    hyprland.enable = true;
  };
}
