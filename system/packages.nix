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
    unzip
    wget
    zip
  ];

  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override ({ extraPkgs ? pkgs': [ ], ... }: {
        extraPkgs = pkgs': (extraPkgs pkgs') ++ (with pkgs'; [
          libgdiplus
          freetype
          pango
          libthai
          harfbuzz
          mono
          gtk3
          gtk3-x11
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
