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

  wayland.windowManager.hyprland.extraConfig = (builtins.readFile ./config/Hyprland/laptop) + "\n" + (builtins.readFile ./config/Hyprland/common);
}
