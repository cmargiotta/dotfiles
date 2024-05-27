{ config, pkgs, nixpkgs, unstable, ... }:
{
  home.packages = with pkgs; [
    arandr
    grimblast
    hyprland-protocols
    libnotify
    libGL
    glmark2
    ironbar
    hyprpaper
    jq
    hyprlock
    font-awesome
    nwg-look
    swaynotificationcenter
    pamixer
    rofi-wayland
    slurp
    scratchpad
    gbar
    swappy
    pulseaudio
    waypipe
    wev
    wl-clipboard
    wlr-randr
    xorg.xhost
  ];

  xdg.configFile.wofi = {
    source = ./config/rofi;
    target = "rofi";
    recursive = true;
  };

  xdg.configFile.wal_templates = {
    source = ./config/wal-templates;
    target = "wal/templates";
    recursive = true;
  };
  
  xdg.configFile.ironbar = {
    source = ./config/ironbar;
    target = "ironbar";
    recursive = true;
  };

  xdg.configFile.waybar = {
    source = ./config/waybar;
    target = "waybar";
    recursive = true;
  };

  xdg.configFile.gbar = {
    source = ./config/gBar;
    target = "gBar";
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

  xdg.configFile.eww_config = {
    source = ./config/eww;
    target = "eww";
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  programs.pywal.enable = true;
}
