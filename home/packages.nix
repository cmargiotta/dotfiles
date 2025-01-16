{ lib
, pkgs
, inputs
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
      nix-direnv
      pkg-config
      sqlitebrowser
      wineWowPackages.waylandFull
      winetricks

      # Editors
      meld
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
      inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default

      # Office
      gnome-calculator
      onlyoffice-bin
      libreoffice

      # System
      acpi
      cava
      dconf
      eza
      inxi
      lm_sensors
      home-manager

      # Media
      feishin
      gthumb
      ffmpeg
      gimp
      inkscape
      mac
      playerctl
      shntool
      sox
      satty

      # 3D printing
      # openscad

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
    ];
}
