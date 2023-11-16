{ config, pkgs, nixpkgs, eww, unstable, ... }:
{
  home.packages = with pkgs; [
    arandr
    grimblast
    hyprland-protocols
    eww-wayland
    glmark2
    jq
    nwg-look
    rofi-wayland
    slurp
    scratchpad
    hdrop
    swappy
    swayosd
    swww
    wev
    swaynotificationcenter
    watershot
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

  home.file.hyprland_scripts = {
    source = ./config/Hyprland/scripts;
    target = ".config/hypr/scripts";
  };

  home.file.swaync_config = {
    source = ./config/swaync;
    target = ".config/swaync";
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

  services.dunst = {
    enable = true;
    configFile = ./config/dunst;
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
