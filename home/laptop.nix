{ config, pkgs, lib, ... }:
{
  home.file.wallpapers = {
    source = ./wallpapers/laptop;
    target = ".wallpapers";
    recursive = true;
  };

  home.file.waybar = {
    source = ./config/waybar/laptop;
    target = ".config/waybar/config";
  };

  home.packages = with pkgs; [
    brightnessctl
  ];

  programs = {
    mako = {
      enable = true;
      backgroundColor = "#2e3440";
      borderColor = "#88c0d0";
      borderRadius = 15;
      borderSize = 2;
      height = 110;
      icons = true;
      layer = "overlay";
      width = 300;
    };
  };

  wayland.windowManager.hyprland.extraConfig = (builtins.readFile ./config/Hyprland/laptop) + "\n" + (builtins.readFile ./config/Hyprland/common);

  home.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_QPA_PLATFORM = "wayland;xcb";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_RENDERER = "vulkan";
  };
}
