{ config, pkgs, nixpkgs, eww, unstable, ... }:
{
  home.packages = with pkgs; [
    grimblast
    hyprland-protocols
    flameshot
    nwg-look
    nwg-panel
    rofi-wayland
    slurp
    swayosd
    swww
    waybar
    wl-clipboard
    wlr-randr
  ];

  home.file.wofi = {
    source = ./config/rofi;
    target = ".config/rofi";
    recursive = true;
  };

  home.file.lock = {
    source = ./config/lock.sh;
    target = ".config/swaylock.sh";
    executable = true;
  };

  home.file.panel_settings = {
    source = ./config/panel/common-settings.json;
    target = ".config/nwg-panel/common-settings.json";
  };

  home.file.waybar = {
    source = ./config/waybar/config;
    target = ".config/waybar/config";
  };

  home.file.dunst = {
    source = ./config/dunst;
    target = ".config/dunst/config";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    xwayland = {
      enable = true;
    };
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  services = {
    dunst = {
      enable = true;
      configFile = "$XDG_CONFIG_HOME/dunst/config";
    };
  };

  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "firefox.desktop";
      };
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
