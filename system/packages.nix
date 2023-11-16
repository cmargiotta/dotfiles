{ lib, config, pkgs, nixpkgs, ... }:
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
    socat
    unzip
    wget
    zip
  ];

  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override ({ extraPkgs ? pkgs': [ ], ... }: {
        extraPkgs = pkgs': (extraPkgs pkgs') ++ (with pkgs'; [
          freetype
          gtk3
          gtk3-x11
          harfbuzz
          libgdiplus
          libthai
          mono
          pango
          zlib
        ]);

      });
    })
  ];

  programs = {
    dconf.enable = true;
    hyprland.enable = true;
    steam = {
      enable = true;
    };
  };
}
