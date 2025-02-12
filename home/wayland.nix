{ pkgs, lib, ... }:
{
  imports = [
    wayland/hyprland.nix
    wayland/hyprlock.nix
    wayland/hyprpanel.nix
  ];

  home.packages = with pkgs; [
    arandr
    font-awesome
    glmark2
    jq
    kdePackages.wayland-protocols
    libGL
    libnotify
    nwg-look
    pamixer
    pulseaudio
    rofi-wayland
    scratchpad
    # waypipe
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

  xdg.configFile.hyprland_env = {
    source = ./config/Hyprland/env;
    target = ".config/uwsm/env-hyprland";
  };
}
