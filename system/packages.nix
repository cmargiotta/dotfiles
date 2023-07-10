{ lib, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Others
    git
    gnome.gnome-keyring
    gnupg
    htop
    libsecret
    nano
    pass-secret-service
    unzip
    wget
    busybox
    zip
  ];

  programs = {
    dconf.enable = true;
  };
}
