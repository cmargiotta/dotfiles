{ lib, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Build
    clang
    gdb
    meson
    ninja

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

  programs.dconf.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses";
    enableSSHSupport = true;
  };
}
