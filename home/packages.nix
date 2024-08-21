{ lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages =
    with pkgs;
    [
      # Dev
      cutecom
      docker-compose
      esphome
      nix-direnv
      pkg-config
      sqlitebrowser
      wineWowPackages.waylandFull
      winetricks
      nixfmt-rfc-style

      # Editors
      meld
      #stm32cubemx
      python3

      # Internet
      discord
      mqttui
      element-desktop
      #nextcloud-client
      slack
      tdesktop
      tor-browser-bundle-bin

      # Office
      gnome-calculator
      onlyoffice-bin
      libreoffice

      # System
      acpi
      dconf
      eza
      inxi
      lm_sensors
      nix-index
      (fastfetch.overrideAttrs (old: {
        cmakeFlags = old.cmakeFlags ++ [ (lib.cmakeBool "ENABLE_IMAGEMAGICK7" true) ];
      }))
      home-manager

      # Media
      ffmpeg
      flacon
      gimp
      mac
      playerctl
      pureref
      shntool
      sonixd
      sox

      # 3D printing
      openscad

      # Others
      coreutils-full
      filezilla
      gobject-introspection
      nemo-with-extensions
      ncdu
      nil
      pinentry-all
      pkg-config
      xorg.xeyes
      xorg.xrandr
    ]
    ++ [

    ];
}
