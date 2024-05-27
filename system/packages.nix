{ inputs, lib, config, pkgs, nixpkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Others
    busybox
    duf
    fd
    git
    glibcLocales
    gnome.gnome-keyring
    gnupg
    btop
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
          libkrb5
          libpng
          libpsl
          libpulseaudio
          libthai
          libvorbis
          mono
          nghttp2
          openssl_1_1
          pango
          rtmpdump
          stdenv.cc.cc.lib
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
          zlib
        ]);
      });
    })
  ];

  programs = {
    steam = {
      enable = true;
      platformOptimizations.enable = true;
    };

    hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };

    waybar = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };

    dconf = {
      enable = true;
    };
  };
}
