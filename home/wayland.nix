{ pkgs, ... }:
{
  imports = [
    wayland/hyprland.nix
    wayland/hyprlock.nix
    wayland/waybar.nix
  ];

  home.packages = with pkgs; [
    arandr
    font-awesome
    glmark2
    grimblast
    hyprcursor
    hyprland-protocols
    jq
    kdePackages.wayland-protocols
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

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = true;
    };
  };
  programs.pywal.enable = true;
}
