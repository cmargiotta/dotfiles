{ inputs
, lib
, pkgs
, ...
}:
{
  nixpkgs.config.allowUnfree = true;

  programs = {
    ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };
  };

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

      # Games
      prismlauncher

      # Internet
      discord
      mqttui
      cinny-desktop
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
      inkscape
      mac
      playerctl
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
      jdk17
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
