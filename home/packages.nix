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

    firefox.enable = true;
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
      element-desktop
      mqttui
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
      feishin
      ffmpeg
      flacon
      gimp
      inkscape
      mac
      playerctl
      shntool
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
