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

  xdg.configFile.lock = {
    source = ./config/lock.sh;
    target = "swaylock.sh";
    executable = true;
  };
  
  xdg.configFile.ironbar = {
    source = ./config/ironbar;
    target = "ironbar";
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

  xdg.configFile.eww_config = {
    source = ./config/eww;
    target = "eww";
  };

  #wayland.windowManager.hyprland = {
  #  enable = true;
  #  xwayland = {
  #    enable = true;
  #  };
  #};

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  programs.pywal.enable = true;
}
