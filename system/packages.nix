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

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override ({ extraPkgs ? pkgs': [ ], ... }: {
        extraPkgs = pkgs': (extraPkgs pkgs') ++ (with pkgs'; [
          curl
          freetype
          gtk3
          gtk3-x11
          harfbuzz
          keyutils
          krb5
          libgdiplus
          libidn2
          libpsl
          libthai
          mono
          nghttp2
          openssl_1_1
          pango
          rtmpdump
          zlib
        ]);
      });
    })
  ];

  programs = {
    steam.enable = true;

    gamemode = {
      enable = true;
      enableRenice = true;
    };

    hyprland = {
      enable = true;
    };

    dconf = {
      enable = true;
    };
  };
}
