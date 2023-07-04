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
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };
}
