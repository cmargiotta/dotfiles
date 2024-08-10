{
  config,
  pkgs,
  lib,
  unstable,
  ...
}:
{
  home.packages = with pkgs; [
    arandr
    font-awesome
    glmark2
    grimblast
    hyprcursor
    hyprland-protocols
    hyprlock
    hyprpaper
    jq
    libGL
    libnotify
    nwg-look
    pamixer
    pulseaudio
    rofi-wayland
    scratchpad
    slurp
    swappy
    swaynotificationcenter
    waypipe
    wev
    wl-clipboard
    wlr-randr
    xorg.xhost
    xwayland
  ];

  xdg.configFile.wofi = {
    source = ./config/rofi;
    target = "rofi";
    recursive = true;
  };

  xdg.configFile.waybar = {
    source = ./config/waybar;
    target = "waybar";
    recursive = true;
  };

  xdg.configFile.wal_templates = {
    source = ./config/wal-templates;
    target = "wal/templates";
    recursive = true;
  };

  xdg.configFile.swaync = {
    source = ./config/swaync;
    target = "swaync";
    recursive = true;
  };

  xdg.configFile.hyprland_scripts = {
    source = ./config/Hyprland/scripts;
    target = "hypr/scripts";
  };

  xdg.configFile.hyprlock = {
    source = ./config/Hyprland/hyprlock.conf;
    target = "hypr/hyprlock.conf";
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  programs.pywal.enable = true;
}
