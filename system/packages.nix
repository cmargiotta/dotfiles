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
    zip
  ];

  programs = {
    dconf.enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
